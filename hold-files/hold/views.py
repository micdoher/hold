from flask import render_template, flash, redirect, url_for, abort, request
from flask_login import login_required, login_user, logout_user, current_user
import pandas as pd
import numpy as np
import os
from datetime import datetime
import psycopg2 as pg
from hold import app, db, login_manager
from hold.forms import BookmarkForm, LoginForm, SignupForm, Predict
from hold.models import Bookmark, User
from hold.holdenvars import getdburl, get_env_variable


@login_manager.user_loader
def load_user(userid):
    return User.query.get(int(userid))


@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html', new_bookmarks=Bookmark.newest(5))

@app.route('/add', methods=['GET', 'POST'])
@login_required
def add():
    form = BookmarkForm()
    if form.validate_on_submit():
        # time_of_day = form.time_of_day.data
        food_word_1 = form.food_word_1.data
        food_word_2 = form.food_word_2.data
        food_word_3 = form.food_word_3.data
        amount_1 = form.amount_1.data
        amount_2 = form.amount_2.data
        amount_3 = form.amount_3.data
        weather = form.weather.data
        mood = form.mood.data
        bm = Bookmark(user=current_user, food_word_1=food_word_1, food_word_2=food_word_2, food_word_3=food_word_3, amount_1=amount_1, amount_2=amount_2, amount_3=amount_3, weather=weather, mood=mood)
        db.session.add(bm)
        db.session.commit()
#        flash("Stored '{}'".format(food_word_1, food_word_2, food_word_3 ))
        return redirect(url_for('index'))
    return render_template('add.html', form=form)



@app.route('/predict', methods=['POST', 'GET'])
@login_required
def predict():
    form = Predict()
    if form.validate_on_submit():
        what_mood = form.what_mood.data

    # Pandas Section
    # df = pd.read_sql_table('bookmark', con=getdburl())
    # s = df['mood'].eq(what_mood).iloc[::-1].cumsum()
    # df = df[df['date'].ge(df['date'].groupby(s).transform('last') - pd.Timedelta(2, unit='d'))]
    # culprit = df[['food_word_1']].mode()
    culprit = "bread"

    return render_template('predict.html', form=form, culprit=culprit)



@app.route('/user/<username>')
def user(username):

    user = User.query.filter_by(username=username).first_or_404()
    return render_template('user.html', user=user)


@app.route("/login", methods=["GET", "POST"])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user = User.get_by_username(form.username.data)
        if user is not None and user.check_password(form.password.data):
            login_user(user, form.remember_me.data)
            flash("Logged in successfully as {}.".format(user.username))
            return redirect(request.args.get('next') or url_for('user', username=user.username))
        flash('Incorrect username or password.')
    return render_template("login.html", form=form)



@app.route("/logout")
def logout():
    logout_user()
    return redirect(url_for('index'))



@app.route("/signup", methods=["GET", "POST"])
def signup():
    form = SignupForm()
    if form.validate_on_submit():
        user = User(email=form.email.data,
                    username=form.username.data,
                    password = form.password.data)
        db.session.add(user)
        db.session.commit()
        flash('Welcome, {}! Please login.'.format(user.username))
        return redirect(url_for('login'))
    return render_template("signup.html", form=form)


@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404


@app.errorhandler(500)
def page_not_found(e):
    return render_template('500.html'), 500
