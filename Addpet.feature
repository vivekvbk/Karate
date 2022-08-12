Feature: Adding pet

  Background:
    Given url "https://petstore.swagger.io"
    #* def excelfile = read('file:src/payloads/order.csv')
    * def addpetjson = read('this:Addpet.json')
    * def javaMethod = Java.type('feature4.javaMethod')

 @742118
  Scenario: Reading order through excel file
    And path 'v2/pet'
    And request  addpetjson
    And method post
    * print response
    * print responseStatus
    * def orderId = $.id
    * print orderId
    * string response = response
    * def SaveResponse = javaMethod.WriteData(response)


  @742119
  Scenario: Reading order through excel file
    And path 'v2/pet'
    And request  addpetjson
    And method post
    * print response
    * print responseStatus
    * def orderId = $.id
    * print orderId
    * string response = response
    * def SaveResponse = javaMethod.WriteData(response)
