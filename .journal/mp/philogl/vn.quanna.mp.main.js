function webGLStart() {
  PhiloGL('mp-view-canvas', {
    program: {
               id: 'basic-texture',
               from: 'uris',
               vs: 'vn.quanna.mp.shaders.vs.glsl',
               fs: 'vn.quanna.mp.shaders.fs.glsl'
             },
    camera: {
              position: { x: 0.0, y:17.0, z:50.0 }
            },
    textures: {
                src: ['com.textures.marblewhite.64.jpg',
                      'com.textures.gravelcobble.18.jpg',
                      'com.textures.wallpaperforties.8.jpg',
                      'com.textures.woodfine.11.jpg',
                      'com.graphicsfuel.targetgreen512.png']
              },
    onError: function(e) {
               alert("An error ocurred while loading the application" + e);
               throw e;
             },
    onLoad: function(app) {
              var gl = app.gl,
                  canvas = app.canvas,
                  program = app.program,
                  camera = app.camera,
                  view = new PhiloGL.Mat4,
                  rCube = 0;

              gl.viewport(0, 0, canvas.width, canvas.height);
              gl.clearColor(0, 0, 0, 1);
              gl.clearDepth(1);
              gl.enable(gl.DEPTH_TEST);
              gl.depthFunc(gl.LEQUAL);
              
              
            }
  });
}
