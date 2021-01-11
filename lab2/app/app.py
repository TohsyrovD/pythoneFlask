from flask import Flask, render_template, url_for, request, make_response


app = Flask(__name__)
application = app

operate=['+','-','(',')','.',' ']    

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/args')
def args():
    return render_template('args.html')

@app.route('/headers')
def headers():
    return render_template('headers.html')

@app.route('/cookies')
def cookies():
    resp= make_response( render_template('cookies.html'))
    if 'username' in request.cookies:
 #  юзера и сам -значения,  время жизни куки -ноль, 
        resp.set_cookie('username','some name',expires=0)
    else:
        resp.set_cookie('username','some name')
    return resp

@app.route('/form', methods=['GET', 'POST'])
def form():
    return render_template('form.html')
#  render_template - возвращает строку; make_response -принимает строку с телом ответа


@app.route('/telefon',methods=['GET', 'POST'])
def telefon():
    tel=request.form.get('Tel')
    result=None
    error=None           
    
    if tel != None:
        i=0
        if tel.find('-') !=-1:
            tel=tel.replace('-','')
            i=1
        if tel.find('+') !=-1:
            tel=tel.replace('+','')   
            i=1       
        if tel.find('.') !=-1:
            tel=tel.replace('.','')
            i=1
        if tel.find('(') !=-1:
            tel=tel.replace('(','')
            i=1
        if tel.find(')') !=-1:
            tel=tel.replace(')','')
            i=1
        if tel.find(' ') !=-1:
            tel=tel.replace(' ','')
            i=1

        if i==0:
         error='Недопустимый ввод. В номере телефона встречаются недопустимые символы.'    
        
        if tel.isdigit():
            if len(tel) == 10:
                result = '8-{}-{}-{}-{}'.format(tel[0:3], tel[3:6], tel[6:8], tel[8:])
            elif len(tel) == 11:
                if tel[0] == '7':
                    result = '8-{}-{}-{}-{}'.format(tel[1:4], tel[4:7], tel[7:9], tel[9:])
                elif tel[0] == '8':
                    result = '8-{}-{}-{}-{}'.format(tel[1:4], tel[4:7], tel[7:9], tel[9:])
            else:
                error='Недопустимый ввод. Неверное количество цифр.'
    else:
        error='Не введен номер телефона.'
    return render_template('telefon.html',result=result,error=error)