import './style.css'

import * as T from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls'

// setup
const scene   = new T.Scene()

const camera  = new T.PerspectiveCamera(
  75, 
  window.innerWidth / window.innerHeight, 
  .1,
  1000
)

const renderer = new T.WebGLRenderer({
  canvas: document.querySelector('#bg')
})

renderer.setPixelRatio(window.devicePixelRatio)
renderer.setSize(window.innerWidth, window.innerHeight)
camera.position.setZ(30)
camera.position.setX(-3)

renderer.render(scene, camera)


// torus
const geometry  = new T.TorusGeometry(10, 3, 16, 100)
const material  = new T.MeshStandardMaterial({ color: 0xff6347 })
const torus     = new T.Mesh(geometry, material)

scene.add(torus)


// lights
const pointLight = new T.PointLight(0xffffff)
pointLight.position.set(5, 5, 5)

const ambientLight = new T.AmbientLight(0xffffff)
scene.add(pointLight, ambientLight)

// helpers
// const lightHelper = new T.PointLightHelper(pointLight)
// const gridHelper  = new T.GridHelper(200, 50)
// scene.add(lightHelper, gridHelper)

// controls
// const controls = new OrbitControls(camera, renderer.domElement)


function addStar() {
  const geometry = new T.SphereGeometry(.25, 24, 24)
  const mateiral = new T.MeshStandardMaterial({ color: 0xffffff })
  const star     = new T.Mesh(geometry, material)

  const [x, y, z] = Array(3)
    .fill()
    .map(() => T.MathUtils.randFloatSpread(100))

  star.position.set(x, y, z)
  scene.add(star)
}

Array(200) // hmmmm, maybe we can do this better
  .fill()
  .forEach(addStar)


// background
const spaceTexture = new T.TextureLoader().load('space.jpg')
scene.background = spaceTexture


// avatar
const jeffTexture = new T.TextureLoader().load('jeff.png')
const jeff = new T.Mesh(
  new T.BoxGeometry(3, 3, 3),
  new T.MeshBasicMaterial({ map: jeffTexture })
)

scene.add(jeff)


// moon 
const moonTexture   = new T.TextureLoader().load('moon.jpg')
const normalTexture = new T.TextureLoader().load('normal.jpg')

const moon = new T.Mesh(
  new T.SphereGeometry(3, 32, 32),
  new T.MeshStandardMaterial({
    map: moonTexture,
    normalMap: normalTexture
  })
)

scene.add(moon)

moon.position.setZ( 30)
moon.position.setX(-10)

jeff.position.setZ(-5)
jeff.position.setX( 2)


// scroll animation

function moveCamera() {
  const t = document.body.getBoundingClientRect().top
  moon.rotation.x += .05
  moon.rotation.y += .075
  moon.rotation.z += .05

  jeff.rotation.y += .01
  jeff.rotation.z += .01

  camera.position.z = t * -0.01
  camera.position.x = t * -0.0002
  camera.position.y = t * -0.0002
}

document.body.onscroll = moveCamera
moveCamera()


// animation loop

function animate() {
  requestAnimationFrame(animate)

  torus.rotation.x += .01
  torus.rotation.y += .0005
  torus.rotation.z += .01

  moon.rotation.x  += .0005

  // controls.update() 

  renderer.render(scene, camera)
}

animate()


