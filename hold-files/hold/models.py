from datetime import datetime
from sqlalchemy import desc
from flask_login import UserMixin
from werkzeug.security import check_password_hash, generate_password_hash

from hold import db

class Bookmark(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    # time_of_day = db.Column(db.Text, nullable=False)
    food_word_1 = db.Column(db.Text, nullable=True)
    food_word_2 = db.Column(db.Text, nullable=True)
    food_word_3 = db.Column(db.Text, nullable=True)
    date = db.Column(db.DateTime, default=datetime.utcnow)
    amount_1 = db.Column(db.Integer, nullable=True)
    amount_2 = db.Column(db.Integer, nullable=True)
    amount_3 = db.Column(db.Integer, nullable=True)
    weather = db.Column(db.Text, nullable=True)
    mood = db.Column(db.Text, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

    @staticmethod
    def newest(num):
        return Bookmark.query.order_by(desc(Bookmark.date)).limit(num)

    def __repr__(self):
        return "<Bookmark '{}': '{}'>".format(self.amount, self.food, self)


class Food(db.Model):
    food_name = db.Column(db.Text, primary_key=True)
    calories = db.Column(db.Integer)
    group = db.Column(db.Text)
    sub_group = db.Column(db.Text)

    # below: I think this is to help return the object details for troubleshooting help
    def __repr__(self):
        return '<User %r>' % self.food_name


class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80))
    email = db.Column(db.String(120), unique=True)
    bookmarks = db.relationship('Bookmark', backref='user', lazy='dynamic')
    password_hash = db.Column(db.String)

    @property
    def password(self):
        raise AttributeError('password: write-only field')

    @password.setter
    def password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)

    @staticmethod
    def get_by_username(username):
        return User.query.filter_by(username=username).first()

    def __repr__(self):
        return "<User '{}'>".format(self.username)
