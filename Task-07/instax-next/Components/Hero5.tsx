import React from 'react'
import Image from 'next/image'

const Hero5 = () => {
  return (
    <div><section className="text-center py-12">
    <Image src="/51.png" width={1200} height={400} alt=''></Image>
    <h2 className="text-2xl font-semibold text-amber-200">Babygirl</h2>
    <p className="max-w-2xl mx-auto mt-2 text-gray-300">
    A high-powered CEO puts her career and family on the line when 
    she begins a torrid affair with her much younger intern.
    </p>
    <div className="mt-4 space-x-4">
      <button className="bg-white text-black px-4 py-2 rounded-md">Create New Review</button>
      <button className="bg-white text-black px-4 py-2 rounded-md">View Recent Review</button>
    </div>
  </section></div>
  )
}

export default Hero5