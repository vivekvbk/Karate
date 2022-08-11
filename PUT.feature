Feature: CRUD OPERATIONS
Background: setting up base url
Given url 'https://gorest.co.in'
* def expectedRES = read('this:allUsers.json')
* print expectedRES
* def expectedreqpayload = read('this:put.json')
* print expectedreqpayload
#creating random mail
* def random_string =
"""
function(s){
  var text = "";
  var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
  for(var i=0; i<s ; i++)
     text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
     return text;
 }
 """
 * def randomString = random_string(10)
 * print randomString

#* def userhead = {User-Agent:'PostmanRuntime/7.29.0', Connection:'keep-alive'}
Scenario:  getting the response with given data
# retrieving the place using get method 
Given path '/public/v2/users'
#And header Connection:'Keep-Alive'
#And header User-Agent:'PostmanRuntime/7.29.0'
When method get
Then status 200
And print response 
# validating the header
And header Connection = 'Keep-Alive'
And header Content-Type = 'application/json; charset=utf-8'
And match $.[*].id == "#array"
#ID should be in INT 
And match $.[1].id == "#number"
* def ID = $.[*].id
* print ID
And match $.[*].name == "#array"
#Name should be in String
And match $.[1].name == "#string"
And match $.[*].email == "#present"
#Validate if the entire json is in correct format
And match response == expectedRES

Scenario:  creating and updating new user with given data

# creating new user
* def requestpayload = read('this:postpay.json')

 * set requestpayload.email = randomString + "@gmail.com"
 * print requestpayload
Given path '/public/v2/users'
And request requestpayload
And header Authorization = 'Bearer ' + '87c35acafd609669e979618c8c99eb7d91c4908b019b27bec8656842c996c8c5'
When method post
Then status 201
* print response 
And match response == expectedreqpayload
* def per_ID = $.id
* print per_ID
* def Status = $.status
* print Status


# updating the mail and status

* def putpayload = read('this:putpay.json')

* set putpayload.email = randomString + "@gmail.com"
* print putpayload 
Given path '/public/v2/users/'+per_ID 
And request putpayload
And header Authorization = 'Bearer ' + '87c35acafd609669e979618c8c99eb7d91c4908b019b27bec8656842c996c8c5'
When method put
Then status 200
* print response 
* def Status1 = $.status
* print Status1
And match response == expectedputpayload
And match Status1 != Status

# retrieve the data using get method
Given path '/public/v2/users/'+ per_ID 
And header Authorization = 'Bearer ' + '87c35acafd609669e979618c8c99eb7d91c4908b019b27bec8656842c996c8c5'
When method get
Then status 200
* print response
* def Status2 = $.status
* print Status2
And match Status2 == Status1