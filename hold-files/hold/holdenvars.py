# force the verification of the env vars or throw an error
import os

def get_env_variable(name):
    try:
        return os.environ[name]
    except KeyError:
        message = "Expected environment variable '{}' not set.".format(name)
        raise Exception(message)

def getdburl():

    # the values of those depend on your setup
    # POSTGRES_URL = get_env_variable("POSTGRES_URL")
    POSTGRES_URL = get_env_variable("HOLD_PG_DB_SVC_SERVICE_HOST")
    POSTGRES_PORT = get_env_variable("HOLD_PG_DB_SVC_SERVICE_PORT")
    POSTGRES_USER = get_env_variable("POSTGRES_USER")
    POSTGRES_PW = get_env_variable("POSTGRES_PW")
    POSTGRES_DB = get_env_variable("POSTGRES_DB")

    DB_URL = 'postgresql+psycopg2://{user}:{pw}@{url}:{port}/{db}'.format(user=POSTGRES_USER, pw=POSTGRES_PW, url=POSTGRES_URL, port=POSTGRES_PORT, db=POSTGRES_DB)

    return DB_URL
