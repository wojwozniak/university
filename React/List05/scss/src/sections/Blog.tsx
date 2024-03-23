import { BlogPost } from "../types/BlogPost"
import "./Blog.scss"
import SingleBlogPost from "./ui/SingleBlogPost"

const Blog = ({ blogPosts }: { blogPosts: BlogPost[] }) => {
  return (
    <section id="blog" className="section blog">
      <div className="section-content">
        <h2>Latest Blog Posts</h2>
        <div className="blog-posts">
          {blogPosts.map((post) => <SingleBlogPost post={post} key={post.id} />)}
        </div>
      </div>
    </section>
  )
}

export default Blog