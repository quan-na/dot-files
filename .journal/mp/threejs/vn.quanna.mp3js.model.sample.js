if (typeof(models) != 'object')
  models = {};
models['sample'] = function() {
    var geometry = new THREE.BoxGeometry( 10, 10, 10 );
    var texture = THREE.ImageUtils.loadTexture("com.graphicsfuel.targetgreen512.png");
    var material = new THREE.MeshBasicMaterial( { map: texture, wireframe: true } );
    return new THREE.Mesh( geometry, material );
  };
