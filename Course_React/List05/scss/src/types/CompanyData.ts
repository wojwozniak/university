import { Service } from "./Service";
import { TeamMembers } from "./TeamMembers";
import { BlogPost } from "./blogPost";

export interface CompanyData {
  name: string;
  slogan: string;
  about: string;
  services: Service[];
  teamMembers: TeamMembers[];
  blogPosts: BlogPost[];
}