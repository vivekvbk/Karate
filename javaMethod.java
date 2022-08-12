package feature4;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.util.Random;

public class javaMethod {
    public static void WriteData(Object arg) throws FileNotFoundException, UnsupportedEncodingException {
        int leftLimit = 48; // numeral '0'
        int rightLimit = 122; // letter 'z'
        int targetStringLength = 6;
        Random random = new Random();
        String generatedString = random.ints(leftLimit, rightLimit + 1)
                .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
                .limit(targetStringLength)
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                .toString();
        LocalDate myObj = LocalDate.now(); // Create a date object
        PrintWriter writer = new PrintWriter(myObj+generatedString+".json","UTF-8");
        writer.println(arg);
        writer.close();

    }

}
