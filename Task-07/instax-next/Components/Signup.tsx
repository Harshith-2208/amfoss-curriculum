"use client"
import React, { FormEvent } from 'react'
import { useState } from "react";
import { useRouter } from "next/navigation";
import { SignupUser } from "../utils/api";


export default function Signup() {
  const [message, setMessage] = useState("");
  const router = useRouter();


  async function handleSignup(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    const data = new FormData(event.currentTarget);
    const user= data.get('username')?.toString() || "";
    const pass = data.get('password')?.toString() || "";
    const response = await SignupUser(user, pass);
    console.log(response.message);
    if (response.message==="User signed up successfully") {
      sessionStorage.setItem("user", JSON.stringify({user})); 
      router.push("/Hero1"); 
    } else {
      setMessage(response['error'])
      }
    }
  

  return (
    <div>
    <div className="mx-auto max-w-screen-xl px-4 py-16 sm:px-6 lg:px-8">
      <div className='bg-amber-50 pt-20 pb-80'>
      <div className="mx-auto max-w-lg  text-center">
        <h1 className="text-2xl font-bold sm:text-3xl text-blue-950">Instax</h1>
     
    <p className="mt-4 text-gray-500 ">
      Welcome to Instax World of Movies
    </p>
  </div>

  <form className="mx-auto mt-8 mb-0  max-w-md space-y-4 pb-8" onSubmit={handleSignup}>
    <div>
      <label htmlFor="email" className="sr-only">Username</label>

      <div className="relative">
        <input
          className="w-full rounded-lg border-gray-200 p-4 pe-12 text-sm shadow-xs text-blue-950"
          type="text"
          placeholder="Username"
          name='username'
        />
      </div>
    </div>

    <div>
      <label htmlFor="password" className="sr-only">Password</label>
      <div className="relative">
        <input
          className="w-full rounded-lg border-gray-200 p-4 pe-12 text-sm shadow-xs text-blue-950"
          type="password"
          placeholder="Password"
          name='password'
        />
      </div>
    </div>

    <div className="flex items-center justify-between">
      <p className="text-sm text-gray-500">
        Already have an account? 
        <a className="underline" href="/Signin">Sign in</a>
      </p>

      <button
        type="submit"
        className="inline-block rounded-lg bg-blue-500 px-5 py-3 text-sm font-medium text-white"
      >Sign up</button>
      <p>{message}</p>
    </div>
  </form>
  </div>
  </div>
  </div>
  )
}
