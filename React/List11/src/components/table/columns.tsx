import { formatCurrency } from '../../functions/formatCurrency';
import { GridColDef } from '@mui/x-data-grid';
import { Button } from '@mui/material';

export const columns: GridColDef[] = [
  {
    field: 'id',
    headerName: 'ID',
    width: 70
  },
  {
    field: 'title',
    headerName: 'Tytuł',
    flex: 1,
    editable: true
  },
  {
    field: 'author',
    headerName: 'Autor',
    flex: 1,
    editable: true
  },
  {
    field: 'publicationYear',
    headerName: 'Rok wydania',
    width: 130,
    editable: true
  },
  {
    field: 'numberOfCopies',
    headerName: 'Liczba kopii',
    width: 130,
    type: 'number',
    editable: true
  },
  {
    field: 'price',
    headerName: 'Cena',
    width: 150,
    type: 'number',
    editable: true,
    valueFormatter: formatCurrency
  },
  {
    field: 'genre',
    headerName: 'Gatunek',
    flex: 1,
    editable: true
  },
  {
    field: 'actions',
    headerName: 'Akcja',
    width: 200,
    renderCell: (params) => (
      <div className='flex gap-2 items-center h-full justify-center' >
        <Button
          variant="outlined"
          color="primary"
          onClick={() => { }} // params.row
        >
          Edytuj
        </Button>
        <Button
          variant="outlined"
          color="error"
          onClick={() => { }}
        >
          Usuń
        </Button>
      </div>
    ),
    sortable: false,
  },
];