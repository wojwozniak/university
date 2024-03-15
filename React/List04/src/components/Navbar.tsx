import { useState } from 'react'
import Popup from './Popup'
import AddRecipePopup from './AddRecipePopup';

const Navbar = () => {
  const [searchText, setSearchText] = useState('');
  const [isPopupOpen, setIsPopupOpen] = useState(false);

  return (
    <>
      <nav className="p-4 w-full flex flex-row items-center justify-end gap-5">
        <h2 className="text-3xl absolute left-5">Recipe List</h2>
        <button className="p-2 bg-blue-500 hover:bg-blue-700 rounded-lg text-white"

        >
          Search
        </button>
        <input type="text"
          className="p-2 border"
          placeholder="Text to search for"
          content={searchText}
          onChange={e => setSearchText(e.target.value)} />
        {/*
        <h2 className="text-xl">Displaying {filterOutFinished ? "active" : "all"} items</h2>
        <button className="p-2 bg-yellow-500 hover:bg-yellow-700 rounded-lg text-white"
          onClick={() => setFilterOutFinished(!filterOutFinished)}
        >
          {filterOutFinished ? "Show all" : "Show only active"}
        </button>
  */}
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