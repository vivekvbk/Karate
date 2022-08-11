Feature: Create user using post api

  Background: 
    * url 'https://simple-tool-rental-api.glitch.me'
    * def orderToken = 'f19b7b3550a1103db9a7171ba49a0f6caae845b0e4861a48113450e30f6189c9'
       * def updatedName =
      """
      {
      "customerName": "IIIIII"
      					}
      """
    * def requestPayload =
      """
      {
      "clientName": "Vivek"     
      }
      """
    * def OrderPayload =
      """
      {
      "toolId": 4643,
      "customerName": "Random k"
      }    
      """
    * def listofTools = read('this:allTools.json')
    * def random_string =
      """
          function(s){
              var text = "";
              var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
              for(var i=0; i<s; i++)
                  text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
                  return text;
          }
      """
    * def randomString = random_string(10)
    * print randomString
    * set requestPayload.clientEmail = randomString + "@gmail.com"

  # Get Request
  
  Scenario: Getting all products list
  # Get all tools list 
    Given path 'tools'
    And request listofTools
    And header Accept = 'application/json'
    And header Connection = 'keep-alive'
    When method get
    Then status 200
    * def jsonResponse = response
    * print jsonResponse
    * match jsonResponse == listofTools
    
    
    # Post Request
    # from toolslist placing order for tool using toolId
   
    Given path '/orders'
    And request OrderPayload
    And header Authorization = orderToken
    When method post
    Then status 201
    * print OrderPayload
    * def jsonResponse = response
    * print jsonResponse
    * print jsonResponse.orderId
    * def orderId = jsonResponse.orderId
    * print orderId
 
    #Update request


    Given path `/orders/${orderId}`
    And header Authorization = orderToken
    And request updatedName
    * print updatedName
    When method patch
    And status 204
    
    ## Get request


    Given path `/orders/${orderId}`
    And header Authorization = orderToken
    When method get
    And status 200
    * print response
    
    
    ## Delete request
    
    Given path `/orders/${orderId}`
    And header Authorization = orderToken
    When method delete
    And status 404
    * print response
