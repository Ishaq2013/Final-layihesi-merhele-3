import os
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    try:
        # Kitabxanaları və bağlantını yoxlayırıq
        import psycopg2
        from flask_sqlalchemy import SQLAlchemy
        
        basedir = os.path.abspath(os.path.dirname(__file__))
        app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://neondb_owner:npg_Gx1CTwpB5zuR@ep-lively-glitter-bdjqe82z-pooler.c-8.us-east-2.aws.neon.tech/neondb?sslmode=require'
        app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
        
        db = SQLAlchemy(app)
        
        # Bazaya test sorğusu
        with app.app_context():
            db.session.execute(db.text('SELECT 1'))
            
        return "Verilənlər bazası bağlantısı uğurla quruldu!"
    except Exception as e:
        return f"XƏTANIN DƏQİQ SƏBƏBİ: {str(e)}"