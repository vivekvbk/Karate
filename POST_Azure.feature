Feature: Azure Post

  Background: 
    Given url 'https://fakerestapi.azurewebsites.net'
    * def payload = read('this:Azure.json')
    * def Schema = read ('this:AzureSchema.json')

  Scenario Outline: 
    And path 'api/v1/Activities'
    And request {"id": <id>,"title": <title>,"dueDate": "2022-07-14T11:35:52.213Z","completed": <status> }
    And headers {Accept : '<headerType>', Content-Type: '<headerType>'}
    And method post
    * print response
    And status <responseStatus>
    * def id = $.id
    * print id
    * def title = $.title
    # Validating data type of response
    * match id == '<idDataType>'
    * match title == '#string'

    Examples: 
      | id            | title   | status | responseStatus | headerType       | idDataType  |
      |             9 | Vivek   | true   |            200 | application/json | #number     |
      | A             | JARS    | false  |            415 | application/xml  | #notpresent |
      | &             | VIVEKKK | true   |            400 | application/json | #notpresent |
      |            -8 | ZYZ     | true   |            200 | application/json | #number     |
      | 9999999999999 | TYTY    | true   |            400 | application/json | #notpresent |

  Scenario Outline: Get
    And path '<path>'
    And method <method>
    * print responseStatus
    * print response
    And status <responseStatus>

    Examples: 
      | path                  | method | responseStatus |
      | api/v1/Activities/9   | get    |    200 |
      | api/v1/Activities/998 | get    |    404 |

  Scenario Outline: put
    And path '<path>'
    And request payload
    And method <method>
    * print responseStatus
    * print response
   And status <responseStatus>

    Examples: 
      | path                | method | responseStatus |
      | api/v1/Activities/9 | put    |    200 |
      

  Scenario Outline: delete
    And path '<path>'
    And method <method>
    * print responseStatus
    * print response
   And status <responseStatus>

    Examples: 
      | path                | method | responseStatus |
      | api/v1/Activities/9 | delete |    200 |
