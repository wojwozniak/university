import Section from '../../ui/Section'
import ContactForm from '../../ui/ContactForm'

const Contact = () => {
  return (
    <Section name="contact"
      headerText="Contact Us"
      styles={{ marginBottom: "40px" }}>
      <ContactForm />
    </Section>
  )
}

export default Contact