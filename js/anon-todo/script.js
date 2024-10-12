// === DOM elements ===

const newTodoInput = document.getElementById("new-todo")
const addTodoButton = document.getElementById("add-todo")
const todoList = document.getElementById("todo-list")
const shredButton = document.getElementById("shred-button")

// === functions ===

function addTodoAndClearInput(e) {
  if ((e.type === "keydown" && e.code === "Enter") || e.type === "click") {
    const newTodoText = newTodoInput.value.trim()

    if (newTodoText === "") return

    todos.push({ text: newTodoText, completed: false })
    saveTodos()
    renderTodos()
    newTodoInput.value = "" // Clear input field
  }
}

function loadTodos() {
  const storedTodos = localStorage.getItem("todos")
  return storedTodos ? JSON.parse(storedTodos) : []
}

function saveTodos() {
  localStorage.setItem("todos", JSON.stringify(todos))
}

function renderTodos() {
  todoList.innerHTML = "" // Clear existing list
  todos.forEach((todo, index) => {
    const listItem = document.createElement("li")
    listItem.textContent = todo.text
    if (todo.completed) {
      listItem.classList.add("completed")
    }
    todoList.appendChild(listItem)
  })
}

// === asign events ===

// add todo via button click
addTodoButton.addEventListener("click", addTodoAndClearInput)

// and todo via Enter key pressed
newTodoInput.addEventListener("keydown", addTodoAndClearInput)

// Toggle todo completion
todoList.addEventListener("click", (event) => {
  if (event.target.tagName === "LI") {
    const todoIndex = Array.from(todoList.children).indexOf(event.target)
    todos[todoIndex].completed = !todos[todoIndex].completed
    saveTodos()
    renderTodos()
  }
})

// shred all data
shredButton.addEventListener("click", () => {
  todos = [] // Clear the todos array
  saveTodos() // Save the empty array to local storage
  renderTodos() // Update the UI
})

// === main ===

let todos = loadTodos()
renderTodos()
