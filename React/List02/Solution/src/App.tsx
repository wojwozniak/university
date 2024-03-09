import { useState } from "react"
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

  const [isPopupOpen, setIsPopupOpen] = useState(false);

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

  return (
    <div id="root" className="">
      <button className="bg-green-500 hover:bg-green-700 p-2 fixed right-0 top-0 m-2 rounded-lg text-white"
        onClick={() => setIsPopupOpen(!isPopupOpen)}
      >
        Add Task
      </button>
      <Popup render={isPopupOpen} updateRender={setIsPopupOpen} component={<AddItemPopup addTask={addTask} updateRender={setIsPopupOpen} />} />
      <List toggleTask={toggleTask} tasks={items} deleteTask={deleteTask} />
    </div>
  )
}

export default App
