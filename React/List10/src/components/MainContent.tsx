import { Button } from '@mui/material';

const MainContent = () => {
  return (
    <>
      <p>Choose a category:</p>
      <div id="category__selector" className='flex flex-row gap-2'>
        <Button variant="contained" color="primary" className="mb-4">
          Potions
        </Button>
        <Button variant="contained" color="primary">
          Spells
        </Button>
      </div>
    </>
  )
}

export default MainContent