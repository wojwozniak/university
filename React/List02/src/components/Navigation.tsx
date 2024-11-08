import React, { useState } from 'react'
import Popup from "./Popup"
import AddItemPopup from "./AddItemPopup"
import { Task } from '../interfaces/task';

interface NavigationProps {
  setFilterOutFinished: React.Dispatch<React.SetStateAction<boolean>>,
  filterOutFinished: boolean,
  setQueryUsed: React.Dispatch<React.SetStateAction<string>>,
  addTask: (task: Task) => void
}

const Navigation = ({
  setQueryUsed,
  setFilterOutFinished,
  filterOutFinished,
  addTask
}: NavigationProps) => {

  const [searchText, setSearchText] = useState('');
  const [isPopupOpen, setIsPopupOpen] = useState(false);

  return (
    <>
      <nav className="m-2 fixed right-0 top-0 flex flex-row items-center gap-5">
        <button className="p-2 bg-blue-500 hover:bg-blue-700 rounded-lg text-white"
          onClick={() => setQueryUsed(searchText)}
        >
          Search
        </button>
        <input type="text"
          className="p-2 border"
          placeholder="Text to search for"
          content={searchText}
          onChange={e => setSearchText(e.target.value)} />
        <h2 className="text-xl">Displaying {filterOutFinished ? "active" : "all"} items</h2>
        <button className="p-2 bg-yellow-500 hover:bg-yellow-700 rounded-lg text-white"
          onClick={() => setFilterOutFinished(!filterOutFinished)}
        >
          {filterOutFinished ? "Show all" : "Show only active"}
        </button>
        <button className="p-2 bg-green-500 hover:bg-green-700 rounded-lg text-white"
          onClick={() => setIsPopupOpen(!isPopupOpen)}
        >
          Add Task
        </button>
      </nav>
      <Popup render={isPopupOpen}
        updateRender={setIsPopupOpen}
        component={<AddItemPopup addTask={addTask} updateRender={setIsPopupOpen} />} />
    </>
  )
}

export default Navigation