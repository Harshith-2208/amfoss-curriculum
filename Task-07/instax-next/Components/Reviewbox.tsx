"use client"
import { useState, useEffect, FormEvent } from "react";
import { useSearchParams } from "next/navigation"; 
import { addReview, getReviews } from "../utils/api";

export default function MovieReview() {
  const searchParams = useSearchParams();
  const movieId = searchParams.get("movieId");
  const [review, setReview] = useState("");
  const [reviews, setReviews] = useState<{ review_text: string }[]>([]);

  useEffect(() => {
    if (movieId) {
      fetchReviews();
    }
  }, [movieId]);

  const fetchReviews = async () => {
    //if (!movieId) return;
    const data = await getReviews(Number(movieId));
    setReviews(data);
  };

  async function handleAddReview (event: FormEvent<HTMLFormElement>){
    event.preventDefault();
    const data = new FormData(event.currentTarget);
    const review = data.get('review')?.toString()||"";
    // if (!movieId || !review.trim()) return;
    console.log(movieId,review)
    await addReview(Number(movieId), review);
    setReview("");
    fetchReviews();
  }

  return (
    <div>
    <div className="p-4 bg-gray-900 text-white rounded-lg">
      <label htmlFor="OrderNotes" className="block font-medium text-xl text-amber-200">
        Write your Review
      </label>
      <form onSubmit={handleAddReview}>
      <textarea
        id="OrderNotes"
        className="mt-2 w-full h-20 p-2 rounded-lg border-gray-200 shadow-xs bg-amber-50 text-black"
        placeholder="Write a review"
        name="review"
      />
      <button
        className="mt-3 px-4 py-2 bg-amber-500 text-white rounded-md hover:bg-amber-600"
        type="submit"
      >
        Submit
      </button>
      </form>

      <h2 id='recent'className="mt-4 text-xl text-amber-200">Recent Reviews</h2>
      <div className="mt-2 p-2 w-full bg-gray-800 rounded-lg">
          {reviews.length > 0 ? (
      (() => {
        const reversedReviews = [...reviews].reverse();
        const reviewElements = [];
        for (let i = 0; i < reversedReviews.length; i++) {
          reviewElements.push(
            <p key={i} className="text-gray-300 border-b border-gray-700 pb-2">
              {reversedReviews[i].review_text}
            </p>
          );
        }
        return reviewElements;
      })()
    ) : (
      <p className="text-gray-400">No reviews yet.</p>
    )}

      </div>
    </div>
    <br />
    <br />
    <br />
    </div>
  );
}
