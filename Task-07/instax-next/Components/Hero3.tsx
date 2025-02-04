import React from 'react'
import Image from 'next/image'

const Hero3 = () => {
  return (
    <div><section className="text-center py-12">
    <Image src="/31.png" width={1200} height={400} alt=''></Image>
    <h2 className="text-2xl font-semibold text-amber-200">The Count of Monte Cristo</h2>
    <p className="max-w-2xl mx-auto mt-2 text-gray-300">
    Edmond Dantes becomes the target of a sinister plot and is arrested on his wedding day for a crime he did not commit.
    After 14 years in the island prison of Château d’If, he manages a daring escape.
    </p>
    <div className="mt-4 space-x-4">
      <button className="bg-white text-black px-4 py-2 rounded-md">Create New Review</button>
      <button className="bg-white text-black px-4 py-2 rounded-md">View Recent Review</button>
    </div>
  </section></div>
  )
}

export default Hero3