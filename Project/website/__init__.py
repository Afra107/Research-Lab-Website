from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.sql import text

host = 'localhost'
user = 'root'
pin = 'Afra@123'
db_name = "website_db"

def create_app():
    app = Flask(__name__)
    db = SQLAlchemy()
    app.config['SECRET KEY'] = "seecs@123 lab"
    app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql+pymysql://{user}:{pin}@{host}/{db_name}"
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    from .views import views
    from .auth import auth

    app.register_blueprint(views, url_prefix='/')
    app.register_blueprint(auth, url_prefix='/')
    return app

