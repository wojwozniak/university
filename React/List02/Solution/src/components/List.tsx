import React from 'react'
import { Task } from '../interfaces/task'
import SingleTask from './SingleTask'


interface ListProps {
  tasks: Task[],
  deleteTask: (id: number) => void
}

const List = ({ tasks, deleteTask }: ListProps) => {
  return (
    <main className='w-full my-4'>
      {tasks.map((task) => <SingleTask key={task.id} task={task} deleteTask={deleteTask} />)}
    </main>
  )
}

export default List