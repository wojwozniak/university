import { DataGrid } from '@mui/x-data-grid';
import useBooks from '../books/useBooks';
import Loading from '../ui/Loading';
import { formatCurrency } from '../functions/formatCurrency';
import { GridColDef } from '@mui/x-data-grid';
import { Button } from '@mui/material';

const BookTable = () => {
  const query = useBooks();

  const columns: GridColDef[] = [
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
            Edit
          </Button>
          <Button
            variant="outlined"
            color="error"
            onClick={() => { }}
          >
            Delete
          </Button>
        </div>
      ),
      sortable: false,
    },
  ];

  return (
    query.isLoading
      ? <Loading />
      : <div className='p-4'>
        <DataGrid
          rows={query.data}
          columns={columns}
          initialState={{
            pagination: {
              paginationModel: { page: 0, pageSize: 5 },
            },
          }}
          pageSizeOptions={[5, 10]}
          disableRowSelectionOnClick
          slotProps={{ pagination: { labelRowsPerPage: 'Wybierz rozmiar strony' } }}
        />
      </div>
  )
}

export default BookTable