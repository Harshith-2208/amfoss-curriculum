import React from 'react'
import Image from 'next/image'

const Hero1 = () => {
  return (
    <div><section className="text-center py-12">
    <Image src="/1.png" width={1200} height={400} alt=''></Image>
    <h2 className="text-2xl font-semibold text-amber-200">Nosferatu</h2>
    <p className="max-w-2xl mx-auto mt-2 text-gray-300">
      A gothic tale of obsession between a haunted young woman and the
      terrifying vampire infatuated with her, causing untold horror in its wake.
    </p>
    <div className="mt-4 space-x-4">
      <button className="bg-white text-black px-4 py-2 rounded-md"><a href='/Hero1/review?movieId=1'>Write a Review</a></button>
      <button className="bg-white text-black px-4 py-2 rounded-md"><a href='#recent'>View Recent Review</a></button>
    </div>
  </section></div>
  )
}

export default Hero1
