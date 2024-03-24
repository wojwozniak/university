import Section from '../../ui/Section'
import ContactForm from '../../ui/ContactForm'
import './Contact.scss'

const Contact = () => {
  return (
    <Section name="contact" headerText="Contact Us">
      <ContactForm />
    </Section>
  )
}

export default Contact