Feature: Delete API feature


  Background: Delete request 
    Given url baseUrl+'/public/v2/users/'
    * def Patchreq = call read('Patch.feature')
    * def userId = PostReq.per_ID
    * def tokedID = "be5ed54f8fbf23f9df2d3149b00010353aa864ae42b3f0d68674e7b4868cb875"

  Scenario Outline: PATCH/PUT
    And path userId
    And method delete
    And status 204