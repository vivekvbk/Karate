Feature: Changing customer name from order

  Background: 
    Given url 'https://simple-tool-rental-api.glitch.me'
    * def orderedreq = call read('GetnPost.feature')
    * def userId = orderedreq.orderId
    * print userId
    * def orderToken = 'f19b7b3550a1103db9a7171ba49a0f6caae845b0e4861a48113450e30f6189c9'
    * def updatedName =
      """
      {
      "customerName": "IIIIII"
      					}
      """

  Scenario: Patch order
    And path `/orders/${userId}`
    And header Authorization = orderToken
    And request updatedName
    * print updatedName
    When method patch
    * print response
    And status 204

  Scenario: Get a updated order
    And path `/orders/${userId}`
    And header Authorization = orderToken
    When method get
    And status 200
    * print response
