from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return """
        <strong style="font-size:64pt">Hello, World!</strong>
        <sub>with Flask &amp; Heroku</sub>
    """

if __name__ == "__main__":
    app.run()

