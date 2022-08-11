Feature: Create user using post api

  Background: 
   * def randomGenerator = call read ('this:reUsable.feature')
   * def tokedID = "be5ed54f8fbf23f9df2d3149b00010353aa864ae42b3f0d68674e7b4868cb875"
     

  Scenario: Create a user with the given 
    Given url baseUrl
    And path '/public/v1/users'   
    And request     * print Payload
    And header Authorization = 'Bearer ' + tokedID
    When method post
    Then status 201
    * print response
    And match $.data.id == '#number'
    And match $.data.name == '#string'
