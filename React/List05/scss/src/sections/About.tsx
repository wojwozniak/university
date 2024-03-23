const About = ({ about }: { about: string }) => {
  return (
    <section id="about" className="section about">
      <div className="section-content">
        <h2>About Us</h2>
        <p>{about}</p>
      </div>
    </section>
  )
}

export default About