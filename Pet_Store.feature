Feature: Creating post order

  Background: 
    Given url 'https://petstore.swagger.io'
    #  to read files from same folder
    * def excelData =  read('this:order.csv')
    * def Updatejson =  read('this:update.json')

  # Post order using Scenario Outline
  Scenario Outline: Creating post order
    And path '/v2/store/order'
    And headers {Accept : '<headerType>', Content-Type: '<headerType>'}
    And request  {"id": <id>,"petId": <petId>,"quantity": <quantity>,"shipDate": "2022-07-14T03:28:57.461Z","status": <status>,"complete": true}
    And method post
    #* match response.status contains == [ "available" ]
    * status <statusCode>
    * print responseStatus
    * def orderId = $.id
    * match orderId == <ResponseId>

    Examples: 
      | id | petId | quantity            | status | statusCode | ResponseId | headerType       |
      |  1 |     2 |                   2 | placed |        200 |          1 | application/json |
      |  2 |     2 | 9999999999999999999 | placed |        500 |          2 | application/json |
      |  3 |     3 |                  -6 | placed |        400 |          3 | application/xml  |
      | -5 |     4 |                   0 | placed |        405 |         -5 | application/json |
      | x  |     5 |                   2 | placed |        500 | x          | application/json |
      |  0 |     6 |                   2 | placed |        200 |          0 | application/json |
      | $  |     2 |                   2 | placed |        500 |          $ | application/json |

  # Post order using CSV and validation using examples
  Scenario Outline: Reading order through excel file
    And path '/v2/store/order'
    And headers {Accept : '<headerType>', Content-Type: '<headerType>'}
    And request  {"id": <id>,"petId": <petId>,"quantity": <quantity>,"shipDate": "2022-07-14T03:28:57.461Z","status": <status>,"complete": <complete>}
    And method post
    * print responseStatus
    * def orderId = $.id
    * print orderId

    Examples: 
      | excelData |
      
   # delete order
  Scenario: delete order
    And path '/v2/store/order/1'   
    And method delete
    * print response
    
    # Delete with wrong endpoint
    Scenario: Updating order
    And path '/v2/store/order/567898'   
    And method delete
    * print response
    
  # get deleted record
 Scenario: Get deleted record
 And path '/v2/store/order/1'
 And method get
 And status 404
 


