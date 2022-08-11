Feature: Create user using post api

Background:
	* url 'https://gorest.co.in'
	* def requestPayload = 
	"""
	{
        "name": "tom",
        "email": "tom24@gmail.com",
        "gender": "male",
        "status": "active"
    }
	
	"""
	* def tokedID = "a1caf9d8aac20239b0bd67ba89d31f5b92909f23774ba5112725fa3d393fce7f"
Scenario: Create a user with the given data
Given path '/public/v1/users'	
And request requestPayload
And header Authorization = 'Bearer ' + tokedID
When method post
Then status 201
And match $.data.id == '#present'
And match $.data.name == '#present'
And match $.data.name == 'tom'
And match $.data.email == 'tom24@gmail.com'