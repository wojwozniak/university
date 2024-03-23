import Contact from "./sections/Contact";
import Blog from "./sections/Blog";

import "./Sections.scss"

import { Service } from "./types/Service";
import { TeamMembers } from "./types/TeamMembers";
import { BlogPost } from "./types/BlogPost";
import Section from "./sections/ui/Section";
import SingleService from "./sections/ui/SingleService";
import TeamCard from "./sections/ui/TeamCard";

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
        <p>{about}</p>
      </Section>
      <Section name="services" headerText="Services">
        <ul>
          {services.map((service) => <SingleService service={service} key={service.id} />)}
        </ul>
      </Section>
      <Section name="team" headerText="Meet Our Team">
        <div className="team-members">
          {teamMembers.map((member) => <TeamCard member={member} key={member.id} />)}
        </div>
      </Section>
      <Blog blogPosts={blogPosts} />
      <Contact />
    </div>
  )
}

export default Sections