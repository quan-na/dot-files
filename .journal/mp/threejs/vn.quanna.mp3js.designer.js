var scene = new THREE.Scene();
var camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );

var renderer = new THREE.WebGLRenderer();
renderer.setSize( window.innerWidth, window.innerHeight );
document.body.appendChild( renderer.domElement );
var lastModel = '';
for (var key in models) {
  lastModel = key;
}
console.log('Last model name : \n' + lastModel);
var model = models[lastModel]();
scene.add(model);
var frame = models['sample']();
scene.add(frame);
camera.position.z = 20;
camera.position.y = 10;
camera.lookAt(new THREE.Vector3());
var render = function () {
  requestAnimationFrame( render, 100 );

  model.rotation.y += 0.04;
  frame.rotation.y += 0.04;

  renderer.render(scene, camera);
};
render();
