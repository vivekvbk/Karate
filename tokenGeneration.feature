  @TokenGeneration
  Feature: Generating token for orders
  
  
  Background: 
    * url 'https://simple-tool-rental-api.glitch.me'
    
    * def token = 
    """{
    }
    """
    * def requestPayload =
      """
      {
      "clientName": "Vivek"     
      }
      """ 
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
    
    
    
        
  # Post Request
  # Creating token for ordergeneration
  Scenario: Create a Token with the given data
    Given path '/api-clients'
    And request requestPayload
    * print requestPayload
    When method post
    Then status 201
    * def jsonResponse = response
    * print jsonResponse
    * def Actualtoken = jsonResponse.accessToken
    * set Actualtoken.tokenID = Actualtoken
    * print token
    * print jsonResponse.Actualtoken
    
    
    
    
   
    