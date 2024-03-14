import { useEffect, useState } from "react"
import AddItemPopup from "../../List0203/Solution/src/components/AddItemPopup"
import List from "../../List0203/Solution/src/components/List"
import { Task } from "./interfaces/task"
import Popup from "../../List0203/Solution/src/components/Popup"
import BottomBar from "../../List0203/Solution/src/components/BottomBar"
import Navigation from "../../List0203/Solution/src/components/Navigation"

const defaultTasks: Task[] = [
  {
    id: 1,
    name: "Task 1",
    desc: "Description 1",
    done: false,
  },
  {
    id: 2,
    name: "Task 2",
    desc: "Description 2",
    done: true,
  },
]

function App() {
  const [items, updateItems] = useState<Task[]>(defaultTasks);
  const [filteredItems, setFilteredItems] = useState<Task[]>(items);
  const [visibleItems, setVisibleItems] = useState<Task[]>(filteredItems.slice(0, 10));
  const [isPopupOpen, setIsPopupOpen] = useState(false);
  const [filterOutFinished, setFilterOutFinished] = useState(false);
  const [searchText, setSearchText] = useState('');
  const [searchButtonClicked, setSearchButtonClicked] = useState(Date.now());
  const [activeSort, setActiveSort] = useState("Default (Old to New)");
  const [enablePagination, setEnablePagination] = useState(false);
  const [pageSize, setPageSize] = useState(10);
  const [currentPage, setCurrentPage] = useState(1);
  const [pages, setPages] = useState(1);

  // Wymuszanie rerenderu gdy strona się nie zmienia 
  // ale potrzebna jest zmiana widocznych elementów
  const [update, setUpdate] = useState(Date.now());

  const addTask = (task: Task) => {
    updateItems([...items, task])
  }

  const toggleTask = (id: number) => {
    updateItems(items.map((item) => {
      if (item.id === id) {
        return { ...item, done: !item.done }
      }
      return item
    }))
  }

  const deleteTask = (id: number) => {
    updateItems(items.filter((item) => item.id !== id))
  }

  useEffect(() => {
    let itemsCopy = [...items];
    if (searchText) {
      itemsCopy = itemsCopy.filter((item) => item.name.includes(searchText));
    }

    if (filterOutFinished) {
      itemsCopy = itemsCopy.filter((item) => !item.done);
    }

    setFilteredItems(itemsCopy);
  }, [items, filterOutFinished, searchButtonClicked]);

  // If active sort changes, we move to the first page
  useEffect(() => {
    setCurrentPage(1);
    setUpdate(Date.now());
  }, [activeSort, filteredItems, pageSize]);

  // Apply sort and pagination
  useEffect(() => {
    // Start with sorting
    let itemsCopy = [...filteredItems];
    if (activeSort === "Ascending") {
      itemsCopy.sort((a, b) => a.name.localeCompare(b.name));
    } else if (activeSort === "Descending") {
      itemsCopy.sort((a, b) => b.name.localeCompare(a.name));
    } else {
      itemsCopy.sort((a, b) => a.id - b.id);
    }

    // Then apply pagination
    if (enablePagination) {
      const start = (currentPage - 1) * pageSize;
      const end = start + pageSize;
      itemsCopy = itemsCopy.slice(start, end);
      setPages(Math.ceil(filteredItems.length / pageSize));
    } else {
      setPages(1);
    }

    setVisibleItems(itemsCopy);
  }, [currentPage, update]);

  return (
    <div id="root" className="m-2">
      <Navigation searchText={searchText}
        setSearchText={setSearchText}
        filterOutFinished={filterOutFinished}
        isPopupOpen={isPopupOpen}
        setFilterOutFinished={setFilterOutFinished}
        setSearchButtonClicked={setSearchButtonClicked}
        setIsPopupOpen={setIsPopupOpen}
        enablePagination={enablePagination}
        setEnablePagination={setEnablePagination}
      />
      <Popup render={isPopupOpen}
        updateRender={setIsPopupOpen}
        component={<AddItemPopup addTask={addTask} updateRender={setIsPopupOpen} />} />
      <List toggleTask={toggleTask}
        tasks={visibleItems}
        deleteTask={deleteTask} />
      <BottomBar activeSort={activeSort}
        setActiveSort={setActiveSort}
        pageSize={pageSize}
        enablePagination={enablePagination}
        setPageSize={setPageSize}
        currentPage={currentPage}
        setCurrentPage={setCurrentPage}
        pages={pages}
      />
    </div>
  )
}

export default App
