import "luxe: io" for IO
import "luxe: world" for World, Entity, Modifiers, ModifierSystem
import "luxe: events" for Events

class Event {

  static create(entity) { Modifiers.create(This, entity) }
  static destroy(entity) { Modifiers.destroy(This, entity) }
  static has(entity) { Modifiers.has(This, entity) }
  
  static once(entity, tags, fn) {
    var system = Modifiers.get_system_in_world(This, Entity.get_world(entity))
        system.once(entity, tags, fn)
  }
  static listen(entity, tags, fn) {
    var system = Modifiers.get_system_in_world(This, Entity.get_world(entity))
        system.listen(entity, tags, fn)
  }
  static unlisten(entity, tags, fn) {
    var system = Modifiers.get_system_in_world(This, Entity.get_world(entity))
        system.unlisten(entity, tags, fn)
  }
  static unlisten(entity, tags) {
    var system = Modifiers.get_system_in_world(This, Entity.get_world(entity))
        system.unlisten(entity, tags)
  }
  static emit(entity, tags) {
    var system = Modifiers.get_system_in_world(This, Entity.get_world(entity))
        system.emit(entity, tags, null)
  }
  static emit(entity, tags, data) {
    var system = Modifiers.get_system_in_world(This, Entity.get_world(entity))
        system.emit(entity, tags, data)
  }

} //Event


class EventSystem is ModifierSystem {

  construct new() {}

  init(world) {
    _world = world
    _entity_to_events = {}
  }

  destroy() {

  }

  attach(entity, data) {
    _entity_to_events[entity] = Events.new()
  }

  detach(entity, data) {
    _entity_to_events.remove(entity)
  }

  once(entity, tags, fn) {
    var events = _entity_to_events[entity]
    if(events) events.once(tags, fn)
  }
  
  listen(entity, tags, fn) {
    var events = _entity_to_events[entity]
    if(events) events.listen(tags, fn)
  }
  
  unlisten(entity, tags, fn) {
    var events = _entity_to_events[entity]
    if(events) events.unlisten(tags, fn)
  }

  unlisten(entity, tags) {
    var events = _entity_to_events[entity]
    if(events) events.unlisten(tags)
  }

  emit(entity, tags, data) {
    var events = _entity_to_events[entity]
    if(events) events.emit(tags, data)
  }

} //EventSystem

var Modifier = EventSystem //required
