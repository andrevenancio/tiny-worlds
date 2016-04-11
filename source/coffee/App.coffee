# import templates.BaseThreejs
# import renderables.SkyDome
class App extends BaseThreejs

    constructor: ->
        super()

    addLights: ->
        @ambient = new THREE.AmbientLight 0x444444
        @scene.add @ambient

        @light = new THREE.SpotLight 0xffffff, 1, 0, Math.PI / 2, 1
        @light.position.set 0, 0, 5000
        @light.target.position.set 0, 0, 0
        @scene.add @light
        null

    addScene: ->
        center = new THREE.AxisHelper 5
        @scene.add center

        @dome = new SkyDome 5000
        @scene.add @dome.mesh
        null

    updateScene: ->
        null
