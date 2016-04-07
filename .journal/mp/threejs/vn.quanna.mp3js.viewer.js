var scene = new THREE.Scene();
var camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );

var renderer = new THREE.WebGLRenderer();
renderer.setSize( window.innerWidth, window.innerHeight );
document.body.appendChild( renderer.domElement );
var putModel = function(modelName, x, y, z, r) {
  var model = models[modelName]();
  model.position.x = x*10;
  model.position.y = y*10;
  model.position.z = z*10;
  model.rotation.y = r*90; // not sure about this
};
