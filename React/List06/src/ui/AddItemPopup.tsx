import React, { useState } from 'react';
import { Dialog, DialogTitle, DialogContent, DialogActions, Button, TextField } from '@mui/material';
import { Product } from '../types/Product';

interface AddItemPopupProps {
  open: boolean;
  onClose: () => void;
  onAdd: (formData: Product) => void;
}

const AddItemPopup: React.FC<AddItemPopupProps> = ({ open, onClose, onAdd }) => {
  const [formData, setFormData] = useState<Product>({
    id: 0,
    name: '',
    price: 0,
    avability: false,
    stock: 0,
  });

  const handleFormChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setFormData(prevData => ({ ...prevData, [name]: name === 'availability' ? (value === 'true') : value }));
  };

  const handleAddItem = () => {
    onAdd(formData);
    setFormData({ id: 0, name: '', price: 0, avability: false, stock: 0 });
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>
        Dodawanie produktu
      </DialogTitle>
      <DialogContent sx={{ '& > *': { my: 1 } }}>
        <TextField name="name" label="Nazwa" value={formData.name} onChange={handleFormChange} fullWidth />
        <TextField name="price" label="Cena" type="number" value={formData.price} onChange={handleFormChange} fullWidth />
        <TextField name="availability"
          label="Dostępne"
          select
          value={formData.avability.toString()}
          onChange={handleFormChange}
          fullWidth>
          <option value="true">Tak</option>
          <option value="false">Nie</option>
        </TextField>
        <TextField name="stock" label="Ilość" type="number" value={formData.stock} onChange={handleFormChange} fullWidth />
      </DialogContent>
      <DialogActions>
        <Button variant="outlined" color="error" onClick={onClose}>
          Anuluj
        </Button>
        <Button color="success" variant="contained" onClick={handleAddItem}>
          Zapisz
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default AddItemPopup;