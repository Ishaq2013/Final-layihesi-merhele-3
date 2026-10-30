from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

baza_adı = "postgres"
aktivlik_cədvəli = "activities"
yoldaş_cədvəli = "companions"
cavablar_cədvəli = "responses"

app.config['SQLALCHEMY_DATABASE_URI'] = f'postgresql://postgres@localhost:5432/{baza_adı}'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
# kommentləri özüm yazzmışam

# activities cədvəli üçün model yəni məlumatın gəlib düşdüyü struktur
class activities(db.Model): 
    __tablename__ = aktivlik_cədvəli
    id = db.Column(db.Integer, primary_key=True) # fəaliyyətin id-si
    name = db.Column(db.String(50), unique=True, nullable=False) # fəaliyyətin adı
    category = db.Column(db.String(30), nullable=False) # fəaliyyət kateqoriyaı

# companions cədvəli üçün model yəni məlumatın gəlib düşdüyü struktur
class companions(db.Model):
    __tablename__ = yoldaş_cədvəli
    id = db.Column(db.Integer, primary_key=True) # yoldaşın id-si
    name = db.Column(db.String(50), unique=True, nullable=False) # yoldaşın adı

# responses cədvəli üçün model yəni məlumatın gəlib düşdüyü struktur
class responses(db.Model):
    __tablename__ = cavablar_cədvəli
    id = db.Column(db.Integer, primary_key=True)
    age = db.Column(db.Integer, nullable=False) #yaş
    grade = db.Column(db.Integer, nullable=False) # sinif
    free_day = db.Column(db.String(20), nullable=False) # boş gün
    activity_id = db.Column(db.Integer, db.ForeignKey(f'{aktivlik_cədvəli}.id'), nullable=False) # fəaliyyətin id-si
    companion_id = db.Column(db.Integer, db.ForeignKey(f'{yoldaş_cədvəli}.id'), nullable=False) # yoldaşın id-si
    hours_per_day = db.Column(db.Numeric(3,1), nullable=False) # hobbi ilə məşğul olduğum saatlar
    satisfaction = db.Column(db.Integer, nullable=False) # məmnuniyyət səviyyəsi


@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        activity_name = request.form.get('activity')
        category_name = request.form.get('category')
        companion_name = request.form.get('companion')
        age = request.form.get('age')
        grade = request.form.get('grade')
        free_day = request.form.get('free_day')
        hours_per_day = request.form.get('hours_per_day')
        satisfaction = request.form.get('satisfaction')
        return  render_template ('cavab.html')

# 1. Fəaliyyət bazada varmı yoxla, yoxdursa əlavə et
    act = activities.query.filter_by(name=activity_name).first()
    if not act:
        act = activities(name=activity_name, category=category_name)
        db.session.add(act)
        db.session.commit()

    # 2. Yoldaş bazada varmı yoxla, yoxdursa əlavə et
    comp = companions.query.filter_by(name=companion_name).first()
    if not comp:
        comp = companions(name=companion_name)
        db.session.add(comp)
        db.session.commit()

    # 3. Cavabları responses cədvəlinə yazırıq
    new_response = responses(
        age=age,
        grade=grade,
        free_day=free_day,
        activity_id=act.id,
        companion_id=comp.id,
        hours_per_day=hours_per_day,
        satisfaction=satisfaction
    )
    db.session.add(new_response)
    db.session.commit()