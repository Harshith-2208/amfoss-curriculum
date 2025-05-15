from flask import Flask, request, jsonify
from flask_cors import CORS
from models import db, User, CapturePokemon

app = Flask(__name__)
CORS(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///database.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db.init_app(app)

with app.app_context():
    db.create_all()

@app.route('/signup', methods=['POST'])
def signup():
    data = request.get_json()
    username = data['username']
    password = data['password']

    if User.query.filter_by(username=username).first():
        return jsonify({'error': 'Username already exists'}), 400

    user = User(username=username, password=password)
    db.session.add(user)
    db.session.commit()

    return jsonify({'message': 'User created successfully', 'username': user.username}), 201


@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    user = User.query.filter_by(username=data['username']).first()

    if user and user.password == data['password']:
        return jsonify({'message': 'Login successful', 'username': user.username})
    else:
        return jsonify({'error': 'Invalid credentials'}), 401


# @app.route('/user/<int:user_id>', methods=['GET'])
# def get_user(user_id):
#     user = User.query.get(user_id)
#     if user:
#         return jsonify({'id': user.id, 'username': user.username}), 200
#     return jsonify({'message': 'User not found'}), 404

# @app.route('/user/<String:username>', methods=['GET'])
# def get_user_id(username):
#     user = User.query.get(username)
#     if user:
#         return jsonify({'id': user.id, 'username': user.username}), 200
#     return jsonify({'message': 'User not found'}), 404


@app.route('/capture', methods=['POST'])
def capture_pokemon():
    data = request.get_json()
    name = data.get('name')
    image_url = data.get('image_url')
    stats = data.get('stats')
    abilities = data.get('abilities')
    username = data.get('username')

    new_pokemon = CapturePokemon(
        name=name,
        image_url=image_url,
        stats=stats,
        abilities=abilities,
        username=username
    )
    db.session.add(new_pokemon)
    db.session.commit()
    return jsonify({'message': 'Pokemon captured successfully'}), 200

@app.route('/captured/<string:username>', methods=['GET'])
def get_captured_pokemon(username):
    pokemons = CapturePokemon.query.filter_by(username=username).all()
    return jsonify([{
        'name': p.name,
        'image_url': p.image_url,
        'stats': p.stats,
        'abilities': p.abilities,
    } for p in pokemons])

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000,debug=True)