import Services from "./sections/Services";
import Contact from "./sections/Contact";
import About from "./sections/About";
import Team from "./sections/Team";
import Blog from "./sections/Blog";

import "./Sections.scss"

interface SectionsProps {
  about: string;
}

const Sections: React.FC<SectionsProps> = ({ about }) => {
  return (
    <div className="content-card">
      <About about={about} />
      <Services />
      <Team />
      <Blog />
      <Contact />
    </div>
  )
}

export default Sections