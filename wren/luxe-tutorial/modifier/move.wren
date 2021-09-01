import "luxe: io" for IO
import "luxe: world" for World, Entity, Modifiers, ModifierSystem, Transform, Math
import "luxe: assets" for Strings

//User facing API
//This is what the user of your modifier will interact with
var Empty = [0,0]
class Move {

  static create(entity) { Modifiers.create(This, entity) }
  static destroy(entity) { Modifiers.destroy(This, entity) }
  static has(entity) { Modifiers.has(This, entity) }

  static follow(entity, target, offset, speed) {
    var system = Modifiers.get_system_in_world(This, Entity.get_world(entity))
        system.follow(entity, target, offset, speed)
  } //to

  static to(entity, target, offset, speed, done) {
    var system = Modifiers.get_system_in_world(This, Entity.get_world(entity))
        system.move_to(entity, target, offset, speed, done)
  } //to

  static to(entity, target, speed, done) {
    var system = Modifiers.get_system_in_world(This, Entity.get_world(entity))
        system.move_to(entity, target, Empty, speed, done)
  } //to

  static to(entity, target, speed) {
    var system = Modifiers.get_system_in_world(This, Entity.get_world(entity))
        system.move_to(entity, target, Empty, speed, null)
  } //to

  static allow_x(entity, state) {
    Modifiers.get(This, entity).allow_x = state
  }

  static allow_y(entity, state) {
    Modifiers.get(This, entity).allow_y = state
  }

} //Move

//Your modifier system implementation.
//This speaks to the engine and your user facing API
//to do the actual work. You'll get notified when things change
//in the world and respond to them here.
class MoveSystem is ModifierSystem {

  construct new() {
    //called when your system is first created.
  }

  init(world) {
    _world = world
    //called when your modifier is created in a world
    _entity_to_done = {}
  }

  destroy() {
    //called when your modifier is removed from a world
  }

  attach(entity, move) {
    //called when attached to an entity
    _entity_to_done[entity] = null
    move.pos = Transform.get_pos(entity)
  }

  detach(entity, move) {
    //called when detached from an entity, like on destroy
    _entity_to_done.remove(entity)
  }

  follow(entity, target, offset, speed) {
    
    var move = get(entity)
        move.follow = true
        move.target = target
        move.offset = offset
        move.speed = speed
        move.moving = true
        move.pos = Transform.get_pos_world(entity)

    _entity_to_done[entity] = null

  }

  move_to(entity, target, offset, speed, done) {

    var move = get(entity)
        move.follow = false
        move.target = target
        move.offset = offset
        move.speed = speed
        move.moving = true
        move.pos = Transform.get_pos_world(entity)

    _entity_to_done[entity] = done

  } //to

  tick(delta) {
      //called usually once every frame.
      //called when the world that this modifier lives in, is ticked
    each {|entity, move|

        //nothing to do if not moving
      if(!move.moving) return

      var offset = move.offset
      var pos = move.pos
      var dest = Transform.get_pos_world(move.target)
          dest.x = dest.x + offset.x 
          dest.y = dest.y + offset.y

      var direction = [
        dest.x - pos.x,
        dest.y - pos.y
      ]

        //if we don't allow an axis, zero it out
      if(move.allow_x == false) {
        direction.x = 0
        dest.x = pos.x
      }
      if(move.allow_y == false) {
        direction.y = 0
        dest.y = pos.y
      }

        //normalize it so it's 0..1 range
      Math.normalize2D(direction)

      var updated = [pos.x, pos.y]

      if(move.allow_x) {
        updated.x = pos.x + (direction.x * move.speed * delta)
      }

      if(move.allow_y) {
        updated.y = pos.y + (direction.y * move.speed * delta)
      }

        //We don't want to overshoot, so we check for that
      var distance_before = Math.dist2D(pos, dest)
      var distance_moved = Math.dist2D(updated, pos)
      if(distance_before <= distance_moved) {
        updated.x = dest.x
        updated.y = dest.y
        if(!move.follow) move.moving = false
      }

        //apply the change to the transform, this moves the entity
      move.pos = updated
      Transform.set_pos_world(entity, updated.x, updated.y)

        //if we're done, notify the callback
      if(!move.moving) {
        var fn = _entity_to_done[entity]
        if(fn) fn.call()
      }
    }
  } //tick

} //MoveSystem

var Modifier = MoveSystem //required
