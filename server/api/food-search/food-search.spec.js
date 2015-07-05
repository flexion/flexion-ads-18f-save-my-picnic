'use strict';

var should = require('should');
var app = require('../../app');
var request = require('supertest');

describe('GET /api/food-search', function() {

  it('should respond with JSON array', function(done) {
    request(app)
      .get('/api/food-search?search=eyJzZWFyY2giOnsiZmllbGRzIjpbeyJmaWVsZCI6InJlYXNvbl9mb3JfcmVjYWxsIiwidGVybXMiOlt7InRlcm0iOiJpY2UgY3JlYW0iLCJpc0V4YWN0IjoidHJ1ZSJ9XX1dLCJjb3VudCI6eyJmaWVsZCI6InJlcG9ydF9kYXRlIn19fQ==')
      .expect(200)
      .expect('Content-Type', /json/)
      .end(function(err, res) {
        if (err) return done(err);
        res.body.results.should.be.instanceof(Array);
        done();
      });
  });
});
