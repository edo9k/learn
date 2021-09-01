import "luxe: render" for Render, RenderLayerDesc, PassLayerDesc, LoadAction
import "luxe: render" for SortType, Image, ImageDesc, ImageType, PixelFormat
import "luxe: settings" for Settings

class Renderer {

  construct new() {

    System.print("game / render / init / ok")

    var target = ImageDesc.new()
        target.type = ImageType.image2D
        target.pixel_format = PixelFormat.rgba8Unorm
        target.width = Settings.get("game.world.width", Render.window_w())
        target.height = Settings.get("game.world.height", Render.window_h())

    Render.define_resource("scene", Image.create(target))

  } //new

  ready() {

  }

  tick(delta) {

  }

  render_path(ctx) {

    if(ctx.path == "game") {
      game_render_path(ctx)
    } else if(ctx.path == "ui") {
      ui_render_path(ctx)
    }

  } //render_path

  game_render_path(ctx) {

    var layer = RenderLayerDesc.new()
        layer.dest.color[0].render_target = "scene"
        layer.dest.color[0].clear_color = ctx.get("clear_color", [1,1,1,1])
        layer.dest.color[0].load_action = LoadAction.clear
        layer.dest.depth.load_action = LoadAction.clear

    ctx.layer_render("default", layer)

  } //game_render_path

  ui_render_path(ctx) {

    var layer = RenderLayerDesc.new()
        layer.dest.color[0].load_action = LoadAction.dont_care
        layer.dest.depth.load_action = LoadAction.clear

    ctx.layer_render("default", layer)

  } //ui_render_path

} //Renderer
