"use client"

import React from 'react'
import { useRouter } from "next/navigation";

const Navbar = () => {
  const router = useRouter();
  function handleLogout(){
    sessionStorage.clear()
    router.push("/")
  }

  return (
    <nav className="flex justify-between items-center p-6">
        <h1 className="text-5xl font-bold text-white dark:text-sky-400">Instax</h1>
        <div className="flex space-x-6 items-center justify-between">
          <a href='/Hero1' className="mt-3 w-max bg-white text-black py-1 px-4  rounded-md text-center">Home</a>
          <a href='/Signin' className="mt-2 w-max bg-white text-black py-1 px-4 rounded-md text-center">Sign In</a>
          <a href='/Signup' className="mt-2 w-max bg-white text-black py-1 px-4 rounded-md text-center">Sign Up</a>
          <a href='#films' className="mt-2 w-max bg-white text-black py-1 px-4 rounded-md text-center">Films</a>
          <a href='#aboutus' className="mt-2 w-max bg-white text-black py-1 px-4 rounded-md text-center">About us</a>
          <button className="mt-2 w-max bg-white text-black py-1 px-4 rounded-md text-center" onClick={handleLogout}>Logout</button>
        </div>
      </nav>
  )
}

export default Navbar