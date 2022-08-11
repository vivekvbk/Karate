Feature: Read and Verify from CSV

Background: POST request using  CSV   
    * def postData = karate.read("file:src/test/java/gorest_api/data.csv")
    * def tokedID = "be5ed54f8fbf23f9df2d3149b00010353aa864ae42b3f0d68674e7b4868cb875"
   
    
Scenario Outline: Data Driven entry using csv files
    Given url baseUrl
    And path '/public/v1/users'
    And header Content-Type = 'application/json; charset=utf-8'
    And header Authorization = 'Bearer ' + tokedID
    And request  {"id" :<id>,"name":<name>,"email":<email>,"gender":<gender>,"status":<status>}
    * print postData
    When method post
    * print response
    Then status 201
    


    Examples: 
      | postData |
      
      
      
      
      
      
      

    