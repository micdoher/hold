import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager


# force the verification of the env vars or throw an error
def get_env_variable(name):
    try:
        return os.environ[name]
    except KeyError:
        message = "Expected environment variable '{}' not set.".format(name)
        raise Exception(message)

# the values of those depend on your setup
# POSTGRES_URL = get_env_variable("POSTGRES_URL")
POSTGRES_URL = get_env_variable("HOLD_PG_DB_SVC_SERVICE_HOST")
POSTGRES_PORT = get_env_variable("HOLD_PG_DB_SVC_SERVICE_PORT")
POSTGRES_USER = get_env_variable("POSTGRES_USER")
POSTGRES_PW = get_env_variable("POSTGRES_PW")
POSTGRES_DB = get_env_variable("POSTGRES_DB")


basedir = os.path.abspath(os.path.dirname(__file__))


def getdburl():
    DB_URL = 'postgresql+psycopg2://{user}:{pw}@{url}:{port}/{db}'.format(user=POSTGRES_USER, pw=POSTGRES_PW, url=POSTGRES_URL, port=POSTGRES_PORT, db=POSTGRES_DB)
    return DB_URL

# Configure database
app = Flask(__name__)
app.config['SECRET_KEY'] = '~t\x86\xc9\x1ew\x8bOcX\x85O\xb6\xa2\x11kL\xd1\xce\x7f\x14<y\x9e'
app.config['SQLALCHEMY_DATABASE_URI'] = getdburl()
# app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'hold.db')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False # silence the deprecation warning
app.config['DEBUG'] = True
db = SQLAlchemy(app)

# Configure authentication
login_manager = LoginManager()
login_manager.session_protection = "strong"
login_manager.login_view = "login"
login_manager.init_app(app)


#   from . import models
from . import views
