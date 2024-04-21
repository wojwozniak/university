import React from 'react'
import "./ContactForm.scss"

const ContactForm = () => {
  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
  };

  const elems = [
    <input type="text"
      placeholder="Name"
      required
      className='w-full p-2 rounded-md border-none mt-1 bg-white text-gray border dark:bg-light-gray dark:text-white' />,
    <input type="email"
      placeholder="Email"
      required
      className='w-full p-2 rounded-md border-none mt-1 bg-white text-gray border dark:bg-light-gray dark:text-white' />,
    <textarea rows={5}
      placeholder="Message"
      required
      className='w-full p-2 rounded-md border-none mt-1 resize-y bg-white text-gray border dark:bg-light-gray dark:text-white' />,
  ]

  return (
    <form onSubmit={handleSubmit}
      className="mb-10 max-w-[500px] mx-auto p-5 rounded-lg flex flex-col bg-white text-gray border dark:bg-gray dark:text-white">
      {elems.map((elem, index) => (
        <div key={index}
          className="mb-5">
          {elem}
        </div>
      ))}
      <button type="submit"
        className='py-[10px] px-5 b-0 rounded cursor-pointer transition duration-300 ease-in-out bg-light-green text-white hover:bg-green dark:bg-light-green dark:text-white dark:hover:bg-green'>
        Send Message
      </button>
    </form>
  )
}

export default ContactForm