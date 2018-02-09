from flask import render_template, flash, redirect, url_for, abort

from hold import app, db
from forms import BookmarkForm
from models import User, Bookmark

# Fake login
def logged_in_user():
    return User.query.filter_by(username='micdoher').first()

# Create allowed food list
eaten = ['chillies','peppers','sweets','avocados', 'banana', 'milk']


@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html', new_bookmarks=Bookmark.newest(5))


@app.route('/add', methods=['GET', 'POST'])
def add():
    form = BookmarkForm()
    if form.validate_on_submit():
        food_word = form.food_word.data
        amount = form.amount.data
        bm = Bookmark(user=logged_in_user(), food_word=food_word, amount=amount)
        db.session.add(bm)
        db.session.commit()
        flash("Stored '{}'".format(food_word))
        return redirect(url_for('index'))
    return render_template('add.html', form=form)



@app.route('/user/<username>')
def user(username):

    user = User.query.filter_by(username=username).first_or_404()
    return render_template('user.html', user=user)


@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404


@app.errorhandler(500)
def page_not_found(e):
    return render_template('500.html'), 500
