import "./Sections.scss"

import { Service } from "./types/Service";
import { TeamMembers } from "./types/TeamMembers";
import { BlogPost } from "./types/BlogPost";
import Section from "./ui/Section";
import SingleService from "./ui/SingleService";
import TeamCard from "./ui/TeamCard";
import SingleBlogPost from "./ui/SingleBlogPost";
import ContactForm from "./ui/ContactForm";

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
      <Section name="blog" headerText="Latest Blog Posts">
        <div className="blog-posts">
          {blogPosts.map((post) => <SingleBlogPost post={post} key={post.id} />)}
        </div>
      </Section>
      <Section name="contact" headerText="Contact Us">
        <ContactForm />
      </Section>
    </div>
  )
}

export default Sections