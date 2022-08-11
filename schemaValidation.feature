Feature: JSON Schema Validation

Scenario: Get a Single User and Verify its JSON Fields
Given url baseUrl+'/public/v2/users/4237'
When method GET
* def jsonSchemaExpected = 
"""  
   {
    "id": "#number",
    "name": "#string",
    "email":  "#string",
    "gender":"#string",
    "status": "#string"
    }
"""

* match response == jsonSchemaExpected   


Scenario: Karate JSON Schema Verify
* def responseData = 
"""
    {
        "id" : "#number",
        "name" : "#string"
    }
"""
* def jsonData = 
"""
    {
        "id" : 1,
        "name" : "Vivek"
    }
"""
* match jsonData == responseData    
