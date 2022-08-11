Feature: GET API headers feature

Scenario: pass the user request with headers_Part1
Given header Content-Type = 'application/json; charset=utf-8'
And header Accept-Encoding = 'gzip'
And header Connection = 'Keep-Alive'
And header server = 'nginx'
And header ETag = "W/'bff6df5638fb26d6e3f0fc1e36fa310f'"
And header X-Pagination-Limit = '20'
When url baseUrl+'/public/v1/users'
When method GET
Then status 200
* print response

Scenario: pass the user request with headers_Part2
* def request_headers = {Content-Type: 'text/xml;charset=ISO-8859-1', Connection: 'Keep-Alive', User-Agent: 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)'}
Given headers request_headers
When url baseUrl+'/public/v1/users'
And path '30'
When method GET
Then status 200
* print response


Scenario: pass the user request with headers_Part3
* configure headers = {Content-Type: 'text/xml;charset=ISO-8859-1', Connection: 'Keep-Alive', User-Agent: 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)'}
When url baseUrl+'/public/v1/users'
And path '30'
When method GET
Then status 200
* print response