Feature: Test Cases

  Background: 
    Given url 'https://reqres.in'
    * def responseSchema = read ('this:schemaValidation.json')

  Scenario: Get Scenario Validations
    And path '/api/unknown'
    And method get
    # response status should be 200
    And status 200
    * print response
    # response should contain  url ""https://reqres.in/#support-heading"
    And match response.support contains deep {"url":"https://reqres.in/#support-heading"}
    # response should contain "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    And match response.support contains deep {"text":"To keep ReqRes free, contributions towards server costs are appreciated!"}
    # response should have length
    And match response.per_page ==  6
    And match response.total_pages == 2
    And match response == responseSchema
    # In response year should be 2000 or greater
    And match each response.data.[*].year == '#number? _ >= 2000'
    # print response into text file
    * string response = response
    * def javaMethod = Java.type('gorest_api.javaMethod')
    * def SaveResponse = javaMethod.WriteData(response)
    And path '/api/unknown'
    And method get
    # response status should be 200
    And status 200
    * print response
    * print responseStatus

  # Negative Scenarios
  Scenario: With wrong end point
    And path '/api/unknown/xyz'
    And method get
    * print responseStatus
    And status 404

  Scenario: With method is not mentioned
    And path '/api/unknown'
    And method
    * print response
    * print responseStatus

  Scenario: With wrong header type is not mentioned
    And path '/api/unknown'
    And header accept = 'application/ddjhdkd'
    And method get
    * print response
    * print responseStatus
    
    
    Scenario: without path
      And method
    * print response
    * print responseStatus
    
    
    
   	Scenario: With wrong header type is not mentioned
    And path '/api/unknown'
    And header accept = 'application/ddjhdkd'
    And method get
    * print response
    * print responseStatus
