import React from 'react'
import { Task } from '../interfaces/task'

interface SingleTaskProps {
  task: Task,
  deleteTask: (id: number) => void
}

const SingleTask = ({ task, deleteTask }: SingleTaskProps) => {

  const taskDoneStyle = {
    textDecoration: task.done ? 'line-through' : 'none',
  }

  return (
    <div className='flex flex-row justify-between h-fit m-1 w-1/2 bg-white text-black border'>
      <div style={task.done ? taskDoneStyle : {}}>
        <h2 className='text-2xl flex flex-col'>{task.name}</h2>
        {task.desc ? <p className='p-0 m-0'>{task.desc}</p> : null}
      </div>
      <button className='bg-red-500 p-4 text-white rounded-l hover:bg-red-700' onClick={() => deleteTask(task.id)}>Delete</button>
    </div>
  )
}

export default SingleTask