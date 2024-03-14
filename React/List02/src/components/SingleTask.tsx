import { Task } from '../interfaces/task'

interface SingleTaskProps {
  task: Task,
  toggleTask: (id: number) => void,
  deleteTask: (id: number) => void
}

const SingleTask = ({ task, toggleTask, deleteTask }: SingleTaskProps) => {

  const taskDoneStyle = {
    textDecoration: task.done ? 'line-through' : 'none',
  }

  const taskDoneBackground = {
    backgroundColor: task.done ? 'gray' : 'white'
  }

  return (
    <div style={task.done ? taskDoneBackground : {}} className='flex flex-row justify-between h-fit m-1 w-1/2 bg-white text-black border'>
      <div style={task.done ? taskDoneStyle : {}}>
        <h2 className='text-2xl flex flex-col'>{task.name}</h2>
        {task.desc ? <p className='p-0 m-0'>{task.desc}</p> : null}
      </div>
      <div className='flex flex-row gap-2'>
        <button className='bg-green-500 p-4 w-[85px] text-center text-white rounded-r hover:bg-green-700' onClick={() => toggleTask(task.id)}>{task.done ? "Undone" : "Done"}</button>
        <button className='bg-red-500 p-4 w-[85px] text-white rounded-l hover:bg-red-700' onClick={() => deleteTask(task.id)}>Delete</button>
      </div>
    </div>
  )
}

export default SingleTask