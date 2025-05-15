from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(120), nullable=False)

class CapturePokemon(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))
    image_url = db.Column(db.String(300))
    stats = db.Column(db.String(120))
    abilities = db.Column(db.String(120))
    username = db.Column(db.String(80), db.ForeignKey('user.username'), nullable=False)