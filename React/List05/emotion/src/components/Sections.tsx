import { Service } from "../types/Service";
import { TeamMembers } from "../types/TeamMembers";
import { BlogPost } from "../types/BlogPost";
import About from "./sections/About";
import Services from "./sections/Services";
import Team from "./sections/Team";
import Blog from "./sections/Blog";
import Contact from "./sections/Contact";
import { useTheme } from "@emotion/react";
import { CustomTheme } from "../../themes";

interface SectionsProps {
  about: string;
  services: Service[];
  teamMembers: TeamMembers[];
  blogPosts: BlogPost[];
}

const Sections: React.FC<SectionsProps> = ({ about, services, teamMembers, blogPosts }) => {

  const theme = useTheme() as CustomTheme;

  return (
    <div className="content-card" css={{
      padding: "50px 0",
      textAlign: "center",
      backgroundColor: theme.contentCardBackgroundColor
    }}>
      <About about={about} />
      <Services services={services} />
      <Team teamMembers={teamMembers} />
      <Blog blogPosts={blogPosts} />
      <Contact />
    </div>
  )
}

export default Sections