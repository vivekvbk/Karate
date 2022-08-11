Feature: Create user using post api

  Background: 
  
  
    * def requestPayload =
      """
      {
         "gender": "female",
         "status": "inactive"
       }
      """

    * def updatePayload = read('this:put.json')
    
    # Assign a random value to ID
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
    # Assign a random value to Email and name
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
    * def randomString = random_string(10)
    * print randomString
    * set requestPayload.name = randomString
    * set requestPayload.email = randomString + "@gmail.com"
    * def tokedID = "be5ed54f8fbf23f9df2d3149b00010353aa864ae42b3f0d68674e7b4868cb875"
    
   @XYZ
   #Post request
  Scenario: Create a user with the given data
    Given url baseUrl
    And path '/public/v1/users'
    And request requestPayload
   * print requestPayload
    And header Authorization = 'Bearer ' + tokedID
    When method post
    Then status 201
    * print response
    * def ID = $.data.id
    * print ID
    * def Status = $.data.status
    * print Status
    * def Email = $.data.email
    * print Email
    * match Email contains '#regex ^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$' 
    And match $.data.id == '#number? _ > 0'    
    And match $.data.name == '#string'
    And match $.data.email == '#string'

    
