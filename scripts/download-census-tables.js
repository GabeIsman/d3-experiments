var http = require('http');
var fs = require('fs');
var zlib = require('zlib');
var async = require('async');
var path = require('path');
var _ = require('underscore');


// This is beginning to look a lot like callback hell.
var downloadStateTables = function(table, targetDirectory, callback) {
  var normalizedPath = path.resolve(targetDirectory);
  if (!fs.statSync(normalizedPath).isDirectory()) {
    throw new Error('Directory ' + targetDirectory + ' is not a directory. Resolved to ' + normalizedPath);
  }

  return async.each(_.values(STATE_FIPS), function(fips, done) {
    var url = buildBulkDataUrl(fips, SUMLEVS.state, table, 'csv');
    console.log('Fetching ' + url + ' ...');
    http.get(url, function(response) {
      console.log('Got response ' + response.statusCode + ' - ' + response.statusMessage + ' from ' + url);

      var gunzip = zlib.createGunzip();
      response.pipe(gunzip);
      var body = [];
      gunzip.on('data', function(chunk) {
        body.push(chunk.toString());
      })
      .on('end', function() {
        var filePath = path.normalize(normalizedPath + '/' + fips + table + '.csv');
        fs.writeFile(filePath, body.join(""), function(error) {
          if (error) {
            throw error;
          }

          console.log(url + ' saved to ' + filePath);
          done();
        });

      })
      .on('error', function() {
        done(error);
      });
    }).on('error', function(error) {
      console.log('Got error ' + error.message + ' from ' + url);
      done(error);
    });
  }, function(error) {
    if (error) {
      throw error;
    } else {
      callback(); // All done.
    }
  });
};


var STATE_FIPS = {
  "Alabama": "01",
  "Alaska": "02",
  "Arizona": "04",
  "Arkansas": "05",
  "California": "06",
  "Colorado": "08",
  "Connecticut": "09",
  "Delaware": "10",
  "District of Columbia": "11",
  "Florida": "12",
  "Georgia": "13",
  "Hawaii": "15",
  "Idaho": "16",
  "Illinois": "17",
  "Indiana": "18",
  "Iowa": "19",
  "Kansas": "20",
  "Kentucky": "21",
  "Louisiana": "22",
  "Maine": "23",
  "Maryland": "24",
  "Massachusetts": "25",
  "Michigan": "26",
  "Minnesota": "27",
  "Mississippi": "28",
  "Missouri": "29",
  "Montana": "30",
  "Nebraska": "31",
  "Nevada": "32",
  "New Hampshire": "33",
  "New Jersey": "34",
  "New Mexico": "35",
  "New York": "36",
  "North Carolina": "37",
  "North Dakota": "38",
  "Ohio": "39",
  "Oklahoma": "40",
  "Oregon": "41",
  "Pennsylvania": "42",
  "Rhode Island": "44",
  "South Carolina": "45",
  "South Dakota": "46",
  "Tennessee": "47",
  "Texas": "48",
  "Utah": "49",
  "Vermont": "50",
  "Virginia": "51",
  "Washington": "53",
  "West Virginia": "54",
  "Wisconsin": "55",
  "Wyoming": "56"
};


var API_URL = "http://censusdata.ire.org";


var SUMLEVS = {
  state: '040',
  county: '050',
  countySubdivision: '060',
  censusTract: '140',
  place: '160'
};


var buildBulkDataUrl = function(state, sumlev, table, format) {
  if (!format) {
    format = 'csv';
  }

  if (table) {
    table = "." + table;
  } else {
    table = "";
  }

  return API_URL + "/" + state + "/all_" + sumlev + "_in_" + state + table + "." + format;
};

module.exports = downloadStateTables;
