package com.belalsoft.JerseyDemo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Random;


import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.web.bind.annotation.PathVariable;

import com.Train.Controller.Controller;

/**
 * Root resource (exposed at "myresource" path)
 */
@Path("myresource/{mobile_no}")
public class MyResource {
Controller controller=new Controller();
    /**
     * Method handling HTTP GET requests. The returned object will be sent
     * to the client as "text/plain" media type.
     *
     * @return String that will be returned as a text/plain response.
     */
/*    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public int getIt() {

    	  Random random = new Random();
    	 int otp= random.nextInt(10000);
        return otp;
    }*/
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public int otp(@PathVariable("mobile_no")String mobile) {

    		System.out.println("coming mobile no:"+mobile);
    	
    		String mobile_no="80732352289";
    		System.out.println("hi i am in send otp");
    		String authkey = "87768AwvjTXOyo567bef4e";
    		// String authkey = "295983ACpQWY9W5d8c5744";

    		Random rand = new Random();
    		int otp = rand.nextInt(900000) + 100000;
    	

    		String senderId = "INGROI";

    		String message = "your OTP is :" + otp;

    		System.out.println("this is message" + message);

    		String route = "4";

    		URLConnection myURLConnection = null;
    		URL myURL = null;
    		BufferedReader reader = null;

    		String encoded_message = URLEncoder.encode(message);

    		// Send SMS API
    		String mainUrl = "http://api.msg91.com/api/sendhttp.php?";
    		/*
    		 * String mainUrl ="https://control.msg91.com/api/sendotp.php?";
    		 * ?otp=788585&otp_length=6&sender=igiinfo&message=788585&mobile=8095877414&
    		 * authkey=295967AKtHn6sR5d8c4a56
    		 */
    		StringBuilder sbPostData = new StringBuilder(mainUrl);
    		sbPostData.append("authkey=" + authkey);
    		/*
    		 * sbPostData.append("&email="+email); sbPostData.append("&pass="+pass);
    		 * sbPostData.append("&name="+name);
    		 */
    		sbPostData.append("&mobiles=" + mobile_no);
    		sbPostData.append("&message=" + encoded_message);
    		sbPostData.append("&route=" + route);
    		sbPostData.append("&sender=" + senderId);
    		mainUrl = sbPostData.toString();
    		try {
    			System.out.println("in try");
    			myURL = new URL(mainUrl);
    			myURLConnection = myURL.openConnection();
    			myURLConnection.connect();
    			reader = new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
    			String response;
    			while ((response = reader.readLine()) != null)
    				System.out.println("in res");
    			System.out.println(response);
    			reader.close();
    		} catch (IOException e) {
    			System.out.println("in catch");
    			e.printStackTrace();
    		}
   
    		System.out.println("actual otp:.." + otp);
    		
    		return otp;

    	}
    	
}
