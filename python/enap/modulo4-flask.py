#!/usr/bin/python3

from flask import Flask, redirect, url_for

app = Flask(__name__)

@app.route("/")
def home():
    return """
    <h1>Welcome</h1>

    <h2>This is the homepage for the Flask example.</h2>
    
    <div>
        <h3>Other pages in this example are:</h3>
        <ul>
            <li><a href=" link "> Admin page (dummy) </a></li>
            <li><a href="/Fulano"> Welcome "name" page </a></li>
            <li><a href="/"> This page (home) </a></li>
        </ul>
    </div>"""

@app.route("/<name>")
def user(name):
    return f"<h3>Hello, {name}! Welcome to the dummy greeting page.</h3>"

@app.route("/admin")
def admin():
    return redirect(url_for("home"))

if __name__ == "__main__":
    app.run()

