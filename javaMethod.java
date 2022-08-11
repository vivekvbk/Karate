package gorest_api;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

public class javaMethod {
    public static void WriteData(String arg) throws FileNotFoundException, UnsupportedEncodingException {

        PrintWriter writer = new PrintWriter("data.txt","UTF-8");
        writer.println(arg);
        writer.close();

    }
   
}