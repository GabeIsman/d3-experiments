var topojson = require('topojson');
var colorbrewer = require('../lib/colors/colorbrewer');
var legendTemplate = require('../templates/legend.jade');


// The thresholds that define the segments to break colors on.
var THRESHOLDS = [0, 0.001, 0.002, 0.003, 0.004, 0.005, 0.006, 0.007, 0.008, 0.009];
// This colorscheme is just an array of colors. Can be substituted for any
// similar array (there are many options in the colorbrewer file, an open
// source set of colorschemes). The cardinality of the colorscheme should one
// less than that of the thresholds.
var COLORSCHEME = colorbrewer.Greys[THRESHOLDS.length - 1];


var PRISON_TYPES = ['Federal', 'State', 'Local', 'Halfway House', 'Military', 'Private', 'Other'];
var PRISON_COLORSCHEME = colorbrewer.Set2[PRISON_TYPES.length];


/**
 * A chloropleth style map that displays numbers of incarcerated people in each
 * state.
 *
 * @param {Object} options Hash should contain a selector that picks out an
 *     element that the map should be rendered into.
 */
var TotalsMap = function(options) {
  if (!options || !options.el) {
    throw new Error('Must pass a selector when initializing a TotalsMap.');
  }
  this.el = d3.select(options.el);

  if (!options.url) {
    throw new Error('Must pass a url when initializing an TotalsMap');
  }
  d3.json(options.url, _.bind(this.handleFetch, this));

  d3.select(window).on('resize', _.bind(this.handleResize, this));
  this.handleResize();

  this.colorScale = d3.scale.quantile()
    .domain(THRESHOLDS)
    .range(d3.range(COLORSCHEME.length).map(_.bind(function(i) {
      return COLORSCHEME[i];
    }, this)));

  this.prisonColorScale = d3.scale.ordinal()
    .domain(PRISON_TYPES)
    .range(PRISON_COLORSCHEME);

  this.prisonScale = d3.scale.linear()
    .domain([0, 10000])
    .range([0.5, 15]);

  this.active = d3.select(null);
};


/**
 * Updates the size and path to reflect the new size. If the data is loaded, re-
 * renders the map.
 */
TotalsMap.prototype.handleResize = function() {
  var boundingRect = this.el.node().getBoundingClientRect();
  this.width = boundingRect.width;
  this.height = boundingRect.height;

  // Use the albersUsa projection because it deals with the alaska monstrosity.
  this.projection = d3.geo.albersUsa()
    // Magic constants are magic. I arrived at these by fiddling. Seems to
    // maintain good scale across a broad range of dimensions.
    .scale(Math.min(this.height, this.width) * 1.4)
    .translate([this.width / 2, this.height / 2]);

  this.path = d3.geo.path()
    .projection(this.projection);

  // If we've loaded the data, then re-render the map.
  if (this.data) {
    // this.renderMap();
  }
};


/**
 * Handles the response the data fetch.
 *
 * @param  {Object} err
 * @param  {Object} data
 */
TotalsMap.prototype.handleFetch = function(err, data) {
  // If something bad happened abort and hide the widget.
  if (err) {
    console.log(err);
    this.el.style.display = 'none';
    return;
  }

  this.data = data;
  this.renderMap();
};


/**
 * Renders the map.
 */
TotalsMap.prototype.renderMap = function() {
  var self = this;

  // Kill the loading text, or whatever was previously in the element we were
  // passed.
  this.el.html("");

  var geodata = this.data['us.topo'];

  // Extract the states
  this.states =
    topojson.feature(geodata, geodata.objects.states);

  // Add the containing svg.
  this.svg = this.el.append("svg")
    .attr("width", this.width)
    .attr("height", this.height)
    .attr("class", "totalsmap-us");

  this.group = this.svg.append("g");

  // Draw the outlines of all the states, fill them according to the
  // colorScale.
  this.group.selectAll("path")
    .data(this.states.features)
    .enter().append("path")
      .attr("class", "totalsmap-state")
      .attr("d", this.path)
      .attr("fill", function(d) { return self.colorScale(self.getImprisonmentRate(d.id)); })
      .on("click", getHandler(this.handleStateClicked, this));

  // this.group.selectAll(".state-label")
  //   .data(this.states.features)
  //   .enter().append("svg:text")
  //     .attr("class", "state-label")
  //     .text(function(d) { return Math.round(self.getImprisonmentRate(d.id) * 100000); })
  //     .attr("x", function(d) { return self.path.centroid(d)[0]; })
  //     .attr("y", function(d) { return self.path.centroid(d)[1]; })
  //     .attr("text-anchor", "middle")
  //     .attr("font-size", "10px");

  this.group.selectAll(".prison")
    .data(this.data.prisons)
    .enter().append("circle")
    .attr("cx", function(d) { return self.projection([d.longitude, d.latitude])[0]; })
    .attr("cy", function(d) { return self.projection([d.longitude, d.latitude])[1]; })
    .attr("r", "1px")
    .attr("r", function(d) { return self.prisonScale(d.population) + 'px'; })
    .attr("fill", function(d) { return self.prisonColorScale(self.getPrisonType(d.type)); })
    .attr("stroke", function(d) { return self.prisonColorScale(self.getPrisonType(d.type)); })
    .attr("opacity", 0.7)
    .attr("class", function(d) { return slugify(self.getPrisonType(d.type)); })
    .on("hover", function(d) {

    });

  this.renderLegend();
};


