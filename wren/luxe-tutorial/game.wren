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

    // load scene
    Scene.load(app.world, "scene/area1")

    // create player
    create_player()

  } //ready

  create_player() {
    _player = Entity.create(app.world, "player")
    var material = Assets.material("material/player")
    Sprite.create(_player, material, 58, 136)
    Transform.create(_player)
    Transform.set_pos(_player, app.world_width/2, app.world_height/2)

    Move.create(_player)
    Move.allow_y(_player, false)

    _move_speed = 80
    _move_target = Entity.create(app.world, "player.move")
    Transform.create(_move_target)

  } // create_player

  tick(delta) {

    var mouse = app.mouse

    if(Input.mouse_state_released(MouseButton.left)) {

      var direction = Math.dir2D(mouse, Transform.get_pos(_player))

      if(direction.x != 0) Sprite.set_flip_h(_player, direction.x > 0)

      Transform.set_pos(_move_target, mouse.x, mouse.y)
      Move.to(_player, _move_target, _move_speed)
    }

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
