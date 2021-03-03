#!/usr/bin/gjs

const Gtk = imports.gi.Gtk
const Lang = imports.lang

Gtk.init(null)

const MyWindow = Lang.Class({
  Name: 'MyWindow',
  Extends: Gtk.Window,

  _init: function() {
    this.parent({ title: 'Hello, World!' })

    this.box = new Gtk.Box({ spacing: 6 })
    this.add(this.box)

    this.button1 = new Gtk.Button({ label: 'Hello' })
    this.button1.connect("clicked", this.onButton1Clicked)
    this.box.pack_start(this.button1, true, true, 0)

    this.button2 = new Gtk.Button({ label: 'Goodbye' })
    this.button2.connect("clicked", this.onButton2Clicked)
    this.box.pack_start(this.button2, true, true, 0)

  },

  onButton1Clicked: widget => print("Hello"),

  onButton2Clicked: widget => print("Goodbye"),

})

const win = new MyWindow()

win.connect("delete-event", Gtk.main_quit)
win.show_all()
Gtk.main()

