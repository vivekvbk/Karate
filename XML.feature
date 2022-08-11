Feature: To validate the GET End point
  To validate the get end point response

  Background: Setup the base url
    Given url 'https://jobportalkarate.herokuapp.com'
    
    
    
  Scenario: To get the data in XML format and validate using fuzzy matcher
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And match response/List/item/jobId/[*]== "1,2,3,2,3"
    And match response/List/item/jobTitle == '#string'
    And match response/List/item/experience/experience[1] == '#string'
    And match response/List/item/project/project/projectName == '#present'
    And match response/List/item/project/project/technology/technology[2] == '#ignore'

  Scenario: To get the data in XML format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And match response/List/item/jobId == '1'
    And match response/List/item/jobTitle == '#string'
    And match response/List/item/experience/experience[1] == 'Google'
    And match response/List/item/project/project/projectName == 'Movie App'
    And match response/List/item/project/project/technology/technology[2] == 'SQL Lite'
    # Travers the xml similar to JSON
    And match response.List.item.experience.experience[0] == 'Google'
