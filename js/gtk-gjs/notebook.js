#!/usr/bin/gjs

imports.gi.versions.Gtk = '3.0'

const Gtk   = imports.gi.Gtk
const Lang  = imports.lang

Gtk.init(null)


const Notebook = Lang.Class({
  Name: 'Notebook',
  Extends: Gtk.Window, 

  _init: function() {
    this.parent({ title: 'Notebook Example' })
    this.set_border_width(3)

    const notebook = new Gtk.Notebook()

    const page1 = new Gtk.Box()
    page1.set_border_width(10)
    page1.add(new Gtk.Label({ 
      label: 'Default Page'
    }))
    notebook.append_page(
      page1,
      new Gtk.Label({ label: 'Plain Title' })
    )

    const page2 = new Gtk.Box()
    page2.set_border_width(10)
    page2.add(new Gtk.Label({ 
      label: 'A page with an image for a title'
    }))
    notebook.append_page(
      page2,
      Gtk.Image.new_from_icon_name('help-about', Gtk.IconSize.MENU)
    )

    this.add(notebook)
  } 
})

let win = new Notebook()
win.connect('delete-event', Gtk.main_quit)
win.show_all()
Gtk.main()

