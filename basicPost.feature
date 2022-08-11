Feature: Create user using post api

  Background: 
    * url 'https://gorest.co.in'
    * def requestPayload =
      """
      {
             "name": "Ramnath",
             "email": "Ramnath@gmail.com",
             "gender": "male",
             "status": "active"
         }
      """
    * def tokedID = 'be5ed54f8fbf23f9df2d3149b00010353aa864ae42b3f0d68674e7b4868cb875'

  Scenario: Create a user with the given data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokedID
    When method post
    Then status 201
    And print response
    And print responseTime
    And print responseHeaders
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'Ramnath'
    And match $.data.email == 'Ramnath@gmail.com'
