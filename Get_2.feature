Feature: Get request of publicapi

  Background: 
    Given url 'http://universities.hipolabs.com'
    * def universitySchema = read('this:universities.json')

  Scenario Outline: Get request
    And path '/search'
    And params {country :<countryName>}
    And header Accept-Encoding = 'gzip'
    And header Connection = 'Keep-Alive'
    And header server = 'nginx'
    And header accept = '<headerType>'
    When method get
    Then status <responseCode>
    And response.alpha_two_code== '<ShortCode>'
    * print response
    * def Responseschema = "#[] ##(universitySchema)"
    * match response == Responseschema

    Examples: 
      | countryName | headerType       | responseCode | ShortCode |
      | Canada      | application/json |          200 | CA        |
      | ###         | application/json |          404 | #         |
      | India       | application/json |          200 | IN        |
      | Turkey      | application/xml  |          200 | TU        |
