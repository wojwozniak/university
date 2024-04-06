import React, { useState } from 'react';
import { Dialog, DialogTitle, DialogContent, DialogActions, Button, TextField } from '@mui/material';
import { Product } from '../types/Product';

interface AddItemPopupProps {
  open: boolean;
  onClose: () => void;
  onAdd: (formData: Product) => void;
  setAlert: (message: string) => void;
}

const AddItemPopup: React.FC<AddItemPopupProps> = ({ open, onClose, onAdd, setAlert }) => {
  const [formData, setFormData] = useState<Product>({
    id: 0,
    name: '',
    price: 0,
    avability: false,
    stock: 0,
  });

  const handleFormChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    setFormData(prevData => ({
      ...prevData,
      [name]: name === 'avability' ? value === 'true' : value,
    }));
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

  const clearData = () =>
    setFormData({
      id: 0,
      name: '',
      price: 0,
      avability: false,
      stock: 0,
    });

  const validateProduct = (product: Product): string => {
    const { name, price, avability, stock } = product;
    if (!name) {
      return 'Nazwa produktu jest wymagana!';
    }
    if (!price) {
      return 'Cena produktu jest wymagana!';
    }
    if (avability === null) {
      return 'Dostępność produktu jest wymagana!';
    }
    if (!stock) {
      return 'Ilość produktu jest wymagana!';
    }
    if (price < 0) {
      return 'Cena produktu nie może być ujemna!';
    }
    if (stock < 0) {
      return 'Ilość produktu nie może być ujemna!';
    }
    return '';
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Dodawanie produktu</DialogTitle>
      <DialogContent>
        <TextField name="name" label="Nazwa" value={formData.name} onChange={handleFormChange} fullWidth />
        <TextField name="price" label="Cena" type="number" value={formData.price} onChange={handleFormChange} fullWidth />
        <TextField
          name="avability"
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