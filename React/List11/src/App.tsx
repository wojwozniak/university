import useAddBooks from "./hooks/useAddBook";
import useRemoveBook from "./hooks/useRemoveBook";
import useUpdateBook from "./hooks/useUpdateBook";
import BookTable from "./components/BookTable"
import DeleteBook from "./components/handleBook/DeleteBook";
import EditBook from "./components/handleBook/EditBook";
import Header from "./components/Header"
import { getEmptyBook } from "./functions/getEmptyBook";
import { getPopupTitle } from "./functions/getPopupTitle";
import { Book } from "./interfaces/Book";
import Popup from "./ui/Popup";
import { useState } from "react";

function App() {
  const [isOpen, setOpen] = useState<string>('');
  const [book, setBook] = useState<Book>(getEmptyBook);

  const removeBookMutation = useRemoveBook();
  const addBookMutation = useAddBooks();
  const updateBookMutation = useUpdateBook();

  const getPopupContent = (book: Book): React.ReactNode => {
    switch (isOpen) {
      case 'DEL':
        return <DeleteBook book={book} handleDelete={handleDelete} />;
      case 'UPD':
        return <EditBook book={book} handleUpdate={handleUpdate} />;
      case 'NEW':
        return <EditBook book={book} handleUpdate={handleAdd} />;
      default:
        return null;
    }
  };

  const handleOpenPopup = (type: string, selectedBook: Book = getEmptyBook()) => {
    setBook(selectedBook);
    setOpen(type);
  };

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

  const handleAdd = (newBook: Book) => {
    addBookMutation.mutate(newBook, {
      onSuccess: () => {
        setOpen('');
      },
      onError: (error) => {
        console.error('Error adding book:', error);
      }
    });
  };

  const handleUpdate = (updatedBook: Book) => {
    updateBookMutation.mutate(updatedBook, {
      onSuccess: () => {
        setOpen('');
      },
      onError: (error) => {
        console.error('Error updating book:', error);
      }
    });
  };

  return (
    <div>
      <Popup title={getPopupTitle(isOpen)} open={isOpen !== ''} onClose={() => setOpen('')}>
        {getPopupContent(book)}
      </Popup>
      <Header openPopup={() => setOpen('NEW')} />
      <BookTable
        deleteBook={(selectedBook) => handleOpenPopup('DEL', selectedBook)}
        editBook={(selectedBook) => handleOpenPopup('UPD', selectedBook)} />
    </div>

  )
}

export default App
