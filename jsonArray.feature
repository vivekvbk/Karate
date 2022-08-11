Feature: JSON Schema Validation

Scenario: Get a Single User and Verify its JSON Fields
Given url baseUrl+'/public/v2/users'
When method get
* print response
Then match response.[4].id == #number
Then match response.[4].name == "#string"
Then match response.[4].email == "#string"
Then match response.[4].gender == "female"
Then match response.[4].status == "inactive"

