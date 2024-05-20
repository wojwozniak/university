import React, { useState } from 'react';
import { TextField, Button, MenuItem } from '@mui/material';
import { Book } from '../../interfaces/Book';
import useGenres from '../../hooks/useGenres';
import { safeParseFloat } from '../../functions/safeParseFloat';
import Loader from '../../ui/Loader';
import useBook from '../../hooks/useBook';
import { Genre } from '../../interfaces/Genre';

const shouldConvertToNumber = (name: string): boolean => {
  return name === 'numberOfCopies' || name === 'price' || name === 'publicationYear';
}

interface EditBookProps {
  book: Book,
  handleUpdate: (book: Book) => void
}

const EditBook: React.FC<EditBookProps> = ({ book, handleUpdate }) => {

  const { data: genres, error, isLoading } = useGenres();
  const { data: bookDetailed, error: error2, isLoading: isLoading2 } = useBook(book.id);

  const [editedBook, setEditedBook] = useState<Book>({ ...bookDetailed });

  const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = event.target;

    setEditedBook(prevState => ({
      ...prevState,
      [name]: shouldConvertToNumber(name) ? safeParseFloat(value) : value,
    }));
  };

  const genreList: Genre[] = genres;

  const renderTextField = (label: string, name: string, type: 'text' | 'number' = 'text') => (
    <TextField
      key={name}
      label={label}
      name={name}
      type={type}
      value={editedBook[name as keyof Book]}
      onChange={handleInputChange}
      fullWidth
    />
  );

  return (
    <Loader isLoading={isLoading || isLoading2} error={[error, error2]}>
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
        >
          {genreList && genreList.map((option) => (
            <MenuItem key={option.id} value={option.name}>
              {option.name}
            </MenuItem>
          ))}
        </TextField>
        <Button variant="contained" color="primary" onClick={() => handleUpdate(editedBook)}>
          Save
        </Button>
      </div>
    </Loader>
  );
};

export default EditBook;