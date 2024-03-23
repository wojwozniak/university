import { BlogPost } from '../../types/BlogPost'

const SingleBlogPost = ({ post }: { post: BlogPost }) => {
  return (
    <div key={post.id} className="blog-post">
      <h3>{post.title}</h3>
      <p>{post.date}</p>
      <p>{post.content}</p>
      <button>Read More</button>
    </div>
  )
}

export default SingleBlogPost