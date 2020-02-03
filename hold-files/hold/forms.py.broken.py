from flask_wtf import Form
from wtforms.fields import StringField, PasswordField, BooleanField, SubmitField
from wtforms.fields import IntegerField
from wtforms.validators import Length, Email, Regexp, DataRequired, EqualTo,\
    url, ValidationError, AnyOf, Optional

from models import User
#Create allowable attributes
time = ['morning', 'lunch', 'dinner', 'bedtime']
eaten = ['stir-fry', 'croissante', 'risotto', 'kale', 'lentils', 'potatoe bread', 'squash', 'kale', 'mushrooms'. 'baked beans', 'carrots', 'hard chese', 'soft chese', 'potatoes', 'green beans', 'kiwi', 'pastry', 'biscuits', 'tea', 'squash', 'salad', 'sushi', 'pine nuts', 'miso soup','chick peas', 'beer', 'tuna', 'quiche', 'sauerkraut', 'radish', 'duck', 'vegtable soup', 'cous cous', 'tomatoe sauce', 'nuts', 'beef', 'lamb', 'pork', 'red wine', 'white wine', 'eggs', 'crab', 'courgette','aubergine', 'crisps', 'chips', 'pancakes', 'omelette', 'salad', 'pastry', 'melon', 'chicken', 'chillies', 'peppers', 'sweets', 'avocados', 'broad beans', 'peach', 'crackers', 'apricot', 'fig', 'peas', 'red beans', 'berries', 'banana', 'cereal bar', 'bread', 'coffee', 'mussels', 'olive oil', 'orange juice', 'pancakes', 'paella', 'fish', 'curry', 'pizza', 'pasta', 'rice', 'milk']
moods = ['headache', 'allergies', 'tired eyes', 'neutral', 'high', 'low', 'tired', 'energetic', 'wind']
weather = ['sunny', 'cloudy', 'rainy', 'mixed']

class BookmarkForm(Form):
    # time_of_day = StringField('what time of day is it:', validators=[DataRequired(), AnyOf(time)])
    food_word_1 = StringField('add the food type you have eaten here:', validators=[Optional(), AnyOf(eaten)])
    food_word_2 = StringField('add the 2nd food type you have eaten here:', validators=[Optional(), AnyOf(eaten)])
    food_word_3 = StringField('add the 3rd food type you have eaten here:', validators=[Optional(), AnyOf(eaten)])
    amount_1 = IntegerField('add the quantity here:', validators=[Optional()])
    amount_2 = IntegerField('add the quantity here:', validators=[Optional()])
    amount_3 = IntegerField('add the quantity here:', validators=[Optional()])
    weather = StringField('what is the weather like now?:', validators=[Optional(), AnyOf(weather)])
    mood = StringField('Are you feeling good today?:', validators=[DataRequired(), AnyOf(moods)])

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
