<script lang="ts">
// Main store
interface task {
    id: string,
    text: string,
    done: boolean
}
let taskString = localStorage.getItem("tasks");
if(!taskString) {
    taskString = ""
}
const initialState = JSON.parse(taskString);
const tasks:task[] = initialState;

export default {
  data() {
      return {
          tasks: initialState,
          text: ""
      }
  },
  methods: {
      clear() {
          this.tasks.length = 0;
          localStorage.setItem("tasks", JSON.stringify(this.tasks));
      },
      input(id:string) {
          this.tasks.map((task:task) => {
              if(task.id == id) {
                  task.done = !task.done;
              }
          });
          localStorage.setItem("tasks", JSON.stringify(this.tasks));
      },
      add() {
        if(this.text=="") {   
          return;
        }
          let newTask:task = {
              id: new Date().getTime().toString(),
              text: this.text,
              done: false
          }
          this.text = "";
          this.tasks.push(newTask);
          localStorage.setItem("tasks", JSON.stringify(this.tasks));
      },
      delet(id:string) {
        const index = this.tasks.findIndex((task: task) => task.id === id);
        this.tasks.splice(index, 1);
        localStorage.setItem("tasks", JSON.stringify(this.tasks));
        }
      }, 
    computed : {
      count() {
        return this.tasks.length;
      }
    }
}
</script>

<template>
  <h1>To Do List</h1>
  <main id="wrapper">
      <div id="container"> 
        <div 
        v-for="(task) in tasks" 
        :id="task.id" 
        class="task"
        :key="task.id"
        >
          <p :class="{ 'task--crossed': task.done }">
            {{task.text}}
          </p>
          <div class="task__btns">
            <input class="task__check" type="checkbox" v-model="task.done" @change="input(task.id)"/>
            <button @click="delet(task.id)" class="task__button">X</button>
          </div>
        </div>
      </div>
      <div id="control-panel">
          <label id="control-panel__label" htmlFor="control-panel__controls">
            Add a new task to the list
          </label>
          <div id="control-panel__controls">
            <textarea 
            id="controls__textarea" placeholder="Write new task here:" autoFocus
            v-model="text"
            />
            <button id="controls__button" @click="add">+</button>
          </div>
      </div>
  </main>
  <p id="container__status">
    You currently have {{count}} tasks.
  </p>
  <button @click="clear" id="delete-all">Delete all tasks</button>
</template>