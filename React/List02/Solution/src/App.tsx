import { useEffect, useState } from "react"
import AddItemPopup from "./components/AddItemPopup"
import List from "./components/List"
import { Task } from "./interfaces/task"
import Popup from "./components/Popup"

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
  const [displayedItems, setDisplayedItems] = useState<Task[]>(items);
  const [isPopupOpen, setIsPopupOpen] = useState(false);
  const [filterOutFinished, setFilterOutFinished] = useState(false);
  const [searchText, setSearchText] = useState('');
  const [searchButtonClicked, setSearchButtonClicked] = useState(Date.now());

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

    setDisplayedItems(itemsCopy);
  }, [items, filterOutFinished, searchButtonClicked]);

  return (
    <div id="root" className="m-2">
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
      <Popup render={isPopupOpen}
        updateRender={setIsPopupOpen}
        component={<AddItemPopup addTask={addTask} updateRender={setIsPopupOpen} />} />
      <List toggleTask={toggleTask}
        tasks={displayedItems}
        deleteTask={deleteTask} />
    </div>
  )
}

export default App
