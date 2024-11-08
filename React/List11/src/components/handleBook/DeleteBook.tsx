import { Button } from '@mui/material';
import { Book } from '../../interfaces/Book';
import useRemoveBook from '../../hooks/useRemoveBook';

interface DeleteBookProps {
  book: Book,
  setOpen: (open: string) => void
}



const DeleteBook: React.FC<DeleteBookProps> = ({ book, setOpen }) => {
  const removeBookMutation = useRemoveBook();

  const handleDelete = (book: Book) => {
    const id = book.id;
    removeBookMutation.mutate(id, {
      onSuccess: () => {
        setOpen('');
      },
      onError: (error) => {
        console.error('Error removing book:', error);
      }
    });
  }

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