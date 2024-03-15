import React, { useContext } from 'react'
import { RecipeContext } from '../RecipeContext';
import SingleRecipe from './SingleRecipe';

const RecipeList = () => {
  const { state } = useContext(RecipeContext);

  return (
    <main id="list" className='w-3/5 p-2'>
      {state.recipes.map((recipe, index) => <SingleRecipe key={index} recipe={recipe} />)}
    </main>
  )
}

export default RecipeList