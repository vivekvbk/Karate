package swagger_io;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class SwaggerRunner {
	
	
	@Karate.Test
	Karate testRunner() {
		return Karate.run("Pet_Store").relativeTo(getClass());

}
}