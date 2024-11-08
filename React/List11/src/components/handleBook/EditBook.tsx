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

const defaultGenre: Genre = { id: 0, name: "Other" };

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

  const [editedBook, setEditedBook] = useState<Book>({ ...book });

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

  return (
    <Loader isLoading={genreLoading || bookLoading} error={[genreError, bookError]}>
      {bookDetailed && editedBook && (
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
            select
            label="Genre"
            name="genre"
            value={editedBook.genre ? editedBook.genre : defaultGenre.name}
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