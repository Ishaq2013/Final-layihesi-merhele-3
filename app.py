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
# kommentləri özüm yazmışam

# activities cədvəli üçün model
class activities(db.Model): 
    __tablename__ = aktivlik_cədvəli
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), unique=True, nullable=False)
    category = db.Column(db.String(100), nullable=False)

# companions cədvəli üçün model
class companions(db.Model):
    __tablename__ = yoldaş_cədvəli
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), unique=True, nullable=False)

# responses cədvəli üçün model
class responses(db.Model):
    __tablename__ = cavablar_cədvəli
    id = db.Column(db.Integer, primary_key=True)
    age = db.Column(db.Integer, nullable=False)
    grade = db.Column(db.Integer, nullable=False)
    free_day = db.Column(db.String(30), nullable=False)
    activity_id = db.Column(db.Integer, nullable=False)
    companion_id = db.Column(db.Integer, nullable=False)
    hours_per_day = db.Column(db.Numeric(3,1), nullable=False)
    satisfaction = db.Column(db.Numeric(3,1), nullable=False)



@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        # HTML-dəki name atributları ilə dəyərləri oxuyuruq
        activity_name = request.form.get('activity')
        category_name = request.form.get('category')
        companion_name = request.form.get('companion')
        age = int(request.form.get('age'))
        grade = int(request.form.get('grade'))
        free_day = request.form.get('free_day')
        hours_per_day = float(request.form.get('hours_per_day'))
        satisfaction = float(request.form.get('satisfaction'))

        # Fəaliyyət bazada varmı yoxla, yoxdursa əlavə et
        act = activities.query.filter_by(name=activity_name).first()
        if not act:
            act = activities(name=activity_name, category=category_name)
            db.session.add(act)
            db.session.commit()

        # Yoldaş bazada varmı yoxla, yoxdursa əlavə et
        comp = companions.query.filter_by(name=companion_name).first()
        if not comp:
            comp = companions(name=companion_name)
            db.session.add(comp)
            db.session.commit()

        # Cavabları responses cədvəlinə yazırıq
        response = responses(
            age=age,grade=grade,
            free_day=free_day,
            activity_id=act.id,
            companion_id=comp.id,
            hours_per_day=hours_per_day,
            satisfaction=satisfaction
            )
        db.session.add(response)
        db.session.commit()

        return render_template('cavab.html')
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)