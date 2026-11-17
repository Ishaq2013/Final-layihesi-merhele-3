import os
from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

def create_app():
    basedir = os.path.abspath(os.path.dirname(__file__))
    app = Flask(__name__, 
                template_folder=os.path.join(basedir, '../templates'),
                static_folder=os.path.join(basedir, '../static'))

    app.config['TEMPLATES_AUTO_RELOAD'] = True
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://neondb_owner:npg_Gx1CTwpB5zuR@ep-lively-glitter-bdjqe82z-pooler.c-8.us-east-2.aws.neon.tech/neondb?sslmode=require'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    db.init_app(app)
    return app

app = create_app()

# Cədvəl modelləri
class Activities(db.Model): 
    __tablename__ = 'activities'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), unique=True, nullable=False)
    category = db.Column(db.String(100), nullable=False)

class Companions(db.Model):
    __tablename__ = 'companions'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), unique=True, nullable=False)

class Responses(db.Model):
    __tablename__ = 'responses'
    id = db.Column(db.Integer, primary_key=True)
    personal_name = db.Column(db.Integer, db.ForeignKey('personal_info.id'), nullable=False)    
    age = db.Column(db.Integer, nullable=False)
    grade = db.Column(db.Integer, nullable=False)
    free_day = db.Column(db.String(20), nullable=False)
    activity_id = db.Column(db.Integer, db.ForeignKey('activities.id'), nullable=False)
    companion_id = db.Column(db.Integer, db.ForeignKey('companions.id'), nullable=False)
    hours_per_day = db.Column(db.Numeric(3,1), nullable=False)
    satisfaction = db.Column(db.Numeric(3,1), nullable=False)

class PersonalInfo(db.Model):
    __tablename__ = 'personal_info'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(20), nullable=False)
    email = db.Column(db.String(30), nullable=False)

@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template('index.html')

@app.route('/cavab', methods=['GET', 'POST'])
def cavab():
    if request.method == 'POST':
        name = request.form.get('name', '').capitalize()
        activity_name = request.form.get('activity', '').capitalize()
        category_name = request.form.get('category', '')
        companion_name = request.form.get('companion', '')
        age = int(request.form.get('age', 0))
        grade = int(request.form.get('grade', 0))
        free_day = request.form.get('free_day', '')
        hours_per_day = float(request.form.get('hours_per_day', 0.0))
        satisfaction = float(request.form.get('satisfaction', 0.0))
        email = request.form.get('email', '')

        with app.app_context():
            act = Activities.query.filter_by(name=activity_name).first()
            if not act:
                act = Activities(name=activity_name, category=category_name)
                db.session.add(act)
                db.session.commit()

            comp = Companions.query.filter_by(name=companion_name).first()
            if not comp:
                comp = Companions(name=companion_name)
                db.session.add(comp)
                db.session.commit()

            per_info = PersonalInfo.query.filter_by(name=name).first()
            if not per_info:
                per_info = PersonalInfo(name=name, email=email)
                db.session.add(per_info)
                db.session.commit()

            yeni_response = Responses(
                personal_name=per_info.id,
                age=age,
                grade=grade,
                free_day=free_day,
                activity_id=act.id,
                companion_id=comp.id,
                hours_per_day=hours_per_day,
                satisfaction=satisfaction
            )
            db.session.add(yeni_response)
            db.session.commit()

        return render_template('cavab.html',
            name=name, 
            activity=activity_name, 
            category=category_name, 
            companion=companion_name, 
            age=age, 
            grade=grade, 
            free_day=free_day, 
            hours_per_day=hours_per_day, 
            satisfaction=satisfaction, 
            email=email
        )
    return render_template('index.html')