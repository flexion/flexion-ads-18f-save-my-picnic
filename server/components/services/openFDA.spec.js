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

  it('should respond with a properly formatted query string', function(done) {
    var expectedResult = '/food/enforcement.json?api_key=1tng2lKHWL3Upt0LfvdyEsl82L5ROFYBgbfUAJHL&search=reason_for_recall:"ice+cream"&count=report_date';
    var result = openFDA.getPath(request2);
    result.should.be.instanceof(String);
    result.should.equal(expectedResult);
    done();
  });

  it('should be able to add a limit', function(done){
    var request = { search: {
      fields: [
        {
          field: "reason_for_recall",
          terms: [
            {term: "cheese", isExact: true}
          ]
        }
      ],
      limit: {value: -1}
    }
    };
    var expectedResult = '/food/enforcement.json?api_key=1tng2lKHWL3Upt0LfvdyEsl82L5ROFYBgbfUAJHL&search=reason_for_recall:"cheese"&limit=-1';
    var result = openFDA.getPath(request);
    result.should.be.instanceof(String);
    result.should.equal(expectedResult);
    done();
  });


});
