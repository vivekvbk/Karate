Feature: Get request of publicapi

  Background: 
    Given url 'https://datausa.io'
    * def Jsonschema = read('this:usa.json')

  Scenario Outline: Get request
    And path '/api/data'
    And params {drilldowns:'<drilldownType>', measures: '<MeasureType>'}
    And header accept = 'application/json'
    And method Get
    ##Status code should be 200
    Then status <ResponseCode>
    * print response
    * print responseStatus
    ##And match response contains deep {"Nation": "United States"}
    * match response.data[1].<KEY>  == '<Value>'
    * match response == <Schema>

    Examples: 
      | drilldownType | MeasureType | ResponseCode | KEY    | Value         | Schema                    |
      | Nation        | Population  |          200 | Nation | United States | Jsonschema                |
      | Year          | Population  |          200 | Year   | #present      | Jsonschema                |
      |               | Population  |          200 | Year   | #present     | Jsonschema                |
      | ##$%          | Population  |          200 | Year   | ##present      | {"data": [],"source": []} |
