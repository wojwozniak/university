import React, { useContext } from 'react'
import { RecipeContext } from '../RecipeContext';

interface AddRecipePopupProps {
  setIsPopupOpen: React.Dispatch<React.SetStateAction<boolean>>;
}

const AddRecipePopup: React.FC<AddRecipePopupProps> = ({ setIsPopupOpen }) => {
  const { dispatch } = useContext(RecipeContext);
  const [recipeName, setRecipeName] = React.useState<string>('');
  const [recipeDesc, setRecipeDesc] = React.useState<string>('');

  const addRecipe = (name: string, description: string) => {
    if (!name || !description) return;
    dispatch({
      type: 'ADD_RECIPE',
      recipe: {
        id: Date.now(),
        name,
        description,
      },
    });
  };

  const addTaskClick = () => {
    if (!recipeName || !recipeDesc) return;
    addRecipe(recipeName, recipeDesc);
    setIsPopupOpen(false);
  };

  return (
    <div className="text-black">
      <h1 className="text-2xl">Add Task</h1>
      <div className='flex flex-col'>
        <input className="p-2 m-2 mt-10 border"
          type="text"
          placeholder="Task Name"
          value={recipeName}
          onChange={e => setRecipeName(e.target.value)} />
        <input className="p-2 m-2 border"
          type="text"
          placeholder="Task Description"
          value={recipeDesc}
          onChange={e => setRecipeDesc(e.target.value)} />
        <button className="bg-green-500 hover:bg-green-700 p-2 m-2 rounded-lg text-white"
          onClick={addTaskClick}>
          Add Task
        </button>
      </div>
    </div>
  )
}

export default AddRecipePopup