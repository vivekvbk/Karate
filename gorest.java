package gorest_api;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

	public class gorest {
		
		
		@Karate.Test
		Karate testRunner() {
			
			return Karate.run("PostScenario").relativeTo(getClass());
			

	}
	}


