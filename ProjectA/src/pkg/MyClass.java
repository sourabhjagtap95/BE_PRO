/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.*;
import org.json.*;
/**
 *
 * @author sourabh
 */
public class MyClass extends HttpServlet {
    public native String displayIPv4();
    public static void addIPv4Data_InFile(String data) throws IOException{

    	File file = new File("/home/sourabh/Desktop/Project/NewIPv4Data.json");
    	FileWriter writer = new FileWriter(file); 
    	if(data!=null)
	    	writer.write(data);
	    else
	    	writer.write("NO DATA");
    	writer.flush();
	    writer.close(); 
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException
    {
        PrintWriter out = res.getWriter();
        out.println("inside do POST");
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();
        JsonObject obj = (JsonObject) parser
                .parse(req.getReader());
        Iterator it = (Iterator) obj.entrySet();
        while (it.hasNext()) {
            out.println(it.next());
        }
        out.println("over");
    }
    public static String DisplayIPv4(){
       return new MyClass().displayIPv4();
    }
    static {
        System.load("/home/sourabh/Desktop/Project/libdemo.so");
    }
}
