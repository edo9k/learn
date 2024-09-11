from direct.showbase.ShowBase import ShowBase
from direct.task import Task
from panda3d.core import Vec3
from math import sin, cos, radians

class MyApp(ShowBase):
    def __init__(self):
        ShowBase.__init__(self)

        # Disable the default camera controls
        self.disableMouse()

        # Load the models (multiple cakes)
        self.load_models()

        # Initialize keyboard controls
        self.setup_keyboard()  # Initialize the keyboard map

        # Setting up first-person camera controls
        self.camera_init()

        # Task to update the camera movement
        self.taskMgr.add(self.camera_task, "cameraTask")

    def load_models(self):
        # Load the orange_cake.obj model and place it several times in the scene
        for i in range(5):
            cake = self.loader.loadModel("models/orange_cake.obj")
            cake.setPos(i * 3, 0, 0)  # Spread the cakes along the X-axis
            cake.setScale(1, 1, 1)
            cake.reparentTo(self.render)

    def camera_init(self):
        # Set initial camera position
        self.camera.setPos(0, -10, 2)
        self.camera.lookAt(0, 0, 0)

        # First-person camera controls
        self.heading = 0
        self.pitch = 0
        self.mouseSensitivity = 0.2

    def camera_task(self, task):
        # Mouse controls for looking around
        if self.mouseWatcherNode.hasMouse():
            md = self.win.getPointer(0)
            x = md.getX()
            y = md.getY()

            # Rotate the camera based on mouse movement
            self.heading -= (x - self.win.getProperties().getXSize() // 2) * self.mouseSensitivity
            self.pitch -= (y - self.win.getProperties().getYSize() // 2) * self.mouseSensitivity

            # Clamp the pitch
            self.pitch = max(-90, min(90, self.pitch))

            # Update the camera orientation
            self.camera.setHpr(self.heading, self.pitch, 0)

            # Reset the mouse position to the center of the window
            self.win.movePointer(0, self.win.getProperties().getXSize() // 2, self.win.getProperties().getYSize() // 2)

        # Camera movement controls (WASD keys)
        movement_speed = 0.1
        direction = Vec3(0, 0, 0)

        if self.keyboard_map["w"]:
            direction += self.camera.getQuat().getForward()
        if self.keyboard_map["s"]:
            direction -= self.camera.getQuat().getForward()
        if self.keyboard_map["a"]:
            direction -= self.camera.getQuat().getRight()
        if self.keyboard_map["d"]:
            direction += self.camera.getQuat().getRight()

        # Move the camera
        self.camera.setPos(self.camera.getPos() + direction * movement_speed)

        return Task.cont

    def setup_keyboard(self):
        # Initialize a keyboard map to track key presses
        self.keyboard_map = {"w": False, "s": False, "a": False, "d": False}

        # Set up the key events
        self.accept("w", self.update_keyboard_map, ["w", True])
        self.accept("w-up", self.update_keyboard_map, ["w", False])
        self.accept("s", self.update_keyboard_map, ["s", True])
        self.accept("s-up", self.update_keyboard_map, ["s", False])
        self.accept("a", self.update_keyboard_map, ["a", True])
        self.accept("a-up", self.update_keyboard_map, ["a", False])
        self.accept("d", self.update_keyboard_map, ["d", True])
        self.accept("d-up", self.update_keyboard_map, ["d", False])

    def update_keyboard_map(self, key, value):
        self.keyboard_map[key] = value

app = MyApp()
app.run()
