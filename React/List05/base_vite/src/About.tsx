import { companyData } from "./companyData"

const About = () => {
  return (
    <section id="about" className="section about">
      <div className="section-content">
        <h2>About Us</h2>
        <p>{companyData.about}</p>
      </div>
    </section>
  )
}

export default About