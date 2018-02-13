from flask_wtf import Form
from wtforms.fields import StringField, PasswordField, BooleanField, SubmitField
from wtforms.fields import IntegerField
from wtforms.validators import DataRequired
from wtforms.validators import AnyOf

#Create allowable food
eaten = ['chillies','peppers','sweets','avocados', 'banana', 'milk']

class BookmarkForm(Form):
    food_word = StringField('add the food type you have eaten here:', validators=[DataRequired(), AnyOf(eaten)])
    amount = IntegerField('add the quantity here:', validators=[DataRequired()])

class LoginForm(Form):
    username = StringField('Your Username:', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember_me = BooleanField('Keep me logged in')
    submit = SubmitField('Log In')
