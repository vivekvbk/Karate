Feature: Read and Verify from CSV

  Background: POST request using  CSV
    Given url baseUrl+'/public/v2/users/'
    * def PostReq = call read('POST.feature')
    * def userId = PostReq.ID
    * def tokedID = "be5ed54f8fbf23f9df2d3149b00010353aa864ae42b3f0d68674e7b4868cb875"

  Scenario Outline: PATCH/PUT
    And path userId
    * print userId
    And request {"name":<name>,"email":<email>,"gender":<gender>,"status":<status>}
    And header Authorization = 'Bearer ' + tokedID
    When method put
    Then status 200
    * print response
    * def per_ID = $.id
    * print per_ID
    * def Status = $.status
    * print Status
    * print response
    * string response = response

* def javaMethod = Java.type('gorest_api.javaMethod')
* def SaveResponse = javaMethod.WriteData(response)

    Examples: 
      | name | email          | gender | status |
      | fdsffd | fdsfdsf@dsdsd.COM | female | active |
