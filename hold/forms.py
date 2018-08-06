from flask_wtf import Form
from wtforms.fields import StringField, PasswordField, BooleanField, SubmitField
from wtforms.fields import IntegerField
from wtforms.validators import Length, Email, Regexp, DataRequired, EqualTo,\
    url, ValidationError, AnyOf

from models import User
#Create allowable attributes
eaten = ['chillies','peppers','sweets','avocados', 'banana', 'milk', 'bread', 'nutella', 'olive oil', 'orange juice', 'pancakes']
moods = ['high', 'low', 'tired', 'energetic']
weather = ['sunny', 'cloudy', 'rainy', 'mixed']

class BookmarkForm(Form):
    food_word_1 = StringField('add the happy food type you have eaten here:', validators=[DataRequired(), AnyOf(eaten)])
    food_word_2 = StringField('add the 2nd food type you have eaten here:', validators=[DataRequired(), AnyOf(eaten)])
    food_word_3 = StringField('add the 3rd food type you have eaten here:', validators=[DataRequired(), AnyOf(eaten)])
    amount = IntegerField('add the quantity here:', validators=[DataRequired()])
    weather = StringField('what is the weather like now?:', validators=[DataRequired(), AnyOf(weather)])
    mood = StringField('Are you feeling good today as it is friday?', validators=[DataRequired(), AnyOf(moods)])

class LoginForm(Form):
    username = StringField('Your Username:', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember_me = BooleanField('Keep me logged in')
    submit = SubmitField('Log In')



class SignupForm(Form):
    username = StringField('Username',
                    validators=[
                        DataRequired(), Length(3, 80),
                        Regexp('^[A-Za-z0-9_]{3,}$',
                            message='Usernames consist of numbers, letters,'
                                    'and underscores.')])
    password = PasswordField('Password',
                    validators=[
                        DataRequired(),
                        EqualTo('password2', message='Passwords must match.')])
    password2 = PasswordField('Confirm password', validators=[DataRequired()])
    email = StringField('Email',
                        validators=[DataRequired(), Length(1, 120), Email()])

    def validate_email(self, email_field):
        if User.query.filter_by(email=email_field.data).first():
            raise ValidationError('There already is a user with this email address.')

    def validate_username(self, username_field):
        if User.query.filter_by(username=username_field.data).first():
            raise ValidationError('This username is already taken.')
