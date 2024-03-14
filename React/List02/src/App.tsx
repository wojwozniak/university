import { useState } from "react"
import List from "../../List02/src/components/List"
import { Task } from "./interfaces/task"
import Navigation from "../../List02/src/components/Navigation"
import { defaultTasks } from "./exampletasks"

function App() {
  const [items, updateItems] = useState<Task[]>(defaultTasks);
  const [filterOutFinished, setFilterOutFinished] = useState(false);
  const [queryUsed, setQueryUsed] = useState('');

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
    <div id="root" className="m-2">
      <Navigation
        filterOutFinished={filterOutFinished}
        setFilterOutFinished={setFilterOutFinished}
        setQueryUsed={setQueryUsed}
        addTask={addTask}
      />
      <List toggleTask={toggleTask}
        tasks={items}
        filterOutFinished={filterOutFinished}
        deleteTask={deleteTask}
        queryUsed={queryUsed} />
    </div>
  )
}

export default App
