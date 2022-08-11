Feature: Crud operations

  Background: 
    Given url 'https://petstore.swagger.io'
    * def petPost = read('this:petStore.json')
    * def petSchema = read('this:petStoreSchema.json')
    * def javaMethod = Java.type('gorest_api.javaMethod')
    * def Updatepet = read('this:updatepet.json')

  Scenario: Post,Put,Get,Delete
    And path '/v2/pet'
    And request petPost
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    And method post
    And status 200
    * print responseStatus
    * print response
    # json Schema validation
    * match response == petSchema
    # response should match posted data
    * match response == petPost
    # print response into text file
    * string response = response
    * def SaveResponse = javaMethod.WriteData(response)

  # Get
  Scenario: Get posted order
    And path '/v2/pet/8'
    And method get
    And status 200
    * print responseStatus
    * print response
    * match response == petPost
 
 # put
  Scenario: Updating data
    And path '/v2/pet/'
    And request Updatepet
    And method put
    And status 200
    * print responseStatus
    * print response
    * match response == Updatepet
    
    
    
    # Validating xml
    
    
 
 # get
  Scenario: Get posted order
    And path '/v2/pet/99'
    And method get
    And status 200
    * print responseStatus
    * print response

 # delete
  Scenario: delete posted order
    And path '/v2/pet/99'
    And method get
    And status 200
    * print responseStatus
    * print response
 
 # get
  Scenario: Get deleted order
    And path '/v2/pet/99'
    And method get
    And status 404
    * print responseStatus
    * print response

 # post
  Scenario Outline: Post with Scenario Outline <Scenario>
    And path '/v2/pet'
    And request
      """
      {
      "id": <id>,
      "category":{
          "id": 5,
          "name": <pet_category>
      },
      "name": "doggie",
      "photoUrls": [
          "123"
      ],
      "tags": [
          {
              "id": 3,
              "name": <pet_name>
          }
      ],
      "status": "available"
      }
      }
      """
    And method post
    And headers {Accept : '<headerType>', Content-Type: '<headerType>'}
    And status <statusCode>
    * print responseStatus
    * print response
    # json Schema validation
    * match response == petSchema
    # response should match posted data
    # print response into text file
    * string response = response
    * def SaveResponse = javaMethod.WriteData(response)

    Examples: 
      | Scenario   | id | pet_category | pet_name | statusCode | headerType       |
      | Scenario 1 |  6 | horses       | Horsey   |        200 | application/json |
      | Scenario 2 |  2 |          123 | Horsey   |        200 | application/json |
      | Scenario 3 |  3 | monkeys      | king     |        200 | application/xml  |
      | Scenario 4 |  0 | Donkeys      | Kinfs    |        200 | application/json |
      | Scenario 5 | $  | SpecialKey   | vivo     |        500 | application/json |
