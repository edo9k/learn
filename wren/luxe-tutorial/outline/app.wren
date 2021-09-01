import "luxe: world" for World, Camera, Entity, Transform, Sprite
import "luxe: render" for Render, Material, Image
import "luxe: settings" for Settings
import "luxe: game" for Frame
import "luxe: input" for Input
import "luxe: id" for ID
import "luxe: io" for IO

class App {

  world       { _world }
  ui          { _ui_world }

  camera      { _camera }
  ui_camera   { _ui_camera }

  color       { _color }
  color=(v)   { _color = v }
  bar_color       { _bar_color }
  bar_color=(v)   { _bar_color = v }

  width       { Render.window_w() }
  height      { Render.window_h() }
  scale       { Render.drawable_ratio() }

  world_width { Settings.get("game.world.width", Render.window_w()) }
  world_height { Settings.get("game.world.height", Render.window_h()) }
  game_region { 

    var dest_size_x = width
    var dest_size_y = height
    var dest_size_half_x = (dest_size_x * 0.5).floor
    var dest_size_half_y = (dest_size_y * 0.5).floor
    var region = [0, 0, dest_size_x, dest_size_y]

    //so here we can check whether the input is
    //portrait or landscape in relation to the output size
    //if < 1, it's portrait. if >= 1, landscape
    var ratio = world_width / world_height
    var portrait = ratio < 1.0
    if(portrait) {
      region.z = (dest_size_y * ratio).floor
      region.x = (dest_size_half_x - (region.z * 0.5)).floor
      if(region.z > dest_size_x) {
        region.x = 0.0
        region.z = dest_size_x
        region.w = (dest_size_x / ratio).floor
        region.y = (dest_size_half_y - (region.w * 0.5)).floor
      }
    } else {
      region.w = (dest_size_x / ratio).floor
      region.y = (dest_size_half_y - (region.w * 0.5)).floor
      if(region.w >= dest_size_y) {
        region.y = 0.0
        region.w = dest_size_y
        region.z = (dest_size_y * ratio).floor
        region.x = (dest_size_half_x - (region.z * 0.5)).floor
      }
    }

    return region
  }

  mouse {

    var mx = Input.mouse_x()
    var my = Input.mouse_y()
    var region = game_region
    var ratio_x = region.z / width
    var ratio_y = region.w / height

    mx = (mx - region.x) / ratio_x
    my = (my - region.y) / ratio_y

    my = my.floor
    mx = mx.floor

    return Camera.screen_point_to_world(_camera, mx, my)
  }
  
  mouse_to_world(mx, my) {

    var region = game_region
    var ratio_x = region.z / width
    var ratio_y = region.w / height

    mx = (mx - region.x) / ratio_x
    my = (my - region.y) / ratio_y

    my = my.floor
    mx = mx.floor

    return Camera.screen_point_to_world(_camera, mx, my)

  } //mouse_to_world
  
  resize_listen(fn) {
    if(!fn) return
    var uuid = ID.uuid()
    _on_resize[uuid] = fn
  }

  resize_unlisten(id) {
    _on_resize.remove(id)
  }

  construct new() {
    
    _on_resize = {}
    _color = [1,1,1,1]
    _bar_color = [0,0,0,1]

    //create worlds

      _world = World.create("game")
      _ui_world = World.create("ui")
      _display_world = World.create("display")

    //create cameras

      _camera = Entity.create(_world, "app.camera")
      Transform.create(_camera)
      Camera.create(_camera)
      Camera.set_default(_world, _camera)
      Camera.set2D(_camera, 0, 0, world_width, world_height, -100, 100)

      _ui_camera = Entity.create(_ui_world, "app.ui_camera")
      Transform.create(_ui_camera)
      Camera.create(_ui_camera)
      Camera.set_default(_ui_world, _ui_camera)

      _display_camera = Entity.create(_display_world, "app.display_camera")
      Transform.create(_display_camera)
      Camera.create(_display_camera)
      Camera.set_default(_display_world, _display_camera)
      
      var region = game_region
      _display_sprite = Entity.create(_display_world, "app.display")
      _display_mat = Material.create("luxe: material_basis/sprite_pixelated")
      Material.set_input(_display_mat, "sprite.image", Image.get_resource("scene"))
      Sprite.create(_display_sprite, _display_mat, region.z, region.w)
      Sprite.set_origin(_display_sprite, 0, 0)
      Sprite.set_flip_v(_display_sprite, true)
      Transform.create(_display_sprite)
      Transform.set_pos(_display_sprite, region.x, region.y)

    //resize cameras on size changed

      IO.on("engine.runtime.window.size_changed") {|type, data|
        var region = game_region
        System.print("outline / resized / %(Render.window_w())x%(Render.window_h()) region %(game_region)")
        Camera.set2D(_camera, 0, 0, world_width, world_height, -100, 100)
        Camera.set2D(_ui_camera, 0, 0, Render.window_w(), Render.window_h(), -100, 100)
        Camera.set2D(_display_camera, 0, 0, Render.window_w(), Render.window_h(), -100, 100)

        Transform.set_pos(_display_sprite, region.x, region.y)
        Sprite.set_size(_display_sprite, region.z, region.w)

        _on_resize.each {|fn|
          fn.call(Render.window_w(), Render.window_h())
        }
      }

    //update our worlds

      Frame.on(Frame.sim) {|delta|
        World.tick(_world, delta)
        World.tick(_display_world, delta)
        World.tick(_ui_world, delta)
      }

      Frame.before(Frame.visual) {|delta|
        var camera = Transform.get_pos_world_unsnapped(_camera)
        Transform.set_pos(_display_camera, -camera.x.fraction, -camera.y.fraction)
        Transform.sync(_display_camera)
      }

    //render our worlds

      Frame.on(Frame.visual) {|delta|
        World.render(_world, _camera, "game", { "clear_color":_color, "bar_color":_bar_color })
        World.render(_display_world, _display_camera, "ui")
        World.render(_ui_world, _ui_camera, "ui")
      }

  } //new

  destroy() {

    //destroy cameras

      Camera.destroy(_camera)
      Camera.destroy(_ui_camera)

      Entity.destroy(_camera)
      Entity.destroy(_ui_camera)

    //destroy worlds

      World.destroy(_ui_world)
      World.destroy(_world)

  } //destroy

} //
