import { Button } from '@mui/material';
import React from 'react';

interface HeaderProps {
  openPopup: () => void
}

const Header: React.FC<HeaderProps> = ({ openPopup }) => {

  return (
    <header className='w-full h-fit bg-blue-500 p-5 text-gray-50 flex flex-row justify-between'>
      <h1 className="text-2xl">
        Bookstore ABC
      </h1>
      <Button variant='contained' color='success' onClick={openPopup}>
        Add book
      </Button>

    </header>
  );
};

export default Header;