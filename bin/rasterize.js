#!/usr/bin/env node

// Largely based on https://github.com/mbostock/us-atlas/blob/master/bin/rasterize
var fs = require("fs"),
    d3 = require("d3"),
    shapefile = require("shapefile"),
    Canvas = require("canvas"),
    topojson = require('topojson'),
    util     = require('util')

console.log('Generating file for ' + process.argv[2])
var file = fs.createWriteStream(process.argv[3]);

var width = 350
    height = 350

var canvas = new Canvas(width, height),
    context = canvas.getContext('2d');

context.fillStyle = '#777'
context.strokeStyle = '#777'
context.lineWidth = 0.5
context.lineJoin = 'round'
context.antialias = 'subpixel'

var projection = d3.geo.albers().rotate([120])
  .scale(1)
  .translate([ 0, 0 ])

var path = d3.geo.path()
    .projection(projection)
    .context(context)
    .pointRadius(1);



shapefile.read(process.argv[2], {"ignore-properties": false}, function(error, collection) {
  projection.scale(1).translate([0, 0])
  var bb = collection.bbox;
  b = path.bounds(collection);
  console.log(b);
  s = .99 / Math.max((b[1][0] - b[0][0]) / width, (b[1][1] - b[0][1]) / height)
  t = [(width - s * (b[1][0] + b[0][0])) / 2, (height - s * (b[1][1] + b[0][1])) / 2]
  projection.scale(s).translate(t)
  collection.features.forEach(function(feature) {
    context.beginPath();
    path(feature);
    if (feature.geometry && /Point$/.test(feature.geometry.type)) {
      context.fill();
    } else {
      context.stroke();
    }
  });
  canvas.pngStream().pipe(file)
});
