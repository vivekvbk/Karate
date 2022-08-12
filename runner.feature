Feature: Managing Scenarios


  Background:

    * def testtemplate = read('this:Testtemplate.csv')


      Scenario Outline: <testscenario>
       # * def selectedTestcase = '<testid>'
        # * def fun = function(x){ return x.selectedTestcase == <testid> }
        * def Runner = call read('<featurename>.feature@<testid>')

        #* def filtered = karate.filter(data, fun)


        Examples:
        |testtemplate|



