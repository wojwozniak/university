import { useState } from "react"
import List from "./components/List"
import { Task } from "./interfaces/task"
import Navigation from "./components/Navigation"
import { defaultTasks } from "./exampletasks"
import BottomBar from "./components/BottomBar"

function App() {
  const [items, updateItems] = useState<Task[]>(defaultTasks);
  const [filterOutFinished, setFilterOutFinished] = useState(false);
  const [queryUsed, setQueryUsed] = useState('');

  const [activeSort, setActiveSort] = useState("Default (Old to New)");
  const [enablePagination, setEnablePagination] = useState(false);
  const [pageSize, setPageSize] = useState(10);
  const [currentPage, setCurrentPage] = useState(1);

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

  const checkIfTaskShouldBeRendered = (task: Task, queryUsed: string, filterOutFinished: boolean) => {
    if (queryUsed.length > 0 && filterOutFinished) {
      if (task.name.toLowerCase().includes(queryUsed.toLowerCase()) && !task.done) {
        return true
      }
    }
    else if (queryUsed.length > 0) {
      if (task.name.toLowerCase().includes(queryUsed.toLowerCase())) {
        return true
      }
    }
    else if (filterOutFinished) {
      if (!task.done) {
        return true
      }
    }
    else if (!queryUsed.length && !filterOutFinished) {
      return true
    }
    return false
  }

  const togglePagination = () => setEnablePagination(!enablePagination);

  const getItems = () => {
    return items.filter((task) => checkIfTaskShouldBeRendered(task, queryUsed, filterOutFinished))
  }

  const sortTasks = (tasks: Task[], sortType: string) => {
    switch (sortType) {
      case "Ascending":
        return tasks.sort((a, b) => a.name.localeCompare(b.name));
      case "Descending":
        return tasks.sort((a, b) => b.name.localeCompare(a.name));
      default:
        return tasks
    }
  }

  const getTasksOnCurrentPage = (
    tasks: Task[],
    currentPage: number,
    pageSize: number,
    enabledPagination: boolean
  ) => {
    if (!enabledPagination) return tasks;
    const start = (currentPage - 1) * pageSize;
    const end = start + pageSize;
    return tasks.slice(start, end);
  }

  return (
    <div id="root" className="m-2">
      <Navigation
        filterOutFinished={filterOutFinished}
        setFilterOutFinished={setFilterOutFinished}
        setQueryUsed={setQueryUsed}
        addTask={addTask}
        togglePagination={togglePagination}
      />
      <List toggleTask={toggleTask}
        deleteTask={deleteTask}
        tasks={getTasksOnCurrentPage(sortTasks(getItems(), activeSort), currentPage, pageSize, enablePagination)}
      />
      <BottomBar activeSort={activeSort}
        setActiveSort={setActiveSort}
        currentPage={currentPage}
        setCurrentPage={setCurrentPage}
        pageSize={pageSize}
        setPageSize={setPageSize}
        enablePagination={enablePagination}
        ammountOfTasks={getItems().length}
      />
    </div>
  )
}

export default App
