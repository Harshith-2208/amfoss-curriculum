import React from 'react'

const Footer = () => {
  return (
    <footer className="bg-[#090929] p-6 text-center" >
        <div className="space-y-2">
          <a href="/" className="block hover:underline text-amber-100">Home</a><br />
          <a href="#aboutus" className="block hover:underline text-amber-100" >About us</a><br></br>
          <a href="#films" className="block hover:underline text-amber-100">Films</a><br></br>
        </div>
        <div id='aboutus'className="mt-4 text-gray-400">
          <p>Contact Us</p>
          <p>9000000000</p>
          <p>amxxxxxxx@yahoo.com</p>
        </div>
      </footer>
  )
}

export default Footer