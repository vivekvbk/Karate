Feature: Generating Token

  Background:
    Given url 'https://restful-booker.herokuapp.com'
    * def Booking = read('this:addBooking.json')
    * def token = read('this:token.json')


  Scenario Outline:
    And path '/booking'
    And request Booking
    When method post
    Then status <responseCode>
    * print response
    * print responseStatus
    * print token




    Examples:
      |responseCode|
      |   200         |