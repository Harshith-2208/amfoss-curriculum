import React from 'react'

const Navbar = () => {
  return (
    <nav className="flex justify-between items-center p-6">
        <h1 className="text-5xl font-bold text-white dark:text-sky-400">Instax</h1>
        <div className="flex space-x-6 items-center justify-between">
          <a href='/' className="mt-3 w-max bg-white text-black py-1 px-4  rounded-md text-center">Home</a>
          <a href='#' className="mt-2 w-max bg-white text-black py-1 px-4 rounded-md text-center">Sign In</a>
          <a href='#' className="mt-3 w-max bg-white text-black py-1 px-4 rounded-md text-center">Sign Up</a>
          <a href='#films' className="mt-2 w-max bg-white text-black py-1 px-4 rounded-md text-center">Films</a>
          <a href='#aboutus' className="mt-2 w-max bg-white text-black py-1 px-4 rounded-md text-center">About us</a>
        </div>
      </nav>
  )
}

export default Navbar