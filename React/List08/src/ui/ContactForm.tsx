import React from 'react'
import "./ContactForm.scss"

const ContactForm = () => {
  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
  };

  const elems = [
    <input type="text" placeholder="Name" required />,
    <input type="email" placeholder="Email" required />,
    <textarea rows={5} placeholder="Message" required></textarea>,
  ]

  return (
    <form onSubmit={handleSubmit} className="mb-10 contact-form">
      {elems.map((elem, index) => (
        <div key={index} className="form-group">
          {elem}
        </div>
      ))}
      <button type="submit">Send Message</button>
    </form>
  )
}

export default ContactForm