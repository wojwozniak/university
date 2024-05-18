import { DataGrid } from '@mui/x-data-grid';
import useBooks from '../books/useBooks';
import Loading from '../ui/Loading';
import { formatCurrency } from '../functions/formatCurrency';
import { GridColDef } from '@mui/x-data-grid';
import { Button } from '@mui/material';
import { Book } from '../interfaces/Book';

interface BookTableProps {
  deleteBook: (book: Book) => void,
  editBook: (book: Book) => void
}

const BookTable: React.FC<BookTableProps> = ({ deleteBook, editBook }) => {
  const { data: books, error, isLoading } = useBooks();

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
    },
    {
      field: 'author',
      headerName: 'Autor',
      flex: 1,
    },
    {
      field: 'publicationYear',
      headerName: 'Rok wydania',
      type: 'number',
      width: 130,
    },
    {
      field: 'numberOfCopies',
      headerName: 'Liczba kopii',
      width: 130,
      type: 'number',
    },
    {
      field: 'price',
      headerName: 'Cena',
      width: 150,
      type: 'number',
      valueFormatter: formatCurrency
    },
    {
      field: 'genre',
      headerName: 'Gatunek',
      flex: 1,
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
            onClick={() => { editBook(params.row) }}
          >
            Edit
          </Button>
          <Button
            variant="outlined"
            color="error"
            onClick={() => { deleteBook(params.row) }}
          >
            Delete
          </Button>
        </div>
      ),
      sortable: false,
    },
  ];

  return (
    isLoading
      ? <Loading />
      : (
        error
          ? <p>Error loading books</p>
          : <div className='p-4'>
            <DataGrid
              rows={books}
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

  )
}

export default BookTable