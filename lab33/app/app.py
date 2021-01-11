from flask import Flask, render_template, request, session, redirect, url_for, flash
from flask_login import LoginManager, UserMixin, login_user, logout_user, login_required

login_manager=LoginManager()

app = Flask(__name__)
application = app

login_manager.init_app(app)
# для входа, если будут загружать секретную страницу
login_manager.login_view='login'
login_manager.login_massage='Для доступа к данной странице необходимо пройти аутентификацию'
login_manager.login_massage_category='warning'

app.config.from_pyfile('config.py')

def get_users():
    return [{'user_id': '1', 'login':'user', 'password':'qwerty'}]



class User(UserMixin):
    def __init__(self, user_id, login, password):
        super().__init__()
        # фласк логина для юзер миксин
        self.id = user_id
        self.login = login
        self.password = password

@login_manager.user_loader
def load_user(user_id):
    # принимает переменную и сравнивает есть ли уже такой юзер
    for user in get_users():
        if user['user_id'] == user_id: 
            # возващает юзера
            return User(**user)
    return None

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/visits')
# подсчет посещения данной страницы с помощью пароля
def visits():
    if session.get('visits'):
       session['visits'] +=1
    else:
        session['visits'] = 1
    return render_template('visits.html')

@app.route('/login', methods=['GET','POST'])
def login():
    # обработка данных поступивших из формы и вывод формы
    if request.method == 'POST':
        login = request.form.get('login')
        password = request.form.get('password')
        remember_me= request.form.get('remember_me') == 'on'
# Вход пользователя:      
        # если существуют логин и пароль то проводим проверку по всем пользвателям на совпадения 
        if login and password:
            for user in get_users():
                # если он найлен
                if user['login'] == login and user['password'] == password:
                    user_object = User(**user) 
                    login_user(user_object, remember=remember_me)
                   # передаем данные этого пользователя
            
                   #сообщение при входе
                    flash('Вы успешно аутентифицированы.','success')
                    
                    next = request.args.get('next')

                    #    попадаем на траницу индекс
                    return redirect( next or url_for('index'))
        flash('Введены неверные логин и/или пароль.','danger')
    return render_template('login.html')

@app.route('/logout')
def logout():
    logout_user()   
    # logout_user() - удаляет данные пользователя из куки файла
    return redirect(url_for('index'))
# попадаем на траницу индекс



@app.route('/secret_page')
@login_required
def secret_page():
    return render_template('secret_page.html')