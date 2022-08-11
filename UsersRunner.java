package features;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
	
	 @Karate.Test
	 Karate getRequest() {
	        return Karate.run("getRequest").relativeTo(getClass());
	
	    }
	 
    }    


