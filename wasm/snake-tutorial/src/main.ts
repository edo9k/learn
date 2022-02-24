import * as w4 from "./wasm4";
import { Point, Snake } from "./snake"

const snake = new Snake()
const fruit = new Point(rnd(), rnd())
let prevState: u8
let frameCount = 0

const fruitSprite = memory.data<u8>([ 
 	0b00000000,
	0b10100000,
	0b00000010,
	0b00000000,
	0b00001110,
	0b11110000,
	0b00110110,
	0b01011100,
	0b11010110,
	0b01010111,
	0b11010101,
	0b01010111,
	0b00110101,
	0b01011100,
	0b00001111,
	0b11110000 
])

function rnd(n : i32 = 20) : u16 {
  return u16(Math.floor(Math.random() * n))
}

function input(): void {
  const gamepad = load<u8>(w4.GAMEPAD1)
  const justPressed = gamepad & (gamepad ^ prevState)

  if (justPressed & w4.BUTTON_LEFT)   snake.left()
  if (justPressed & w4.BUTTON_RIGHT)  snake.right()
  if (justPressed & w4.BUTTON_UP)     snake.up()
  if (justPressed & w4.BUTTON_DOWN)   snake.down()

  prevState = gamepad
}

export function start(): void {
  store<u32>(w4.PALETTE, 0xfbf7f3, 0 * sizeof<u32>())
  store<u32>(w4.PALETTE, 0xe5b083, 1 * sizeof<u32>())
  store<u32>(w4.PALETTE, 0x426e5d, 2 * sizeof<u32>())
  store<u32>(w4.PALETTE, 0x20283d, 3 * sizeof<u32>())
}

export function update (): void {
  frameCount++

  input() 


  if (frameCount % 15 == 0) {
    snake.update()

    if (snake.isDead()) {
      snake.body = [
        new Point(2, 0),
        new Point(1, 0),
        new Point(0, 0)
      ]
      snake.direction.x = 1
      snake.direction.y = 0
    }

    if (snake.body[0].equals(fruit)) {
      let tail = snake.body[snake.body.length - 1]
      snake.body.push(new Point(tail.x, tail.y))
      fruit.x = rnd()
      fruit.y = rnd()
    }
  }


  store<u16>(w4.DRAW_COLORS, 2)
  w4.text("shnakey",    3, 130)
  w4.text(`snake: x: ${ snake.body[0].x } y: ${ snake.body[0].y }`, 3, 140)
  w4.text(`apple: x: ${ fruit.x         } y: ${ fruit.y         }`, 3, 150)

  snake.draw()

  store<u16>(w4.DRAW_COLORS, 0x4320)
  w4.blit(fruitSprite, fruit.x * 8, fruit.y * 8, 8, 8, w4.BLIT_2BPP)
}


