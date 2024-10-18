import { Task } from '../interfaces/task'
import SingleTask from './SingleTask'


interface ListProps {
  tasks: Task[],
  deleteTask: (id: number) => void,
  toggleTask: (id: number) => void
}

const List = ({ tasks, deleteTask, toggleTask }: ListProps) => {
  return (
    <>
      <h2 className='text-3xl my-4'>Tasks</h2>
      <main className='w-full my-4 max-h-[88vh] overflow-y-auto'>
        {tasks.map((task) => <SingleTask key={task.id} toggleTask={toggleTask} task={task} deleteTask={deleteTask} />)}
      </main>
    </>
  )
}

export default List