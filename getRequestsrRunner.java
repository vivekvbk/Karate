package getRequests;


import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class getRequestsrRunner {

	@Test
	Karate testRunner() {
		return Karate.run("Get_1").relativeTo(getClass());
	}
	
}
