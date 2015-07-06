'use strict'

describe 'Controller: MainCtrl', ->

  payload =
    "meta":
        "disclaimer":"unvalidated.",
        "license":"http://open.fda.gov/license",
        "last_updated":"2015-05-31",
        "results":
          "skip":0,
          "limit":-1,
          "total":1
    "results":[
      {
        "recall_number": "F-0121-2013"
        "reason_for_recall": "reason",
        "status": "Terminated",
        "distribution_pattern": "Arizona",
        "product_quantity": "1791 cases",
        "recall_initiation_date": "20120205",
        "state": "AZ", "event_id": "63250",
        "product_type": "Food",
        "product_description": "Diet Crush Orange Soda, 12 oz cans",
        "country": "US", "city": "Phoenix", "recalling_firm": "Bottling LLC  dba Pepsi Beverages Company",
        "report_date": "20121024", "@epoch": 1424553174.836488, "voluntary_mandated": "Voluntary: Firm Initiated",
        "classification": "Class II", "code_info": "APR1612ttttPW011012\n(tttt represents military time)",
        "@id": "614c7e055a13312701427882e127bace0e252bd419ff6d191a68c5f83b4b1ea7",
        "openfda": {},
        "initial_firm_notification": "Visit"
      }
    ]

  # load the controller's module
  beforeEach module 'picnicApp'

  MainCtrl = undefined
  scope = undefined
  $httpBackend = undefined

  # Initialize the controller and a mock scope
  beforeEach inject (_$httpBackend_, $controller, $rootScope) ->
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET(/^\/api\/food-search\/\?search=.*/).respond payload
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl',
      $scope: scope

  describe 'search', ->
    it 'should attach a list of reports to the scope', ->
      console.log payload
      scope.search 'aspergillus'
      $httpBackend.flush()
      expect(scope.reports).toBeDefined()

    it 'should set a searchname', ->
      scope.search 'food'
      $httpBackend.flush()
      expect(scope.searchname).toBe 'food'

    it 'should set a lastUpdated', ->
      scope.search 'food'
      $httpBackend.flush()
      expect(scope.meta.last_updated).toBe '2015-05-31'
