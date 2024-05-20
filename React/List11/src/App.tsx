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

  const getPopupContent = (book: Book): React.ReactNode => {
    switch (isOpen) {
      case 'DEL':
        return <DeleteBook book={book} setOpen={setOpen} />;
      case 'UPD':
        return <EditBook book={book} setOpen={setOpen} />;
      case 'NEW':
        return <EditBook book={book} setOpen={setOpen} />;
      default:
        return null;
    }
  };

  const handleOpenPopup = (type: string, selectedBook: Book = getEmptyBook()) => {
    setBook(selectedBook);
    setOpen(type);
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
