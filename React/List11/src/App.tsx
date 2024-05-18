import useBooks from "./books/useBooks";
import useRemoveBook from "./books/useRemoveBook";
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

  const getPopupContent = (book: Book): React.ReactNode => {
    switch (isOpen) {
      case 'DEL':
        return <DeleteBook book={book} handleDelete={handleDelete} />;
      case 'UPD':
      case 'NEW':
        return <EditBook book={book} handleUpdate={handleUpdate} />;
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

  const handleUpdate = (book: Book) => {

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
