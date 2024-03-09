import React from 'react'

interface NavigationProps {
  searchText: string,
  setSearchText: React.Dispatch<React.SetStateAction<string>>,
  setSearchButtonClicked: React.Dispatch<React.SetStateAction<number>>,
  setFilterOutFinished: React.Dispatch<React.SetStateAction<boolean>>,
  filterOutFinished: boolean,
  isPopupOpen: boolean,
  setIsPopupOpen: React.Dispatch<React.SetStateAction<boolean>>,
}

const Navigation = ({
  searchText,
  setSearchText,
  setSearchButtonClicked,
  setFilterOutFinished,
  filterOutFinished,
  isPopupOpen,
  setIsPopupOpen
}: NavigationProps) => {
  return (
    <nav className="m-2 fixed right-0 top-0 flex flex-row items-center gap-5">
      <button className="p-2 bg-blue-500 hover:bg-blue-700 rounded-lg text-white"
        onClick={() => setSearchButtonClicked(Date.now())}
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
  )
}

export default Navigation