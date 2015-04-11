var topojson       = require('topojson');
var colorbrewer    = require('../lib/colors/colorbrewer');
var legendTemplate = require('../templates/legend.jade');
var stateface      = require('../lib/stateface');

var RACES          = ['white', 'asian', 'multiracial', 'native', 'hispanic', 'black', 'islander'];
var COLORSCHEME    = colorbrewer.Greys[6];

// Some semblance of a geography-based ordering of FIPS codes
var NATURAL_STATE_ORDERING = [2, 30, 38, 27, 55, 26, 39, 36, 50, 23, 53, 16, 46, 31, 19, 17, 42, 34, 25, 33, 41, 32, 56, 20, 29, 18, 54, 10, 44, 9, 6, 49, 8, 40, 5, 21, 51, 24, 11, 37, 15, 4, 35, 48, 22, 47, 28, 1, 13, 45, 12];

/**
 * @param {Object} options Hash should contain a selector that picks out an
 *     element that the map should be rendered into.
 */
var PrisonPops = function(options) {
  if (!options || !options.el) {
    throw new Error('Must pass a selector when initializing a PrisonPops.');
  }
  this.el = d3.select(options.el);

  if (!options.url) {
    throw new Error('Must pass a url when initializing a PrisonPops');
  }
  d3.json(options.url, _.bind(this.handleFetch, this));

  d3.select(window).on('resize', _.bind(this.handleResize, this));
  this.handleResize();

  this.colorscale = d3.scale.category20();
    // .domain(RACES)
    // .range(COLORSCHEME);


  this.active = d3.select(null);
};


/**
 * Updates the size and path to reflect the new size. If the data is loaded, re-
 * renders the data.
 */
PrisonPops.prototype.handleResize = function() {
  var boundingRect = this.el.node().getBoundingClientRect();
  this.width       = boundingRect.width;
  this.height      = boundingRect.height;
  this.radius      = Math.min(this.width / 20, this.height / 10);
  this.arc         = d3.svg.arc()
    .outerRadius(this.radius * 0.78)
    .innerRadius(0);

  this.tileWidth  = (this.width - 2*this.radius) / 10  ;
  this.tileHeight = this.height / 6;

  // If we've loaded the data, then re-render the data.
  if (this.data) {
    this.renderData();
  }
};


/**
 * Handles the response the data fetch.
 *
 * @param  {Object} err
 * @param  {Object} data
 */
PrisonPops.prototype.handleFetch = function(err, data) {
  // If something bad happened abort and hide the widget.
  if (err) {
    console.log(err);
    this.el.style.display = 'none';
    return;
  }

  this.data = data;
  this.renderData();
};


/**
 * Renders the data. TODO: seperate out the rendering of everything non-data
 * dependent.
 */
PrisonPops.prototype.renderData = function() {
  var self = this;

  // Kill the loading text, or whatever was previously in the element we were
  // passed.
  this.el.html("");

  // Add the containing svg.
  this.svg = this.el.append("svg")
    .attr("width", this.width)
    .attr("height", this.height)
    .attr("class", "prisonpops-us")
    .append("g");
      // .attr("transform", "translate(" + [this.width / 2, this.height / 2] + ")" );

  var data = this.formatData(this.data);

  this.pie = d3.layout.pie()
    .sort(null)
    .value(function(d) { return d.population; });

  // Store the computed layout to avoid recomputing on rotation.
  _.each(data, function(value) {
    value.pie = self.pie(value.data);
  });

  var multiples = this.svg.selectAll('.small-multiple')
    .data(data)
    .enter().append('g')
    .attr('width', this.tileWidth)
    .attr('height', this.tileHeight)
    .classed('small-multiple', true)
    .attr('transform', function(d, i) {
      return 'translate(' + self.getGroupTranslation(d, i) + ')';
    });

  var rotators = multiples
    .append('g')
    .classed('rotational-frame', true);

  rotators.selectAll('.arc')
    .data(function(d) { return d.pie; })
    .enter().append('g')
    .classed('arc', true)
    .append('path')
      .attr('d', this.arc)
      .attr('class', function(d) { return 'wedge ' + d.data.type; })
      .style("fill", function(d) { return self.colorscale(d.data.type); })
      .attr('stroke', '#fff')
      .on('mouseover', function(d, i) {
        d3.selectAll('.' + d.data.type)
          .transition()
          .duration(300)
          .attr('transform', 'scale(1.2)');
      })
      .on('mouseout', function(d, i) {
        d3.selectAll('.' + d.data.type)
          .transition()
          .duration(300)
          .attr('transform', '');
      })
      .on('click', function(d, i, j) {
        var selectedType = d.data.type;
        d3.selectAll('.rotational-frame')
          .transition()
          .duration(500)
          .attr('transform', function(d, i) {
            var selectedArc = _.find(d.pie, function(arc) {
              return arc.data.type == selectedType;
            });

            var currentRotation   = d.currentRotation || 0; // Radians
            var currentStartAngle = currentRotation + selectedArc.startAngle;
            d.currentRotation     = currentRotation - currentStartAngle;
            var rotationDegrees   = 360 * d.currentRotation / (Math.PI * 2);

            return 'rotate(' + rotationDegrees + ')';
          })
      });

  multiples.append('text')
      // .attr('transform', 'translate(' + [this.tileWidth / 2, this.tileHeight] + ')')
      .attr("dy", ".35em")
      .classed("state-icon", true)
      .text(function(d) { return stateface(d.name); });

  multiples.append('text')
    .classed('multiple-label', true)
    .text(function(d) { return d.name; })
    .attr('transform', 'translate(' + [0, this.tileHeight / 2] + ')');

  this.renderLegend();
};

PrisonPops.prototype.getGroupTranslation = function(data, index) {
  var index = NATURAL_STATE_ORDERING.indexOf(data.geoid);
  if (index == -1) {
    console.log(data, 'not found in ordering!');
  }

  var row    = Math.floor(index / 10);
  var column = Math.floor(index % 10);
  if (index === 50) {
    row = 4;
    column = 10;
  }
  var hpadding = this.radius;
  var vpadding = 60 + this.radius;

  return [hpadding + column * this.tileWidth, vpadding + row * this.tileHeight];
};


/**
 * Constructs the legend and appends it.
 */
PrisonPops.prototype.renderLegend = function() {
  var segments = _.map(RACES, function(type) {
    return {
      color: this.colorscale(type),
      label: type
    }
  }, this);

  this.el.append("div").html(legendTemplate({ segments: segments }));
};


PrisonPops.prototype.handleLegendClick = function(target, d) {

};

PrisonPops.prototype.formatData = function(data) {
  return _.map(data, function(state) {
    return {
      geoid: state.geoid,
      name: state.name,
      data: _.map(RACES, function(race) {
        return {
          type: race,
          population: state[race + '-all-prisons']
        };
      }),
    };
  });
};

module.exports = PrisonPops;



