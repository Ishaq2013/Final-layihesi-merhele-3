import os
from flask import Flask, render_template

app = Flask(__name__, 
            template_folder=os.path.abspath(os.path.join(os.path.dirname(__file__), '../templates')),
            static_folder=os.path.abspath(os.path.join(os.path.dirname(__file__), '../static')))

@app.route('/', methods=['GET', 'POST'])
def index():
    try:
        # 1. İlk olaraq Flask-SQLAlchemy və bazanı sınaqdan keçiririk
        import psycopg2
        from flask_sqlalchemy import SQLAlchemy
        
        app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://neondb_owner:npg_Gx1CTwpB5zuR@ep-lively-glitter-bdjqe82z-pooler.c-8.us-east-2.aws.neon.tech/neondb?sslmode=require'
        app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
        
        db = SQLAlchemy(app)
        
        # 2. Şablonun (index.html) mövcudluğunu yoxlayırıq
        return render_template('index.html')
        
    except Exception as e:
        # Əgər hər hansı xəta varsa, gizlənməyəcək, birbaşa ekranda oxuyacağıq!
        return f"<h1 style='color: red;'>KRİTİK XƏTA BAŞ VERDİ:</h1><pre>{str(e)}</pre>"