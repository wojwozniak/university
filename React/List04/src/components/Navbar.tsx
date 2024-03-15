import { useContext, useState } from 'react'
import Popup from './Popup'
import AddRecipePopup from './AddRecipePopup';
import { RecipeContext } from '../RecipeContext';

const Navbar = () => {
  const { state, dispatch } = useContext(RecipeContext);
  const { filterOutFinished, searchQuery } = state;

  const [searchText, setSearchText] = useState('');
  const [isPopupOpen, setIsPopupOpen] = useState(false);

  const setFilterOutFinished = (value: boolean) => {
    dispatch({
      type: 'SET_FILTER_OUT_FINISHED',
      filterOutFinished: value,
    });
  }

  const updateSearchQuery = (query: string) => {
    if (query === searchQuery) return;
    dispatch({
      type: 'SET_SEARCH_QUERY',
      searchQuery: query,
    });
  }

  return (
    <>
      <nav className="p-4 w-full flex flex-row items-center justify-end gap-5">
        <h2 className="text-3xl absolute left-5">Recipe List</h2>
        <button className="p-2 bg-blue-500 hover:bg-blue-700 rounded-lg text-white"
          onClick={() => updateSearchQuery(searchText)}
        >
          Search
        </button>
        <input type="text"
          className="p-2 border"
          placeholder="Text to search for"
          content={searchText}
          onChange={e => setSearchText(e.target.value)} />
        <h2 className="text-xl">Displaying {filterOutFinished ? "favorite" : "all"} recipes</h2>
        <button className="p-2 bg-yellow-500 hover:bg-yellow-700 rounded-lg text-white"
          onClick={() => setFilterOutFinished(!filterOutFinished)}
        >
          {filterOutFinished ? "Show all recipes" : "Show only active recipes"}
        </button>
        <button className="p-2 bg-green-500 hover:bg-green-700 rounded-lg text-white"
          onClick={() => setIsPopupOpen(!isPopupOpen)}
        >
          Add Recipe
        </button>
      </nav>
      <Popup render={isPopupOpen}
        updateRender={setIsPopupOpen}
        component={<AddRecipePopup setIsPopupOpen={setIsPopupOpen} />} />
    </>
  )
}

export default Navbar