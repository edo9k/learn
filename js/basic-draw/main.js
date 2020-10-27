
const code = document.querySelector('#code')
const canvas = document.querySelector('#output')
const context = canvas.getContext('2d')

// add mode
code.value = `MO.2
REA.X%:REA.Y%:DR.X%*10,Y%*10
D.`

canvas.width = 500
canvas.height = 500

context.strokeStyle = 'white'
context.lineWidth = 3

// last mouse position
let last = {x: 0, y: 0}

// basic draw functions
const MOVE = 'move'
const DRAW = 'draw'

let MODE = MOVE

const f = n => Math.floor(n/10)

const draw = e => {

  context.beginPath()
  context.moveTo(last.x, last.y)

  if (MODE === MOVE) 
    code.value += `${f(e.offsetX*2)},${f(1000 - e.offsetY*2)},`

  if (MODE === DRAW) {
    code.value += `${f(e.offsetX*2)},${f(1000 - e.offsetY*2)},`
    context.lineTo(e.offsetX, e.offsetY)
    context.stroke()
  }

  last = { x: e.offsetX, y: e.offsetY }
}

canvas.addEventListener('click', draw)

document.querySelector('#move')
  .addEventListener('click', () => { MODE = MOVE })

document.querySelector('#draw')
  .addEventListener('click', () => { MODE = DRAW })
