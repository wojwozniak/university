import React from 'react'

interface BottomBarProps {
  activeSort: string,
  setActiveSort: React.Dispatch<React.SetStateAction<string>>,
  pageSize: number,
  setPageSize: React.Dispatch<React.SetStateAction<number>>,
}

const BottomBar = ({ activeSort, setActiveSort, pageSize, setPageSize }: BottomBarProps) => {
  return (
    <div className="fixed bg-gray-500 w-full p-2 bottom-0 left-0 flex flex-row items-between">
      <div id="sorts" className="w-1/2 bottom-0 left-0 flex flex-row items-center gap-2">
        <p>Current sort: {activeSort}</p>
        <button className="p-2 bg-yellow-500 hover:bg-yellow-700 rounded-lg text-white">
          Sort tasks ascending
        </button>
        <button className="p-2 bg-yellow-500 hover:bg-yellow-700 rounded-lg text-white">
          Sort tasks descending
        </button>
        <button className="p-2 bg-yellow-500 hover:bg-yellow-700 rounded-lg text-white">
          Default sort
        </button>
      </div>
      {pageSize != 0 && <div id="paging">
        <button className="p-2 bg-yellow-500 hover:bg-yellow-700 rounded-lg text-white">
          Sort tasks ascending
        </button>
        <button className="p-2 bg-yellow-500 hover:bg-yellow-700 rounded-lg text-white">
          Sort tasks descending
        </button>
        <button className="p-2 bg-yellow-500 hover:bg-yellow-700 rounded-lg text-white">
          Default sort
        </button>
      </div>
      }
    </div>
  )
}

export default BottomBar