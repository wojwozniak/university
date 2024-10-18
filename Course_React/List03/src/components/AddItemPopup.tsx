import React from 'react'
import { Task } from '../interfaces/task'

interface AddItemPopupProps {
  addTask: (task: Task) => void,
  updateRender: React.Dispatch<React.SetStateAction<boolean>>
}

const AddItemPopup = ({ addTask, updateRender }: AddItemPopupProps) => {
  const [taskName, setTaskName] = React.useState('');
  const [taskDesc, setTaskDesc] = React.useState('');

  const addTaskHandler = () => {
    if (taskName) {
      addTask({
        id: Date.now(),
        name: taskName,
        desc: taskDesc,
        done: false
      })
      setTaskName('')
      setTaskDesc('')
      updateRender(false);
    }
  }

  return (
    <div className="text-black">
      <h1 className="text-2xl">Add Task</h1>
      <div className='flex flex-col'>
        <input className="p-2 m-2 mt-10 border"
          type="text"
          placeholder="Task Name"
          value={taskName}
          onChange={e => setTaskName(e.target.value)} />
        <input className="p-2 m-2 border"
          type="text"
          placeholder="Task Description"
          value={taskDesc}
          onChange={e => setTaskDesc(e.target.value)} />
        <button className="bg-green-500 hover:bg-green-700 p-2 m-2 rounded-lg text-white"
          onClick={addTaskHandler} >Add Task</button>
      </div>

    </div>
  )
}

export default AddItemPopup