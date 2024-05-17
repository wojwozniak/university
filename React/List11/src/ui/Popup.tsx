import React, { ReactNode } from 'react';
import { Modal, Button } from '@mui/material';

interface PopupProps {
  open: boolean;
  title: string,
  onClose: () => void;
  children: ReactNode;
}

const Popup: React.FC<PopupProps> = ({ title, open, onClose, children }) => {
  return (
    <Modal open={open} onClose={onClose}>
      <div className="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-white p-4 rounded-lg shadow-lg">
        <div className="absolute top-4 left-0 w-full flex justify-between px-6">
          <h2 className='text-2xl'>{title}</h2>
          <Button onClick={onClose} color="error" variant='contained'>
            Close
          </Button>
        </div>
        <div className="mb-4 mt-14">{children}</div>
      </div>
    </Modal>
  );
};

export default Popup;