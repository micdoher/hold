from flask_wtf import Form
from wtforms.fields import StringField
from wtforms.fields import IntegerField
from wtforms.validators import DataRequired
from wtforms.validators import AnyOf

#Create allowable food
eaten = ['chillies','peppers','sweets','avocados', 'banana', 'milk']

class BookmarkForm(Form):
    food_word = StringField('add the food type you have eaten here:', validators=[DataRequired(), AnyOf(eaten)])
    amount = IntegerField('add the quantity here:', validators=[DataRequired()])


    # def validate(self):
    #     if not self.food_word.data.startswith("") or\
    #         self.food_word.data.startswith(""):
    #         self.food_word.data = "" + self.food_word.data
    #
    #     if not Form.validate(self):
    #         return False
    #
    #     if not self.description.data:
    #         self.description.data = self.food_word.data
    #
    #     return True
