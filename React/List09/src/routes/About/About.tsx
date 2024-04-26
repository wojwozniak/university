import AboutContent from "./AboutContent"
import Infotabs from "./Infotabs"


const About = () => {
  return (
    <div id="about" className="px-20">
      <AboutContent />
      <div className="pt-6">
        <Infotabs />
      </div>
    </div>
  )
}

export default About