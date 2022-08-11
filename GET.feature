@GET
Feature: GET API feature

Background:
* def alluserslist = read('this:allusers.json')

Scenario: get user details
Given url baseUrl+'/public/v2/users'
And path '30'
When method GET

# Validate 200 OK for GET response status code
Then status 200
* print responseStatus


# Validate Content in the response Header (should be application/json) 
And headers {Accept:'application/json', Content-Type:'application/json'}


# ID should be in INT 
* def jsonResponse = response
* print jsonResponse
* def Id = jsonResponse.id
* print Id
* match Id == '#number'

# Name should be in String (should not contain number or special char) 
* def Name = jsonResponse.name
* print Name
* match Name == '#string'

# Validate if the Email ID is in correct format. 
* def Email = jsonResponse.email
* print Email
* match Email ==  '#string'
* match Email contains '#regex ^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$' 

# Validate if the entire json is in correct format. 


Scenario: validation of all response
 
  Given url baseUrl+'/public/v2/users'
  And method Get
* print response
* def jsonResponse = response
* match jsonResponse == alluserslist
# match whole response
* match each jsonResponse contains { id: '#number', name: '#string',email:'#string', gender:'#string',status: '#string'}



Scenario: All Validations  
  Given url baseUrl+'/public/v2/users'
  And method Get
* print response
  And header Accept = 'application/json'
  And match each response.[*].id == '#number? _ > 0'
  And match each response.[*].name == '#string'
  And match each response.[*].email contains '#regex ^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$' 

  












