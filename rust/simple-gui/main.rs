extern crate gtk;
extern crate gio;

use gtk::prelude::*;
use gio::prelude::*;

fn main() {
    gtk::init().expect("Failed to initialize GTK.");

    let app = gtk::Application::new(
        Some("com.example.simplegui"),
        Default::default(),
    ).expect("Initialization failed...");

    app.connect_activate( |app| {
        let window = gtk::ApplicationWindow::new(app);
        window.set_title("Rust+GTK GUI");
        window.set_default_size(800, 200);

        let label = gtk::Label::new(Some("Hello World! (from rust)"));

        window.add(&label);

        window.show_all();
    });

    app.run(&[]);
}

