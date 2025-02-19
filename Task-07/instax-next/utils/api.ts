export async function SignupUser(username: string, password: string) {
  const response = await fetch("http://localhost:5000/Signup", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ username, password }),
  });
  return response.json();
}

export async function SigninUser(username: string, password: string) {
  const response = await fetch("http://localhost:5000/Signin", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ username, password }),
  });
  return response.json();
}

export async function addReview(movieId: number, review: string) {
  const response = await fetch(`http://localhost:5000/Hero${movieId}/reviews`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ review }),
  });
  return response.json();
}

export async function getReviews(movieId: number) {
  const response = await fetch(`http://localhost:5000/Hero/reviews/${movieId}`);
  console.log(response.json);
  return response.json();

}
