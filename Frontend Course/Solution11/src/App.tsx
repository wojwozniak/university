import React, { useState, useEffect, useRef } from 'react'

interface Task {
  id: string,
  text: string,
  done: boolean
}

function App() {
  const [containerStatus, updateContainerStatus] = useState(0);

  let taskString = localStorage.getItem("tasks");
  if(!taskString) {
    taskString = ""
  }
  const initialState: Task[] = JSON.parse(taskString);

  const [taskList, updateTaskList] = useState<Task[]>(initialState);
  const [currentText, updateCurrentText] = useState("");

  const textarea = useRef<HTMLTextAreaElement>(null);

  const handleTextUpdate = (event: React.ChangeEvent<HTMLTextAreaElement>) => {
    updateCurrentText(event.target.value);
  }

  const handleClick = () => {
    if(currentText !== "") {
      let id = new Date().getTime().toString();
      let task: Task = {
        id: id,
        text: currentText,
        done: false
      };
      updateTaskList([...taskList, task]);
      updateCurrentText("");
    } else {
      textarea.current!.placeholder="You need to write your task here!";
      textarea.current!.style.border="1px solid red";
      setTimeout(()=> {
        textarea.current!.placeholder="Write new task here:";
        textarea.current!.style.border="1px solid gray";
      }, 2000)
    }
  }

  const handleDeleteAll = () => {
    updateTaskList([]);
  }

  const updateDone = (id:string):Task[] => {
    const newState: Task[] = taskList.map(task => {
      if(task.id === id) {
        return {...task, done: !task.done}
      } else return task;
    });
    return newState;
  }

  const handleInput = (event: React.ChangeEvent<HTMLInputElement>, task:Task) => {
    updateTaskList(updateDone(task.id));
  }

  const handleDeleteOne = (event: React.MouseEvent<HTMLButtonElement>, input:Task) => {
    const newState:Task[] = taskList.filter(task => {
      if(task.id !== input.id) {
        return task;
      }
    });
    updateTaskList(newState);
  }

  useEffect(() => {
    updateContainerStatus(taskList.length);
    localStorage.setItem("tasks", JSON.stringify(taskList))
  }, [taskList])

  return (
    <>
      <h1>To Do List</h1>
      <main id="wrapper">
          <div id="container">
            {
              taskList.map((task) => {
                return <div id={task.id} key={task.id} className = 'task'>
                  <p style={{textDecoration: task.done ? "line-through" : "none"}}>{task.text}</p>
                  <div className="task__btns">
                    <input className="task__check" type="checkbox" onChange={(e) => handleInput(e, task)} checked={task.done}/>
                    <button className="task__button" onClick={(e) => handleDeleteOne(e, task)}>X</button>
                  </div>
                </div>
              })
            }
          </div>
          <div id="control-panel">
              <label id="control-panel__label" htmlFor="control-panel__controls">Add a new task to the list</label>
              <div id="control-panel__controls">
                  <textarea id="controls__textarea" placeholder="Write new task here:" value={currentText} onChange={handleTextUpdate} ref={textarea} autoFocus/>
                  <button onClick={handleClick} id="controls__button">+</button>
              </div>
          </div>
      </main>
      <p id="container__status">{containerStatus} tasks</p>
      <button id="delete-all" onClick={handleDeleteAll}>Delete All</button>
    </>
  )
}
export default App;