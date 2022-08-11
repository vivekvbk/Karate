Feature: Create user using post api

  Background: 
    * url 'https://simple-tool-rental-api.glitch.me'
    * def orderToken = 'f19b7b3550a1103db9a7171ba49a0f6caae845b0e4861a48113450e30f6189c9'
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
  # Getting tools list and validating using Json Response
  Scenario: Getting all products list
    Given path 'tools'
    And request listofTools
    And header Accept = 'application/json'
    And header Connection = 'keep-alive'
    When method get
    Then status 200
    * def jsonResponse = response
    * print jsonResponse
    * match jsonResponse == listofTools

@order
  # Post Request
  # from toollist placing order for tool using toolId
  Scenario: Creating orders for tool
    Given path '/orders'
    And request OrderPayload
    And header Authorization = orderToken
    When method post
    Then status 201
    * def jsonResponse = response
    * print jsonResponse
    * print jsonResponse.orderId
    * def orderId = jsonResponse.orderId
    * print orderId
