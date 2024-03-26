import { useTheme } from '@emotion/react'
import { BlogPost } from '../types/BlogPost'
import { CustomTheme } from '../../themes';


const SingleBlogPost = ({ post }: { post: BlogPost }) => {

  const theme = useTheme() as CustomTheme;

  return (
    <div key={post.id}
      css={{
        borderRadius: "10px",
        padding: "20px",
        textAlign: "left",
        backgroundColor: theme.blogPostBackgroundColor,
        color: theme.blogPostColor
      }}>
      <h3 css={{ marginBottom: "10px" }}>{post.title}</h3>
      <p css={{ marginBottom: "10px" }}>{post.date}</p>
      <p css={{ marginBottom: "10px" }}>{post.content}</p>
      <button css={{
        border: "none",
        borderRadius: "5px",
        cursor: "pointer",
        padding: "5px 10px",
        transition: "background-color 0.3s ease",
        backgroundColor: theme.buttonBackgroundColor,
      }}>
        Read More
      </button>
    </div>
  )
}

export default SingleBlogPost