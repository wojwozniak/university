import React, { useState, useEffect } from 'react'

interface BottomBarProps {
  activeSort: string,
  setActiveSort: React.Dispatch<React.SetStateAction<string>>,
  pageSize: number,
  setPageSize: React.Dispatch<React.SetStateAction<number>>,
  enablePagination: boolean,
  currentPage: number,
  setCurrentPage: React.Dispatch<React.SetStateAction<number>>,
  ammountOfTasks: number
}

const BottomBar = ({
  activeSort,
  setActiveSort,
  pageSize,
  setPageSize,
  enablePagination,
  currentPage,
  setCurrentPage,
  ammountOfTasks
}: BottomBarProps) => {

  const disabledStyle = {
    backgroundColor: 'red',
  }

  const [pages, setPages] = useState(1);

  useEffect(() => {
    const newPages = Math.ceil(ammountOfTasks / pageSize);
    setPages(newPages);
    if (currentPage > newPages) {
      setCurrentPage(newPages);
    }
  }, [ammountOfTasks, pageSize])

  return (
    <div className="fixed bg-gray-500 w-full p-2 bottom-0 left-0 flex flex-row items-between">
      <div id="sorts" className="w-1/2 flex flex-row items-center gap-2">
        <button className="p-2 bg-yellow-500 hover:bg-yellow-700 rounded-lg text-white"
          onClick={() => setActiveSort("Ascending")}>
          Sort tasks ascending
        </button>
        <button className="p-2 bg-yellow-500 hover:bg-yellow-700 rounded-lg text-white"
          onClick={() => setActiveSort("Descending")}>
          Sort tasks descending
        </button>
        <button className="p-2 bg-yellow-500 hover:bg-yellow-700 rounded-lg text-white"
          onClick={() => setActiveSort("Default (Old to New)")}>
          Default sort
        </button>
        <p>Current sort: {activeSort}</p>
      </div>
      {enablePagination && <div id="paging" className="w-1/2 flex flex-row justify-between gap-5">
        <div className='flex flex-row gap-2 items-center'>
          <button className="p-2 bg-green-500 hover:bg-green-700 rounded-lg text-white"
            disabled={currentPage === 1}
            style={currentPage === 1 ? disabledStyle : {}}
            onClick={() => setCurrentPage(currentPage - 1)}>
            Previous page
          </button>
          <p>Current page: {currentPage}</p>
          <button className="p-2 bg-green-500 hover:bg-green-700 rounded-lg text-white"
            disabled={currentPage === pages}
            style={currentPage === pages ? disabledStyle : {}}
            onClick={() => setCurrentPage(currentPage + 1)}>
            Next page
          </button>
        </div>
        <div className='flex flex-row items-center gap-2'>
          <p>Page size:</p>
          <input className='w-15' type="number" value={pageSize}
            onChange={(e) => setPageSize(parseInt(e.target.value))} />
        </div>
      </div>
      }
    </div>
  )
}

export default BottomBar