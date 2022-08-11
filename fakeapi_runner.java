package fakeRest_api;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class fakeapi_runner {
	
	
	@Karate.Test
	Karate testRunner() {
		return Karate.run("POST_Azure").relativeTo(getClass());
		
}
}


// POST_1
// CRUD
//POST_Azure
