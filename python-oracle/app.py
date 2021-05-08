from flask import Flask, render_template, session, request, redirect
app = Flask(__name__)
app.secret_key = 'super secret key'

@app.route('/login', methods=['GET', 'POST'])
def hello_world():
    render_template('login.html')
    error = None
    if request.method == 'POST':
        if request.form['username'] == 'admin' and request.form['password'] == 'dear':
            session['admin'] = request.form['username']
            return render_template('index.html')
        else:
            error = 'Invalid Credentials. Please try again.'
    return render_template('login.html', error=error)



@app.route('/', methods=['GET', 'POST'])
def form_example():
    if 'admin' not in session:
        return redirect('http://127.0.0.1:5000/login',200)        
    else:
        return render_template('index.html')
