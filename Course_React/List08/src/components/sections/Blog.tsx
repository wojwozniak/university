import Section from '../../ui/Section'
import SingleBlogPost from '../../ui/SingleBlogPost'
import { BlogPost } from '../../types/BlogPost'

const Blog = ({ blogPosts }: { blogPosts: BlogPost[] }) => {
  return (
    <Section name="blog" headerText="Latest Blog Posts">
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-5">
        {blogPosts.map((post) => <SingleBlogPost post={post} key={post.id} />)}
      </div>
    </Section>
  )
}

export default Blog