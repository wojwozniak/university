import { BlogPost } from '../types/BlogPost'

const SingleBlogPost = ({ post }: { post: BlogPost }) => {
  return (
    <div key={post.id} className="rounded-lg p-5 text-left dark:bg-black-tainted bg-tained-harder-white text-gray">
      <h3 className='mb-[10px]'>{post.title}</h3>
      <p className='mb-[10px]'>{post.date}</p>
      <p className='mb-[10px]'>{post.content}</p>
      <button
        className="border-none rounded-md cursor-pointer py-2 px-4 transition duration-300 ease-in-out hover:bg-green dark:bg-light-green dark:text-white dark:hover:bg-green text-white bg-light-green color-white hover:bg-green">
        Read More
      </button>
    </div>
  )
}

export default SingleBlogPost