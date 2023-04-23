/**
 * Storing all tasks in this variable
 * @param {number} id - id of the element
 * @param {string} desc - description of the element
 * @param {boolean} done - checking if task is done or not
 */
let taskStore = [];
/** 
 * Container where tasks are rendered
*/ 
const container = document.getElementById('container');

/**
 * Function converting taskStore to json string and saving it in local storage
 */
const storageUpdate = () => {
    let storage = JSON.stringify(taskStore);
    localStorage.setItem('store', storage);
}

/**
 * Function rendering task to container
 * @param {number} i - container index of object to render 
 * @returns {HTMLDivElement} - rendered div
 */
const renderTask = (i) => {
    // Create task div
    let task = document.createElement("div");
    task.classList.add("task");
    // Render description and append it to task
    let task_desc = document.createElement("p");
    const task_desc_text = document.createTextNode(taskStore[i].desc);
    task_desc.appendChild(task_desc_text);
    task.appendChild(task_desc);
    // Button container render
    let btns_div = document.createElement("div");
    btns_div.classList.add("task__btns");
    // Creating done button and appending
    let input = document.createElement("input");
    input.setAttribute("type","checkbox");
    input.classList.add("task__check");
    if(taskStore[i].done) {
        input.checked = true;
    }
    btns_div.appendChild(input);
    // Creating delete button
    let button = document.createElement("button");
    button.classList.add("task__button");
    button.textContent = "X";
    btns_div.appendChild(button);
    // Append button container to task
    task.appendChild(btns_div);
    // Append task to container
    container.appendChild(task);
    // Add id to container
    let id = `task--${taskStore[i].id}`;
    task.id=id;
    return task;
}

/**
 * Handling adding new tasks
 */
const addTaskHandler = () => {
    const add_input = document.getElementById("controls__textarea");
    const add_btn = document.getElementById("controls__button");
    add_btn.addEventListener("click", () => {
        if(add_input.value) {
            let id = new Date().getTime();
            let task = {
                id: id,
                desc: add_input.value,
                done: false
            };
            add_input.value = '';
            taskStore.push(task);
            let renderedTask = renderTask(taskStore.indexOf(task));
            addEventHandlers(renderedTask);
            updateTaskNumber();
        } else {
            add_input.placeholder="You need to write your task here!";
            add_input.style.border="1px solid red";
            setTimeout(()=> {
                add_input.placeholder="Write new task here:";
                add_input.style.border="1px solid gray";
            }, 2000)
        }
    });
}

/**
 * Adding event handlers to all stored tasks
 */
const createEventHandlers = () => {
    let done_btns = document.querySelectorAll(".task__check");
    let task_btns = document.querySelectorAll(".task__button");
    for(let i=0; i<done_btns.length; i++) {
        done_btns[i].addEventListener("input", (e) => handleInput(e));
        task_btns[i].addEventListener("click", (e) => handleDelete(e));
    }  
}

/**
 * Function handling done input
 * @param {Event} e - event created when input is marked
 */
const handleInput = (e) => {
    let renderedTask = e.explicitOriginalTarget.parentNode.parentNode;
    let id = renderedTask.id.substring(6);
    taskStore.filter((task) => {
        if(task.id == id) {
            if(task.done) {
                task.done = false;
            } else {
                task.done = true;
            }
        }
    });
    storageUpdate();
    renderStrike(renderedTask, id);
}

/**
 * Function handling delete button
 * @param {Event} e - event created when delete button is clicked 
 */
const handleDelete = (e) => {
    e.preventDefault();
    let renderedTask = e.explicitOriginalTarget.parentNode.parentNode;
    container.removeChild(renderedTask);
    let id = renderedTask.id.substring(6);
    taskStore.filter(task => {
        let index;
        if(task.id == id) {
            index = taskStore.indexOf(task);
        }
        if(index) {
            taskStore.splice(index, 1);
        }
    })
    updateTaskNumber();
}

/**
 * Function handling delete all button
 */
const handleDeleteAll = () => {
    const deleteBtn = document.getElementById("delete-all");
    deleteBtn.addEventListener("click", () => {
        container.innerHTML=``;
        taskStore.splice(0, taskStore.length);
        updateTaskNumber();
    });
}

/**
 * Function adding event listeners to newly created tasks
 * @param {HTMLDivElement} renderedTask - task div element
 */
const addEventHandlers = (renderedTask) => {
    renderedTask.childNodes[1].childNodes[0].addEventListener("input", (e) => handleInput(e));
    renderedTask.childNodes[1].childNodes[1].addEventListener("click", (e) => handleDelete(e));
}

/**
 * Handling visual representation of "done" parameter
 * @param {HTMLDListElement} renderedTask - task div element to change 
 * @param {number} id - id of element inside container
 */
const renderStrike = (renderedTask, id) => {
    taskStore.filter((task) => {
        if(task.id == id) {
            if(task.done) {
                renderedTask.firstChild.style="text-decoration: line-through";
            } else {
                renderedTask.firstChild.style="text-decoration: none";
            }
        }
    });
}

/**
 * Function updating task number under container
 */
const updateTaskNumber = () => {
    let status = document.getElementById("container__status");
    let taskNumber = taskStore.length;
    status.textContent = ` You have ${taskNumber} tasks. Add a new one using + button`;
    storageUpdate();
}

/**
 * First render after page loads
 */
const render = () => {
    // Checking if there was something stored
    if(localStorage.store) {
        let stored = JSON.parse(localStorage.store);
        taskStore = stored;
    }
    // Calling render function for all tasks in store
    const renderTasks = () => {
        for(let i=0; i<taskStore.length; i++) {
            let task = renderTask(i);
            renderStrike(task, taskStore[i].id);
        }
    }
    // Calling all other functions
    renderTasks();
    createEventHandlers();
    addTaskHandler();
    handleDeleteAll();
    updateTaskNumber();
    
}
render();