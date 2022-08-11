Feature: Getting tools according to multiple categories

  Background: 
    * url 'https://simple-tool-rental-api.glitch.me'
    * def query = {category:'active'}

  Scenario Outline: Getting tools according to  categories
  
    * def query = {category:'<category>'}
    Given path '/tools'
    And header Accept = 'application/json'
    And params query
    When method get
    * def jsonResponse = response
    * print jsonResponse
    
    Then status 200

    Examples: 
      | category    |
      | power-tools |
      | plumbing		|
      
      
      
