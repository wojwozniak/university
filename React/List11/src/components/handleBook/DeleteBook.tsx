import { Button } from '@mui/material';
import { Book } from '../../interfaces/Book';

interface DeleteBookProps {
  book: Book,
  handleDelete: (book: Book) => void
}

const DeleteBook: React.FC<DeleteBookProps> = ({ book, handleDelete }) => {
  return (
    <div className='flex flex-col gap-5 mt-10'>
      <p>Are you sure you want to delete the book titled "<strong>{book.title}</strong>" by {book.author}?</p>
      <Button variant="contained" color="secondary" onClick={() => handleDelete(book)}>
        Confirm
      </Button>
    </div>
  );
};

export default DeleteBook;