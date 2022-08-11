Feature: Get request of publicapi

  Background: 
    Given url 'https://api.publicapis.org'
    * def publicapiSchema = read ('this:publicapi.json')

  Scenario Outline: Get request
    And path '/entries'
    And params {Auth:<authType>, HTTPS:<HttpType>,Category: <Category>}
    And header accept = 'application/json'
    And method get
    # Count should be greater Than zero
    And match response.count == '#number? _ >= <Count>'
    Then status <responseCode>
    Then response.Category== "<Category>"
    * print response
    * def Responseschema = {"count": "#number","entries":"#[] #object"}
    ##Schema validations should be done
    * match response == <JSCONSCHEMA>

    Examples: 
      | authType | HttpType | Category     | responseCode | Count | JSCONSCHEMA                  |
      | apiKey   | true     | Anti-Malware |          200 |    10 | publicapiSchema              |
      | xyzs     | true     | Anti-Malware |          200 |     0 | {"count": 0,"entries": null} |
      | apiKey   | true     | Anime        |          200 |     0 | publicapiSchema              |
      | OAuth    | true     | Anime        |          200 |     5 | publicapiSchema              |
