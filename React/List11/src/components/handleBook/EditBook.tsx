import React, { useState } from 'react';
import { TextField, Button } from '@mui/material';
import { Book } from '../../interfaces/Book';

const shouldConvertToNumber = (name: string): boolean => {
  return name === 'numberOfCopies' || name === 'price' || name === 'publicationYear';
}

const safeParseFloat = (input: string): number => {
  const output = parseFloat(input);
  if (isNaN(output)) return 0;
  return output;
}

interface EditBookProps {
  book: Book,
  handleUpdate: (book: Book) => void
}

const EditBook: React.FC<EditBookProps> = ({ book, handleUpdate }) => {
  const [editedBook, setEditedBook] = useState<Book>({ ...book });

  const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = event.target;

    setEditedBook(prevState => ({
      ...prevState,
      [name]: shouldConvertToNumber(name) ? safeParseFloat(value) : value,
    }));
  };

  return (
    <div className="space-y-4">
      <TextField
        label="Title"
        name="title"
        value={editedBook.title}
        onChange={handleInputChange}
        fullWidth
      />

      <TextField
        label="Author"
        name="author"
        value={editedBook.author}
        onChange={handleInputChange}
        fullWidth
      />
      <TextField
        label="Publication Year"
        name="publicationYear"
        value={editedBook.publicationYear}
        onChange={handleInputChange}
        fullWidth
      />
      <TextField
        label="Number of Copies"
        name="numberOfCopies"
        value={editedBook.numberOfCopies}
        onChange={handleInputChange}
        fullWidth
      />
      <TextField
        label="Price"
        name="price"
        value={editedBook.price}
        onChange={handleInputChange}
        fullWidth
      />
      <TextField
        label="Genre"
        name="genre"
        value={editedBook.genre}
        onChange={handleInputChange}
        fullWidth
      />
      <Button variant="contained" color="primary" onClick={() => handleUpdate(editedBook)}>
        Save
      </Button>
    </div>
  );
};

export default EditBook;