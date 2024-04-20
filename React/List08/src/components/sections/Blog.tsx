import Section from '../../ui/Section'
import SingleBlogPost from '../../ui/SingleBlogPost'
import { BlogPost } from '../../types/BlogPost'
import './Blog.scss'

const Blog = ({ blogPosts }: { blogPosts: BlogPost[] }) => {
  return (
    <Section name="blog" headerText="Latest Blog Posts">
      <div className="blog-posts">
        {blogPosts.map((post) => <SingleBlogPost post={post} key={post.id} />)}
      </div>
    </Section>
  )
}

export default Blog