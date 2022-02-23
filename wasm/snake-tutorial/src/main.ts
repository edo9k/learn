import * as w4 from "./wasm4";
import { Point, Snake } from "./snake"

const snake = new Snake()
let prevState: u8
let frameCount = 0

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

  if (frameCount % 15 == 0)
    snake.update()

  input() 

  store<u16>(w4.DRAW_COLORS, 2);
  w4.text("shnakey", 32, 30);

  snake.draw()
}
