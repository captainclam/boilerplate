# Boilerplate

Base npm and grunt conf for simple dev projects.


## TODO:

```
http://gruntjs.com/api/grunt.option
var target = grunt.option('target') || 'dev';
grunt deploy --target=staging
```

## Consider:
- https://github.com/vojtajina/grunt-bump
- https://github.com/gunta/grunt-manifest

```
manifest:
  generate: 
    options: 
      basePath: "www",
      network: ["*"],
      timestamp: true
    src: [
      '*.html'
      'images/*.gif'
      'images/*.png'
      'css/*.css'
      'js/*.js'
    ]
    dest: "www/manifest.appcache"
grunt.loadNpmTasks 'grunt-manifest'
```
