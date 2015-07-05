'use strict';

var should = require('should');
var app = require('../../app');
var request = require('supertest');
var openFDA = require('./openFDA');

describe('openFDA.getPath', function() {

  ///food/enforcement.json?search=reason_for_recall:"ice%20cream"&count=report_date
  var request2 = { search: {
      fields: [
        {
          field:"reason_for_recall",
          terms:[
            {term:"ice cream", isExact: true}
          ]
        }
      ],
      count: {field:"report_date"}
    }
  };

  //https://api.fda.gov/drug/event.json?search=brand_name:lyrica+AND+receivedate:[20140101+TO+20150101]&count=receivedate

  it('should respond with a properly formatted query string', function(done) {
    var expectedResult = '/food/enforcement.json?search=reason_for_recall:"ice+cream"&count=report_date';
    var result = openFDA.getPath(request2);
    result.should.be.instanceof(String);
    result.should.equal(expectedResult);
    done();
  });


});
