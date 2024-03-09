import { useEffect, useState } from "react"
import AddItemPopup from "./components/AddItemPopup"
import List from "./components/List"
import { Task } from "./interfaces/task"
import Popup from "./components/Popup"
import BottomBar from "./components/BottomBar"
import Navigation from "./components/Navigation"

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
  const [isPopupOpen, setIsPopupOpen] = useState(false);
  const [filterOutFinished, setFilterOutFinished] = useState(false);
  const [searchText, setSearchText] = useState('');
  const [searchButtonClicked, setSearchButtonClicked] = useState(Date.now());
  const [activeSort, setActiveSort] = useState("Default (Old to New)");
  const [pageSize, setPageSize] = useState(0);

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

  return (
    <div id="root" className="m-2">
      <Navigation searchText={searchText}
        setSearchText={setSearchText}
        filterOutFinished={filterOutFinished}
        isPopupOpen={isPopupOpen}
        setFilterOutFinished={setFilterOutFinished}
        setSearchButtonClicked={setSearchButtonClicked}
        setIsPopupOpen={setIsPopupOpen}
      />
      <Popup render={isPopupOpen}
        updateRender={setIsPopupOpen}
        component={<AddItemPopup addTask={addTask} updateRender={setIsPopupOpen} />} />
      <List toggleTask={toggleTask}
        tasks={filteredItems}
        deleteTask={deleteTask} />
      <BottomBar activeSort={activeSort}
        setActiveSort={setActiveSort}
        pageSize={pageSize}
        setPageSize={setPageSize} />
    </div>
  )
}

export default App
