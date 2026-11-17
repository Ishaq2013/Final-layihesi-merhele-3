import os
from flask import Flask, render_template

basedir = os.path.abspath(os.path.dirname(__file__))
app = Flask(__name__, 
            template_folder=os.path.join(basedir, '../templates'),
            static_folder=os.path.join(basedir, '../static'))

@app.route('/')
def index():
    return "Sayt işləyir!"