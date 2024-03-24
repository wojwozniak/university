import "./Sections.scss"

import { Service } from "../types/Service";
import { TeamMembers } from "../types/TeamMembers";
import { BlogPost } from "../types/BlogPost";
import Section from "../ui/Section";
import TeamCard from "../ui/TeamCard";
import SingleBlogPost from "../ui/SingleBlogPost";
import ContactForm from "../ui/ContactForm";
import About from "./sections/About";
import Services from "./sections/Services";

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