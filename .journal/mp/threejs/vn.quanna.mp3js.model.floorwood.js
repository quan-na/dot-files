if (typeof(models) != 'object')
  models = {};
models['floorwood'] = function() {
    var geometry = new THREE.BoxGeometry(10, 0.5, 10);
    var translate = new THREE.Matrix4().makeTranslation(0, 5-0.25, 0);
    geometry.applyMatrix(translate);
    var texture = THREE.ImageUtils.loadTexture("com.textures.woodfine.11.jpg");
    var material = new THREE.MeshBasicMaterial( { map: texture } );
    return new THREE.Mesh( geometry, material );
  }
