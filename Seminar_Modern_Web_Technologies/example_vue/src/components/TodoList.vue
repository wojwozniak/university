<template>
  <div>
    <h1>To-Do List</h1>
    
    <input
      v-model="newTodo"
      @keyup.enter="addTodo"
      placeholder="Wpisz nowe zadanie"
    />

    <button @click="addTodo">Dodaj zadanie</button>

    <ul>
      <li
        v-for="(todo, index) in todos"
        :key="index"
      >
        <input type="checkbox" v-model="todo.done" />
        <span :class="{ done: todo.done }">{{ todo.text }}</span>
        <button @click="removeTodo(index)">Usuń</button>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      newTodo: '',
      todos: [],
    };
  },
  mounted() {
    const savedTodos = localStorage.getItem('todos');
    if (savedTodos) {
      this.todos = JSON.parse(savedTodos);
    }
  },
  watch: {
    todos: {
      handler(newTodos) {
        localStorage.setItem('todos', JSON.stringify(newTodos));
      },
      deep: true,
    },
  },
  methods: {
    addTodo() {
      if (this.newTodo.trim()) {
        this.todos.push({ text: this.newTodo, done: false });
        this.newTodo = '';
      }
    },
    removeTodo(index) {
      this.todos.splice(index, 1);
    },
  },
};
</script>

<style scoped>
.done {
  text-decoration: line-through;
}
ul {
  list-style: none;
  padding: 0;
}
li {
  display: flex;
  align-items: center;
}
button {
  margin-left: 10px;
}
</style>
