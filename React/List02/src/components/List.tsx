import { Task } from '../interfaces/task'
import SingleTask from './SingleTask'


interface ListProps {
  tasks: Task[],
  deleteTask: (id: number) => void,
  toggleTask: (id: number) => void,
  queryUsed: string,
  filterOutFinished: boolean
}

const checkIfRender = (task: Task, queryUsed: string, filterOutFinished: boolean) => {
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

const List = ({ tasks, deleteTask, toggleTask, queryUsed, filterOutFinished }: ListProps) => {
  return (
    <>
      <h2 className='text-3xl my-4'>Tasks</h2>
      <main className='w-full my-4 max-h-[88vh] overflow-y-auto'>
        {tasks.map((task) => {
          if (checkIfRender(task, queryUsed, filterOutFinished)) {
            return <SingleTask key={task.id} toggleTask={toggleTask} task={task} deleteTask={deleteTask} />
          }
          return null;
        })}
      </main>
    </>
  )
}

export default List