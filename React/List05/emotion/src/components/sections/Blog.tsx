import Section from '../../ui/Section'
import SingleBlogPost from '../../ui/SingleBlogPost'
import { BlogPost } from '../../types/BlogPost'

const Blog = ({ blogPosts }: { blogPosts: BlogPost[] }) => {
  return (
    <Section name="blog" headerText="Latest Blog Posts">
      <div css={{
        display: "grid",
        gridTemplateColumns: "repeat(auto-fit, minmax(300px, 1fr))",
        gridGap: "20px"
      }}>
        {blogPosts.map((post) => <SingleBlogPost post={post} key={post.id} />)}
      </div>
    </Section>
  )
}

export default Blog