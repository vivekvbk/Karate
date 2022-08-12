Feature: Getting a pet


  Background:
    Given url "https://petstore.swagger.io"
    * def javaMethod = Java.type('feature4.javaMethod')

  @742120
  Scenario: Getting a pet
    And path '/v2/pet/1'
    And method get
    * print response
    * string response = response
    * def SaveResponse = javaMethod.WriteData(response)
