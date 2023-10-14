from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()

DB_USERNAME = 'Dupo'
DB_PASSWORD = '3878'
DB_HOST = '192.168.1.148'
DB_PORT = '3306'
DB_NAME = 'reminder'

def get_database_uri():
    return f'mysql+pymysql://{DB_USERNAME}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}'

def initialize_app(app):
    app.config['SQLALCHEMY_DATABASE_URI'] = get_database_uri()
    db.init_app(app)
