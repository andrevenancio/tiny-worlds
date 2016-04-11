class SkyDome

    constructor: (size=5000) ->

        geometry = new THREE.SphereGeometry size, 32, 32
        # geometry.applyMatrix( new THREE.Matrix4().makeRotationY(90 * Math.PI / 180 ) )

        material = new THREE.MeshBasicMaterial {
            color: 0x336699
            wireframe: false
            side: THREE.BackSide
        }

        @mesh = new THREE.Mesh geometry, material