TotalsMap.prototype.handleStateClicked = function(target, d) {
  if (this.active.node() === target) {
    return this.resetZoom();
  }
  this.active.classed('active', false);
  this.active = d3.select(target).classed('active', true);

  // Lifted from http://bl.ocks.org/mbostock/4699541
  var bounds = this.path.bounds(d);
  // Find the size of the area we are zooming too.
  var boundsWidth = bounds[1][0] - bounds[0][0];
  var boundsHeight = bounds[1][1] - bounds[0][1];
  // Find the center.
  var x = (bounds[0][0] + bounds[1][0]) / 2;
  var y = (bounds[0][1] + bounds[1][1]) / 2;
  // Find a scale that will fit the entire thing inside the containing element.
  var scale = 0.9 / Math.max(boundsWidth / this.width, boundsHeight / this.height);
  // Translate to the center (remember that the map starts translated to
  // [this.width / 2, this.height / 2]).
  var translate = [this.width / 2 - scale * x, this.height / 2 - scale * y];

  this.group.transition()
    .duration(750)
    // Scale stuff here
    .attr("transform", "translate(" + translate + ") scale(" + scale + ")");
};


TotalsMap.prototype.resetZoom = function() {
  this.active.classed('active', false);
  this.active = d3.select(null);
  this.group.transition()
    .duration(750)
    .attr('transform', '');
};


TotalsMap.prototype.getImprisonmentRate = function(fips) {
  var timeSeries = this.data.totals[fips];
  var state = _.first(this.data.populations[fips]);
  var recent = _.find(timeSeries, function(d) { return d.year === 2012; });
  if (!recent) {
    console.log('warning 2012 not found for', fips);
    return 0;
  }
  if (!state || !state.pop) {
    console.log('warning pop data not found for ', state.name);
    return 0;
  }
  return (recent.male + recent.female) / state.pop;
};


/**
 * Constructs the legend and appends it to the map.
 */
TotalsMap.prototype.renderLegend = function() {
  var segments = _.map(PRISON_TYPES, function(type) {
    return {
      color: this.prisonColorScale(type),
      label: type
    }
  }, this);

  this.el.append("div").html(legendTemplate({ segments: segments }));

  this.el.selectAll('.legend-control')
    .on('click', getHandler(this.handleLegendClick, this));
};


TotalsMap.prototype.handleLegendClick = function(target, d) {
  var target = d3.select(target);
  var type = slugify(target.attr('type'));
  var prisons = d3.selectAll('.' + type);
  if (target.classed('active')) {
    target.classed('active', false);
    prisons.style('visibility', 'hidden');
  } else {
    target.classed('active', true);
    prisons.style('visibility', 'visible');
  }
};


/**
 * Converts a color into the range of numbers that it represents.
 *
 * @param  {Object} scale The D3 scale on which to convert
 * @param  {Object} value An object in the range of the scale
 * @return {String}
 */
function getLabel(scale, value) {
  debugger
  var domain = scale.invertExtent(value);
  return Math.ceil(domain[0] + 1) + " - " + Math.floor(domain[1]);
}


/**
 * Takes a function and a context and returns a function set up to serve as a
 * handler to a d3 event. The original handler will be called with the datum and
 * the node, while its context will be the context specified here.
 *
 * @param  {Function} handler The event handler (typically an object method)
 * @param  {Object} ctx The object the method belongs to
 */
function getHandler(handler, ctx) {
  handler = _.bind(handler, ctx);
  return function(d) {
    // 'this' here will be the d3 event target.
    return handler(this, d);
  }
};


TotalsMap.prototype.getPrisonType = function(type) {
  if (_.indexOf(PRISON_TYPES, type) !== -1) {
    return type;
  }

  if (type.indexOf('Federal') !== -1) {
    return 'Federal';
  }

  if (type.indexOf('Private') !== -1) {
    return 'Private';
  }

  if (type.indexOf('State') !== -1) {
    return 'State';
  }

  if (type == 'Unlisted') {
    return 'Other';
  }

  console.log("Warning not able to determine type", type);
  return 'Other';
};


function slugify(str) {
  return str.replace(' ', '-');
}

module.exports = TotalsMap;



