import React, { useState } from 'react';
import { Dialog, DialogTitle, DialogContent, DialogActions, Button, TextField } from '@mui/material';
import { Product } from '../types/Product';

interface AddItemPopupProps {
  open: boolean;
  onClose: () => void;
  onAdd: (formData: Product) => void;
  setAlert: (message: string) => void;
}

const validateProduct = (product: Product): string => {
  if (!product.name) {
    return 'Nazwa produktu jest wymagana!';
  }
  if (!product.price) {
    return 'Cena produktu jest wymagana!';
  }
  if (!product.avability) {
    return 'Dostępność produktu jest wymagana!';
  }
  if (!product.stock) {
    return 'Ilość produktu jest wymagana!';
  }
  if (product.price < 0) {
    return 'Cena produktu nie może być ujemna!';
  }
  if (product.stock < 0) {
    return 'Ilość produktu nie może być ujemna!';
  }
  return '';
};

const AddItemPopup: React.FC<AddItemPopupProps> = ({ open, onClose, onAdd, setAlert }) => {
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
    const validationMessage = validateProduct(formData);
    if (validationMessage) {
      setAlert(validationMessage);
      return;
    }
    onAdd(formData);
    clearData();
  };

  const clearData = () => setFormData({ id: 0, name: '', price: 0, avability: false, stock: 0 });

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>
        Dodawanie produktu
      </DialogTitle>
      <DialogContent sx={{ '& > *': { my: 2 } }}>
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
        <Button variant="contained" color="error" onClick={clearData}>
          Wyczyść
        </Button>
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