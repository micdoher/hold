import sys, os
import numpy as np
import pandas as pd
import pandas.io.sql as psql
import psycopg2 as pg
from datetime import datetime

from flask import Flask, request, render_template, session, redirect

#Connect to database
connection = pg.connect("host='192.168.1.8' dbname='holddb' user='pguser' password='ch@cky@b@s@bins'")

#Select the data to calculate against
df = psql.read_sql("SELECT * FROM bookmark", connection)


s = df['mood'].eq('allergies').iloc[::-1].cumsum()
df = df[df['date'].ge(df['date'].groupby(s).transform('last') - pd.Timedelta(2, unit='d'))]


culprit = df[['food_word_2']].mode()
print(culprit)
