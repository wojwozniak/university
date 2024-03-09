import React from 'react'
import { Task } from '../interfaces/task'

interface AddItemPopupProps {
  addTask: (task: Task) => void
}

const AddItemPopup = ({ addTask }: AddItemPopupProps) => {

  const addTaskHandler = () => {
  }

  return (
    <div className="text-black">
      <h1 className="text-2xl">Add Task</h1>
      <div className='flex flex-col'>
        <input className="p-2 m-2 mt-10 border" type="text" placeholder="Task Name" />
        <input className="p-2 m-2 border" type="text" placeholder="Task Description" />
        <button className="bg-green-500 hover:bg-green-700 p-2 m-2 rounded-lg text-white"
          onClick={addTaskHandler} >Add Task</button>
      </div>

    </div>
  )
}

export default AddItemPopup