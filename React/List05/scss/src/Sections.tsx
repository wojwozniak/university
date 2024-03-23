import Services from "./sections/Services";
import Contact from "./sections/Contact";
import Team from "./sections/Team";
import Blog from "./sections/Blog";

import "./Sections.scss"

import { Service } from "./types/Service";
import { TeamMembers } from "./types/TeamMembers";
import { BlogPost } from "./types/BlogPost";
import Section from "./sections/ui/Service";

interface SectionsProps {
  about: string;
  services: Service[];
  teamMembers: TeamMembers[];
  blogPosts: BlogPost[];
}

const Sections: React.FC<SectionsProps> = ({ about, services, teamMembers, blogPosts }) => {
  return (
    <div className="content-card">
      <Section name="about" headerText="About">
        <>{about}</>
      </Section>
      <Services services={services} />
      <Team teamMembers={teamMembers} />
      <Blog blogPosts={blogPosts} />
      <Contact />
    </div>
  )
}

export default Sections