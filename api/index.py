from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__, template_folder='../templates', static_folder='../static')

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://neondb_owner:npg_Gx1CTwpB5zuR@ep-lively-glitter-bdjqe82z-pooler.c-8.us-east-2.aws.neon.tech/final_layihesi?sslmode=require&channel_binding=require'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

@app.route('/')
def home():
    return "Sayt uğurla işləyir!"