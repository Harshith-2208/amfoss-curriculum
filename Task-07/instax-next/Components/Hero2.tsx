import React from 'react'
import Image from 'next/image'

const Hero2 = () => {
  return (
    <div><section className="text-center py-12">
    <Image src="/21.png" width={1200} height={400} alt=''></Image>
    <h2 className="text-2xl font-semibold text-amber-200">The Brutalist</h2>
    <p className="max-w-2xl mx-auto mt-2 text-gray-300">
    Escaping post-war Europe, visionary architect László Toth arrives in America to rebuild his life, his work,
    and his marriage to his wife Erzsébet after being forced apart during wartime by shifting borders and regimes.
    </p>
    <div className="mt-4 space-x-4">
      <button className="bg-white text-black px-4 py-2 rounded-md"><a href="/Hero2/review">Create New Review</a></button>
      <button className="bg-white text-black px-4 py-2 rounded-md">View Recent Review</button>
    </div>
  </section></div>
  )
}

export default Hero2