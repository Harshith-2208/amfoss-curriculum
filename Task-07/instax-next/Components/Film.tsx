import React from 'react'
import Image from 'next/image'

const Film = () => {
  return (
    <div id='films' className="flex justify-center space-x-4 py-6">
            <div className="bg-gray-800 h-64 rounded-md"></div>
            <Image src="/2.png" width={250} height={200} alt=''></Image>
            <button className="mt-2 w-full bg-white text-black py-1 pl-4px rounded-md">
              <a href='Hero2/'>Review</a>
            </button>
            <div className="bg-gray-800 h-64 rounded-md"></div>
            <Image src="/3.png" width={250} height={200} alt=''></Image>
            <button className="mt-2 w-full bg-white text-black py-1 rounded-md">
            <a href='Hero3/'>Review</a>
            </button>
            <div className="bg-gray-800 h-64 rounded-md"></div>
            <Image src="/4.png" width={250} height={200} alt=''></Image>
            <button className="mt-2 w-full bg-white text-black py-1 rounded-md">
            <a href='Hero4/'>Review</a>
            </button>
            <div className="bg-gray-800 h-64 rounded-md"></div>
            <Image src="/5.png" width={250} height={200} alt=''></Image>
            <button className="mt-2 w-full bg-white text-black py-1 rounded-md">
            <a href='Hero5/'>Review</a>
            </button>
    </div>
  )
}

export default Film