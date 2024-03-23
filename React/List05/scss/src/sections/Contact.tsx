import "./Contact.scss"
import ContactForm from './ui/ContactForm'

const Contact = () => {

  return (
    <section id="contact" className="section contact">
      <div className="section-content">
        <h2>Contact Us</h2>
        <ContactForm />
      </div>
    </section>
  )
}

export default Contact