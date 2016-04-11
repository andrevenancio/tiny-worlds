class BaseThreejs

    fov: 75
    near: 1
    far: 20000

    constructor: ->

        @scene = new THREE.Scene()

        @camera = new THREE.PerspectiveCamera @fov, window.innerWidth / window.innerHeight, @near, @far
        @camera.position.z = 100

        @renderer = new THREE.WebGLRenderer { antialias: true, alpha: false }
        @renderer.setSize window.innerWidth, window.innerHeight
        document.body.appendChild @renderer.domElement

        @controls = new THREE.OrbitControls @camera
        @controls.minDistance = 0
        @controls.maxDistance = 5000

        window.addEventListener 'resize', @onResize, false

        @init()

        @onResize()
        @update()

    onResize: =>
        w = window.innerWidth
        h = window.innerHeight

        @renderer.setSize w, h
        @camera.projectionMatrix.makePerspective @fov, w / h, @near, @far
        null

    update: =>
        requestAnimationFrame @update

        @updateScene()
        @renderer.render @scene, @camera
        null

    init: ->
        @addLights()
        @addScene()
        null

    addLights: ->
        # to be overriden
        null

    addScene: ->
        # to be overriden
        null

    updateScene: ->
        # to be overriden
        null
