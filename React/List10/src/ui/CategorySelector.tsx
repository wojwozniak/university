import { Button } from "@mui/material"
import { useContext } from 'react';
import { InfoContext } from '../InfoContext';

const CategorySelector = () => {
  const { state, dispatch } = useContext(InfoContext);
  const btns: string[] = state.data.map(cat => cat.categoryName);

  const selectCategory = (cat: string) => {
    dispatch({ type: 'SET_CATEGORY', payload: cat })
  }

  return (
    <>
      <p>Choose a category:</p>
      <div id="category__selector" className='flex flex-row gap-2'>
        {btns.map(btn =>
          <Button variant="contained"
            color="primary"
            onClick={() => selectCategory(btn)}>
            {btn}
          </Button>)}
      </div>
    </>
  )
}

export default CategorySelector