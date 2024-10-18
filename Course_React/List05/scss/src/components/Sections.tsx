import "./Sections.scss"

import { Service } from "../types/Service";
import { TeamMembers } from "../types/TeamMembers";
import { BlogPost } from "../types/BlogPost";
import About from "./sections/About";
import Services from "./sections/Services";
import Team from "./sections/Team";
import Blog from "./sections/Blog";
import Contact from "./sections/Contact";

interface SectionsProps {
  about: string;
  services: Service[];
  teamMembers: TeamMembers[];
  blogPosts: BlogPost[];
}

const Sections: React.FC<SectionsProps> = ({ about, services, teamMembers, blogPosts }) => {
  return (
    <div className="content-card">
      <About about={about} />
      <Services services={services} />
      <Team teamMembers={teamMembers} />
      <Blog blogPosts={blogPosts} />
      <Contact />
    </div>
  )
}

export default Sections