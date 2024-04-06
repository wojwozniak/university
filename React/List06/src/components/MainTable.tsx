import { DataGrid, GridColDef } from '@mui/x-data-grid';
import { UserContext } from '../UserContext';
import { useContext } from 'react';

const columns: GridColDef[] = [
  { field: 'id', headerName: 'ID', width: 70 },
  { field: 'name', headerName: 'Name', width: 200, editable: true },
  { field: 'price', headerName: 'Price', width: 100, editable: true },
  {
    field: 'avability',
    headerName: 'Avability',
    type: 'boolean',
    width: 130,
    editable: true,
  },
  {
    field: 'stock',
    headerName: 'stock',
    width: 130,
    type: 'number',
    editable: true,
  },
];

const MainTable = () => {
  const { state } = useContext(UserContext);
  return (
    <div style={{ height: 400, width: '90%' }}>
      <DataGrid
        editMode='row'
        rows={state.products}
        columns={columns}
        initialState={{
          pagination: {
            paginationModel: { page: 0, pageSize: 5 },
          },
        }}
        pageSizeOptions={[5, 10]}
        checkboxSelection
      />
    </div>
  )
}

export default MainTable