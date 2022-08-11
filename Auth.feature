Feature: Generating Token

  Background:
    Given url 'https://restful-booker.herokuapp.com'
    * def credentials = read('this:credentials.json')
    * def token = read('this:token.json')


    Scenario Outline:
      And path '/auth'
      And request credentials
      When method post
      Then status <responseCode>
      * print response
      * def generatedtoken = $.token
      * print generatedtoken
      * set token.token = generatedtoken
      * print responseStatus
      * print token




      Examples:
      |responseCode|
      |   200         |