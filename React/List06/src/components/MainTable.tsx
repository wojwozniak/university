import { DataGrid, GridColDef } from '@mui/x-data-grid';
import { UserContext } from '../UserContext';
import { useContext, useState } from 'react';
import BooleanEditCell from './../ui/BooleanEditCell';
import { Product } from '../types/Product';
import { Button, Snackbar } from '@mui/material';
import AddItemPopup from '../ui/AddItemPopup';

const booleanToStringFormatter = (params: any) => {
  return params ? 'Tak' : 'Nie';
}

const formatCurrency = (value: number): string => {
  return value.toLocaleString('pl-PL', { style: 'currency', currency: 'PLN' });
};


const MainTable = () => {
  const columns: GridColDef[] = [
    {
      field: 'id',
      headerName: 'ID',
      width: 70
    },
    {
      field: 'name',
      headerName: 'Nazwa',
      width: 200,
      editable: true
    },
    {
      field: 'price',
      headerName: 'Cena',
      width: 100,
      type: 'number',
      editable: true,
      valueFormatter: formatCurrency,
    },
    {
      field: 'avability',
      headerName: 'Dostępne',
      valueFormatter: booleanToStringFormatter,
      width: 130,
      editable: true,
      renderEditCell: (params) => <BooleanEditCell {...params} />,
    },
    {
      field: 'stock',
      headerName: 'Ilość',
      width: 130,
      type: 'number',
      editable: true,
    },
    {
      field: 'delete',
      headerName: 'Akcja',
      renderCell: (params) => (
        <Button variant="outlined"
          color="error"
          onClick={() => handleDelete(params.row)}>
          Usuń
        </Button>
      ),
      sortable: false,
    },
  ];

  const { state, dispatch } = useContext(UserContext);

  const [deletedMessage, setDeletedMessage] = useState<string>('');
  const [isAddItemPopupOpen, setIsAddItemPopupOpen] = useState<boolean>(false);

  const handleCloseMessage = () => setDeletedMessage('');

  const handleDelete = (row: Product) => {
    dispatch({ type: 'DELETE_PRODUCT', payload: row.id });
    setDeletedMessage(`Element ${row.name} (id: ${row.id}) został usunięty!`);
  };

  const handleAddItem = (formData: any) => {
    //del
    setIsAddItemPopupOpen(false);
  };

  const stateUpdated = (newState: any) => {
    const arr = Object.values(newState.rows.dataRowIdToModelLookup) as Product[];
    if (arr !== state.products) {
      dispatch({ type: 'UPDATE_PRODUCTS', payload: arr });
    }
  }

  return (
    <>
      <Button variant="contained"
        color="success"
        onClick={() => setIsAddItemPopupOpen(true)}>
        Dodaj produkt
      </Button>
      <div style={{ height: 400, width: '100%' }}>
        <DataGrid
          editMode='row'
          rows={state.products}
          columns={columns}
          onStateChange={(state) => stateUpdated(state)}
          initialState={{
            pagination: {
              paginationModel: { page: 0, pageSize: 5 },
            },
          }}
          pageSizeOptions={[5, 10]}
          checkboxSelection
          disableRowSelectionOnClick
          slotProps={{ pagination: { labelRowsPerPage: 'Wybierz rozmiar strony' } }}
        />
        <Snackbar
          open={!!deletedMessage}
          autoHideDuration={6000}
          onClose={handleCloseMessage}
          message={deletedMessage}
        />
        <AddItemPopup open={isAddItemPopupOpen} onClose={() => setIsAddItemPopupOpen(false)} onAdd={handleAddItem} />
      </div>
    </>
  )
}

export default MainTable