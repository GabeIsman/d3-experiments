_ = require('underscore');
d3 = require('d3');

// var TotalsMap = require('./views/totalsmap');
// var map = new TotalsMap({
//   el: '#map',
//   url: '/data/totalsmap.json'
// });

var PrisonPops = require('./views/prisonpops');
new PrisonPops({
  el: '#small-multiples',
  url: '/data/gq-races.json'
})
