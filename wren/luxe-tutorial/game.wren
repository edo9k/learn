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

    app.color = [0, 0, 0, 1]

  } //ready

  tick(delta) {

    if(_logo == null) {

      _logo = Entity.create(app.ui, "logo")
      Transform.create(_logo)
      Transform.set_pos(_logo, app.width/2, app.height/2, 0)
      Sprite.create(_logo, Assets.material("luxe: material/logo.sprite"), 128, 128)

    } else {
  
      var pos = Camera.screen_point_to_world(
                  app.ui_camera, 
                  Input.mouse_x(),
                  Input.mouse_y())
      Transform.set_pos(_logo, pos.x, pos.y, 0)

    } //if logo

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
