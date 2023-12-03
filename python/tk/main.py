
import tkinter as tk 

window = tk.Tk()

window.title = "Test Tkinter app" 

label = tk.Label(window, text="Hello, World!")
label.pack()

button = tk.Button(window, text="Click Me")
button.pack()

def button_click():
    print("Button clicked!")

button.config(command=button_click)

window.mainloop()

