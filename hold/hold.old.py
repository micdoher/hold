import os

from datetime import datetime
from flask import Flask, render_template, url_for, request, redirect, flash
from flask_wtf import Form
from wtforms.fields import StringField
from wtforms.fields import IntegerField
from wtforms.validators import DataRequired
from wtforms.validators import AnyOf
from flask_sqlalchemy import SQLAlchemy

from forms import BookmarkForm
# import models



basedir = os.path.abspath(os.path.dirname(__file__))

app = Flask(__name__)
food_list = []
app.config['SECRET_KEY'] = '\xe1\x17Q\x0e\xff\xc1\xc6s_\xdfk\x10\xf1e\x9f+.[\x9d\x13\x8a\xca\xdd\xbf'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'hold.db')
app.config['DEBUG'] = True
db = SQLAlchemy(app)

eaten = ['chillies','peppers','sweets','avocados', 'banana', 'milk']

class BookmarkForm(Form):
    food_word = StringField('add the food type you have eaten here:', validators=[DataRequired()])
    amount = IntegerField('add the quantity here:', validators=[DataRequired()])


# def create_food_list(food_word, amount):
#     food_list.append(dict(
#         food_word = food_word,
#         amount = amount,
#         user = "micdoher",
#         date = datetime.utcnow()
#     ))

def recent_food(num):
    return sorted(food_list, key=lambda rf: rf['date'], reverse=True)[:num]


@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html', Title="Bobby Dazzler", Text=eaten, recent_food=recent_food(5))


@app.route('/add', methods=['GET', 'POST'])
def add():
    form = BookmarkForm()
    if form.validate_on_submit():
        food_word = form.food_word.data
        amount = form.amount.data
        bm = models.Bookmark(food_word=food_word, amount=amount)
        db.session.add(bm)
        db.session.add(User(username="micdoher", email="micdoher@example.com"))
        db.session.commit()
        flash("Stored '{}'".format(food_word))
        return redirect(url_for('index'))
    return render_template('add.html', form=form)


@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404


@app.errorhandler(500)
def page_not_found(e):
    return render_template('500.html'), 500


if __name__ == '__main__':
    app.run(debug=True)
