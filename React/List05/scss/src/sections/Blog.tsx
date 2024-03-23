import { companyData } from "./companyData"
import "./Blog.scss"

const Blog = () => {
  return (
    <section id="blog" className="section blog">
      <div className="section-content">
        <h2>Latest Blog Posts</h2>
        <div className="blog-posts">
          {companyData.blogPosts.map((post) => (
            <div key={post.id} className="blog-post">
              <h3>{post.title}</h3>
              <p>{post.date}</p>
              <p>{post.content}</p>
              <button>Read More</button>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}

export default Blog