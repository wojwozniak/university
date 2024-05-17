import React, { ReactNode } from 'react';
import { Modal, Button } from '@mui/material';

interface PopupProps {
  open: boolean;
  onClose: () => void;
  onSave: () => void;
  children: ReactNode;
}

const Popup: React.FC<PopupProps> = ({ open, onClose, onSave, children }) => {
  return (
    <Modal open={open} onClose={onClose}>
      <div className="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-white p-4 rounded-lg shadow-lg">
        <Button className="absolute top-2 right-2" onClick={onClose}>
          Close
        </Button>
        <div className="mb-4">{children}</div>
        <Button variant="contained" color="primary" onClick={onSave}>
          Save
        </Button>
      </div>
    </Modal>
  );
};

export default Popup;