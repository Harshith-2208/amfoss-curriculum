from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}}) 

movies = [
    {"id": 1, "title": "Nosferatu"},
    {"id": 2, "title": "The Brutalist"},
    {"id": 3, "title": "The Count of Monte Cristo"},
    {"id": 4, "title": "Nickel Boys"},
    {"id": 5, "title": "Babygirl"},
]

users = []
reviews = []


@app.route("/Signup", methods=["POST"])
def register():
    data = request.get_json()
    username = data.get("username")
    password = data.get("password")
    
    if not username or not password:
        return jsonify({"error": "Username and password are required"}), 400
    
    users.append({"username": username, "password": password})
    return jsonify({"message": "User signed up successfully"}), 201


@app.route("/Signin", methods=["POST"])
def login():
    data = request.get_json()
    username = data.get("username")
    password = data.get("password")

    for user in users:
        if user["username"] == username and user["password"] == password:
            return jsonify({"message": "Signin successful"}), 200

    return jsonify({"error": "Invalid details"}), 401


@app.route("/Hero<int:movie_id>/reviews", methods=["POST"])
def add_review(movie_id):
    data = request.get_json()
    review_text = data.get("review")

    if not review_text:
        return jsonify({"error": "Review text is required"}), 400

    new_review = {"movie_id": movie_id, "review_text": review_text}
    reviews.append(new_review)

    return jsonify({"message": "Review added successfully", "review": new_review}), 201


@app.route("/Hero/reviews/<int:movie_id>", methods=["GET"])
def get_reviews_for_movie(movie_id):
    movie_reviews = [review for review in reviews if review["movie_id"] == movie_id]
    return jsonify(movie_reviews)
    # for review in reviews :
    #     if review["movie_id"] == 1 :
    #         return jsonify(review)
    # movie_reviews = [review for review in reviews if review["movie_id"] == movie_id]
    

if __name__ == "__main__":
    app.run(debug=True)
