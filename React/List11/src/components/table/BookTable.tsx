import { DataGrid } from '@mui/x-data-grid';
import useBooks from '../../books/useBooks';
import Loading from '../../ui/Loading';
import { columns } from './columns';

const BookTable = () => {
  const query = useBooks();

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