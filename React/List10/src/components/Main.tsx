import { Button } from '@mui/material';

const Main = () => {
  return (
    <div className="h-4/6 w-full flex flex-col items-center justify-between p-3">
      <p>Choose a category:</p>
      <div id="category__selector" className='flex flex-row gap-2'>
        <Button variant="contained" color="primary" className="mb-4">
          Potions
        </Button>
        <Button variant="contained" color="primary">
          Spells
        </Button>
      </div>
    </div>
  )
}

export default Main