package postRequests;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class postRequestsRunner {
	
	
	@Karate.Test
	Karate testRunner() {
		return Karate.run("CRUD").relativeTo(getClass());

}
}