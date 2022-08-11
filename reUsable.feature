Feature: all reusable methods is here

 
  Scenario: Reusable methods
    
    * def requestPayload =
      """
      {
         "gender": "female",
         "status": "inactive"
       }
      """
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
    * print randomINT
    * set requestPayload.name = randomString
    * set requestPayload.email = randomString + "@gmail.com"
    
