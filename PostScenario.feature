Feature: Create user using post api

  Background: 
  
  
  	* def deleteData = read("this:delete.json")

  	
  	
    * def requestPayload =
      """
      {
         
         "gender": "female",
         "status": "inactive"
       }
      """
      
      
          * def putData = read("this:put.json")

    * def random_Int =
      """
          function(s){
              var text = "";
              var pattern = "1234567890";
              for(var i=0; i<s; i++)
                  text += pattern.charAt(Math.floor(Math.random() * (10 - 1)) + 1);
                  return text;
          }
      """
    * def random_string =
      """
          function(s)
          {
              var text = "";
              var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
              for(var i=0; i<s; i++)
                  text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
                  return text;
          }
      """
    * def randomINT = random_Int(4)
    * set requestPayload.id = randomINT
    * set putData.id = randomINT
    * set deleteData.id = randomINT
    
    * def randomString = random_string(10)
    * print randomString
    * set requestPayload.name = randomString
   
    
    * set requestPayload.email = randomString + "@gmail.com"
   
    * def tokedID = "be5ed54f8fbf23f9df2d3149b00010353aa864ae42b3f0d68674e7b4868cb875"

  Scenario: Crud Operations
   
    #Post request    
    #https://gorest.co.in/public/v2/users/3998
    Given url baseUrl
    And path 'public/v2/users'
    And request requestPayload
    * print requestPayload
    And header Authorization = 'Bearer ' + tokedID
    When method post
    Then status 201
    * print response
    * def ID = $.id
    * print ID
    * def Status = $.status
    * print Status
    * def Email = $.email
    * print Email
    * match Email contains '#regex ^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$'
    And match $.id == '#number? _ > 0'
    And match $.name == '#string'
    And match $.email == '#string'
   
   
    # Put
    Given url baseUrl
    And path '/public/v2/users/'+ID
    And request putData
    * print putData
    And header Authorization = 'Bearer ' + tokedID
    When method put
    Then status 200
    * print response
      * def ID = $.id
    * print ID
    * def Status = $.status
    * print Status
    * def Email = $.email
    * print Email
    * match Email contains '#regex ^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$'
    And match $.id == '#number? _ > 0'
    And match $.name == '#string'
    And match $.email == '#string'
    
    # Delete   
    Given url baseUrl
    And path '/public/v2/users/'+ID
    And header accept = 'application/json'
    And request requestPayload  ##post requests payload
    And method delete
    * print response   
    And status 204
    
    # Get request
    Given url baseUrl
    And path '/public/v2/users/'+ID
    And header accept = 'application/json'
    And method get
    And status 200
    * print response
    
    # Negative Get
    And path '/public/v2/users/xyz'
    And header accept = 'application/json'
    And method get
    And status 204
    * print response
    
    
    
    
    
