import React from 'react'
import "./ContactForm.scss"

const ContactForm = () => {
  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
  };

  return (
    <form onSubmit={handleSubmit} className="mb-10 contact-form">
      <div className="form-group">
        <input type="text" placeholder="Name" required />
      </div>
      <div className="form-group">
        <input type="email" placeholder="Email" required />
      </div>
      <div className="form-group">
        <textarea rows={5} placeholder="Message" required></textarea>
      </div>
      <button type="submit">Send Message</button>
    </form>
  )
}

export default ContactForm