@GET
Feature: GET API feature

  Background: 
   * def PostReq = call read('PutReq.feature')

  Scenario: get user details
  
    Given url baseUrl+'/public/v2/users'
    And path 'userID'
    When method GET
    # Validate 200 OK for GET response status code
    Then status 200
    * print response
