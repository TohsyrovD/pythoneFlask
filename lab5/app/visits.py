import io
import math
import datetime
from flask import Flask,Blueprint, render_template, request, redirect, url_for, flash, send_file
from flask_login import LoginManager, UserMixin, current_user, login_user, logout_user, login_required
from app import mysql

# количество записей на страницу 
PER_PAGE = 5

bp = Blueprint('visits', __name__, url_prefix='/visits')

def convert_to_csv(records):
    fields = records[0]._fields
    #зоголовок  в таблице 
    result = 'No,' + ','.join(fields) + '\n'
    # для получение пар идекса и записи
    for i,record in enumerate(records):
        result +=f'{i + 1},' + ','.join([str(getattr(record, f, '')) for f in fields]) + '\n'
    return result

def generate_report(records):
    # создаем буфер для временного хранения 
    buffer = io.BytesIO()
    # записываем сгенирированные данные (возвращает данные в виде строки файла csv ( encode- превращает строку в последовательность байт))
    buffer.write(convert_to_csv(records).encode())
    # считаывание с начала из файла ( для повторного считывания)
    buffer.seek(0)
    return buffer
    

@bp.route('/logs')
def logs():
    # пагинация 
    page = request.args.get('page', 1, type=int)
    #подсчет количества строк
    with mysql.connection.cursor(named_tuple=True) as cursor:
        cursor.execute('SELECT count(*) AS count FROM visit_logs;')
        #выводится из запроса одна строка 
        total_count = cursor.fetchone().count
        #округление в большую сторону -cell 
    total_pages= math.ceil(total_count/PER_PAGE)
    #словарь с информацией 
    pagination_info = {
        'current_page': page,
        'total_pages': total_pages,
        'per_page': PER_PAGE
    }
    query = '''
        SELECT visit_logs.*, users2.first_name, users2.last_name, users2.middle_name
        FROM users2 right outer join visit_logs on users2.id = visit_logs.user_id
        ORDER BY visit_logs.created_at DESC
        LIMIT %s OFFSET %s;
    '''
    cursor =  mysql.connection.cursor(named_tuple=True)
    cursor.execute(query, (PER_PAGE, PER_PAGE*(page-1)))
    records = cursor.fetchall()
    cursor.close()
    return render_template('visits/logs.html', records=records, pagination_info=pagination_info)

# рендеринг шаблона юзерс 
@bp.route('/stat/users')
def users_stat():
    query= '''
        SELECT users2.id, users2.last_name, users2.first_name, users2.middle_name, count(*) AS count
        FROM users2 RIGHT OUTER JOIN visit_logs on users2.id = visit_logs.user_id
        GROUP BY users2.id
        ORDER BY count DESC;
    '''

    cursor =  mysql.connection.cursor(named_tuple=True)
    cursor.execute(query)
    records = cursor.fetchall()
    cursor.close()
    
    # если в запросе был перелан аргумент '...', тогда вместо страницы отправляем пользователю отчет csv
    if request.args.get('download_csv'):
        # 
        f = generate_report(records)
        #формируем название файлаы
        filename = datetime.datetime.now().strftime('%d_%m_%Y_%H_%M_%S') + '_users_stat.csv'
    #для скачивания предлагаемого файла, as_attachment=True- позволяет скачсать файл на устройство.
        return send_file(f, as_attachment=True, attachment_filename=filename, mimetype='text/csv')
    return render_template('visits/users.html', records=records)



@bp.route('/stat/pages')
def pages_stat():
    query= '''
        SELECT path, count(*) as count
        FROM visit_logs 
        GROUP BY path
        ORDER BY count DESC;
    '''
    cursor =  mysql.connection.cursor(named_tuple=True)
    cursor.execute(query)
    records = cursor.fetchall()
    cursor.close()
    if request.args.get('download_csv'):
        f = generate_report(records)
        filename = datetime.datetime.now().strftime('%d_%m_%Y_%H_%M_%S') + '_pages_stat.csv'
        return send_file(f, as_attachment=True, attachment_filename=filename, mimetype='text/csv')
    return render_template('visits/pages.html', records=records)