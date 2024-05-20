import React, { useState } from 'react';
import { TextField, Button, MenuItem } from '@mui/material';
import { Book } from '../../interfaces/Book';
import useGenres from '../../hooks/useGenres';
import { safeParseFloat } from '../../functions/safeParseFloat';
import Loader from '../../ui/Loader';
import useBook from '../../hooks/useBook';
import { Genre } from '../../interfaces/Genre';
import useUpdateBook from '../../hooks/useUpdateBook';
import useAddBook from '../../hooks/useAddBook';

const shouldConvertToNumber = (name: string): boolean => {
  return name === 'numberOfCopies' || name === 'price' || name === 'publicationYear';
}

interface EditBookProps {
  book: Book,
  setOpen: (open: string) => void
}

const EditBook: React.FC<EditBookProps> = ({ book, setOpen }) => {
  const { data: genres, error: genreError, isLoading: genreLoading } = useGenres();
  const { data: bookDetailed, error: bookError, isLoading: bookLoading } = useBook(book.id);
  const addBookMutation = useAddBook();
  const updateBookMutation = useUpdateBook();

  const [editedBook, setEditedBook] = useState<Book>({ ...bookDetailed });

  const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = event.target;
    setEditedBook(prevState => ({
      ...prevState,
      [name]: shouldConvertToNumber(name) ? safeParseFloat(value) : value,
    }));
  };

  const handleAdd = (newBook: Book) => {
    addBookMutation.mutate(newBook, {
      onSuccess: () => setOpen(''),
      onError: (error) => console.error('Error adding book:', error),
    });
  };

  const handleUpdate = (updatedBook: Book) => {
    updateBookMutation.mutate(updatedBook, {
      onSuccess: () => setOpen(''),
      onError: (error) => console.error('Error updating book:', error),
    });
  };

  const handleSubmitClick = () => {
    if (editedBook.id === 0) {
      editedBook.id = Date.now();
      handleAdd(editedBook);
    } else {
      handleUpdate(editedBook);
    }
  };

  const renderTextField = (label: string, name: string, type: 'text' | 'number' = 'text') => (
    <TextField
      key={name}
      label={label}
      name={name}
      type={type}
      value={editedBook[name as keyof Book]}
      onChange={handleInputChange}
      fullWidth
      disabled={bookLoading}
    />
  );

  return (
    <Loader isLoading={genreLoading || bookLoading} error={[genreError, bookError]}>
      {bookDetailed && (
        <div className="space-y-4">
          {renderTextField('Title', 'title')}
          {renderTextField('Author', 'author')}
          {renderTextField('Publication Year', 'publicationYear', 'number')}
          {renderTextField('Number of Copies', 'numberOfCopies', 'number')}
          {renderTextField('Price', 'price', 'number')}
          <TextField
            select
            label="Genre"
            name="genre"
            value={editedBook.genre}
            onChange={handleInputChange}
            fullWidth
            disabled={genreLoading}
          >
            {genres && genres.map((option: Genre) => (
              <MenuItem key={option.id} value={option.name}>
                {option.name}
              </MenuItem>
            ))}
          </TextField>
          <Button
            variant="contained"
            color="primary"
            onClick={handleSubmitClick}
            disabled={bookLoading || genreLoading}
          >
            Save
          </Button>
        </div>
      )}
    </Loader>
  );
};

export default EditBook;