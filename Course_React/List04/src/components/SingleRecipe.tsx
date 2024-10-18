import React, { useContext, useState } from 'react';
import { RecipeContext } from '../RecipeContext';

interface Recipe {
  id: number;
  name: string;
  description: string;
}

interface SingleRecipeProps {
  recipe: Recipe;
}

const SingleRecipe: React.FC<SingleRecipeProps> = ({ recipe }) => {
  const [isOpen, setIsOpen] = useState<boolean>(false);

  const { state, dispatch } = useContext(RecipeContext);
  const isFavorite = state.favorites.some(fav => fav === recipe.id);

  const toggleFavorite = () => {
    if (isFavorite) {
      dispatch({
        type: 'REMOVE_FROM_FAVORITES',
        id: recipe.id,
      });
    } else {
      dispatch({
        type: 'ADD_TO_FAVORITES',
        id: recipe.id,
      });
    }
  }

  const toggleDescription = () => {
    setIsOpen(!isOpen);
  };

  const removeRecipe = () => {
    dispatch({
      type: 'REMOVE_RECIPE',
      id: recipe.id,
    });
  }

  const styleFavourite = isFavorite ? { backgroundColor: "gray" } : {};

  return (
    <div className="border rounded p-4 mb-4" style={styleFavourite}>
      <div className="flex justify-between items-center">
        <h2 className="text-lg font-semibold">{recipe.name}</h2>
        <div className='flex gap-5'>
          <button
            onClick={toggleFavorite}
            className="p-2 bg-yellow-500 hover:bg-yellow-700 rounded-lg text-white"
          >
            {isFavorite ? 'Delete from favorites' : 'Favorite'}
          </button>
          <button
            onClick={toggleDescription}
            className="p-2 bg-blue-500 hover:bg-blue-700 rounded-lg text-white"
          >
            {isOpen ? 'Hide Description' : 'Show Description'}
          </button>
        </div>
      </div>
      {isOpen && (
        <div className='flex flex-row justify-between items-center pt-4'>
          <p className="mt-2 text-gray-600 w-3/5">
            {recipe.description}
          </p>
          <button
            onClick={removeRecipe}
            className="p-2 bg-red-500 hover:bg-red-700 rounded-lg text-white h-fit">
            Delete this recipe
          </button>
        </div>
      )}
    </div>
  );
};

export default SingleRecipe;