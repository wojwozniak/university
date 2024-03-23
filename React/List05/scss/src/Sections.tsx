import Services from "./sections/Services";
import Contact from "./sections/Contact";
import About from "./sections/About";
import Team from "./sections/Team";
import Blog from "./sections/Blog";

import "./Sections.scss"

const Sections = () => {
  return (
    <div className="content-card">
      <About />
      <Services />
      <Team />
      <Blog />
      <Contact />
    </div>
  )
}

export default Sections