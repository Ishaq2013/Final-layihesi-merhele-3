from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy

# Şablon və statik qovluqların yerini bir pillə yuxarıda (kökdə) göstəririk
app = Flask(__name__, template_folder='../templates', static_folder='../static')

# Neon.tech verilənlər bazası bağlantısı
app.config['SQLALCHEMY_DATABASE_URI'] = 'BURAYA_NEON_BAGLANTI_LINKINI_YAZIN'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# Cədvəl modelləriniz və route-larınız burada olmalıdır
@app.route('/')
def home():
    return render_template('index.html') # Və ya ana səhifə şablonunuz

# Əgər Vercel serverless üçün tələb olunursa:
# app bütün routeları idarə edir