const newTodoInput = document.getElementById('new-todo');
const addTodoButton = document.getElementById('add-todo');
const todoList = document.getElementById('todo-list');
const shredButton = document.getElementById('shred-button');

// Load existing todos from local storage
let todos = loadTodos();
renderTodos();

// Add new todo item
addTodoButton.addEventListener('click', () => {
  const newTodoText = newTodoInput.value.trim();
  if (newTodoText !== "") {
    todos.push({ text: newTodoText, completed: false });
    saveTodos();
    renderTodos();
    newTodoInput.value = ""; // Clear input field
  }
});

// Toggle todo completion
todoList.addEventListener('click', (event) => {
  if (event.target.tagName === 'LI') {
    const todoIndex = Array.from(todoList.children).indexOf(event.target);
    todos[todoIndex].completed = !todos[todoIndex].completed;
    saveTodos();
    renderTodos();
  }
});

// Shred all data
shredButton.addEventListener('click', () => {
  todos = []; // Clear the todos array
  saveTodos(); // Save the empty array to local storage
  renderTodos(); // Update the UI
});

// Functions to manage local storage
function loadTodos() {
  const storedTodos = localStorage.getItem('todos');
  return storedTodos ? JSON.parse(storedTodos) : [];
}

function saveTodos() {
  localStorage.setItem('todos', JSON.stringify(todos));
}

// Function to render todos in the UI
function renderTodos() {
  todoList.innerHTML = ''; // Clear existing list
  todos.forEach((todo, index) => {
    const listItem = document.createElement('li');
    listItem.textContent = todo.text;
    if (todo.completed) {
      listItem.classList.add('completed');
    }
    todoList.appendChild(listItem);
  });
}

