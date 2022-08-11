function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
   env: env, 
	myVarName: 'hello karate', 
	baseUrl: 'https://gorest.co.in',
    tokenID: 'a1caf9d8aac20239b0bd67ba89d31f5b92909f23774ba5112725fa3d393fce7f'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}