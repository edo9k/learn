import "luxe: io" for IO
import "luxe: game" for Ready, Frame
import "luxe: assets" for Assets
import "luxe: input" for Input, Key, MouseButton
import "luxe: world" for World, Entity, Scene, Transform, Sprite, Anim, Prototype, Camera
import "luxe: math" for Math

import "outline/app" for App
import "modifier/move" for Move

class Game is Ready {

  construct ready() {

    super("ready!")

    app = App.new()


    app.color = [0, 0, 0, 1] // make bg black

    // create player entity
    var player = Entity.create(app.world, "player")
    // add material from assets
    var material = Assets.material("material/player")
    // attach sprite to player entity
    Sprite.create(player, material, 58, 136)
    // attach transform to entity, to manipulate position
    Transform.create(player)
    // set position to screen center
    Transform.set_pos(player, app.world_width/2, app.world_height/2)

  } //ready

  tick(delta) {

    var mouse = app.mouse

    if(Input.key_state_released(Key.escape)) {
      IO.shutdown()
    }

  } //tick

  destroy() {

    System.print("unready!")
    app.destroy()

  } //destroy

  app : App { _app }
  app=(v) { _app=v }

} //Game
