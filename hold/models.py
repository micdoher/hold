from datetime import datetime
from sqlalchemy import desc
from hold import db

eaten = ['chillies','peppers','sweets','avocados', 'banana', 'milk']


class Bookmark(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    food_word = db.Column(db.Text, nullable=False)
    date = db.Column(db.DateTime, default=datetime.utcnow)
    amount = db.Column(db.Integer, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

    @staticmethod
    def newest(num):
        return Bookmark.query.order_by(desc(Bookmark.date)).limit(num)

    def __repr__(self):
        return "<Bookmark '{}': '{}'>".format(self.amount, self.food)


class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True)
    email = db.Column(db.String(120), unique=True)
    bookmarks = db.relationship('Bookmark', backref='user', lazy='dynamic')

    def __repr__(self):
        return "<User '{}'>".format(self.username)
