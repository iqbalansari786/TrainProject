package com.Train.Mail;



import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailMail {
	  // Replace with your email here:  
    public static final String MY_EMAIL = "ansaris500@gmail.com";
 
    // Replace password!!
    public static final String MY_PASSWORD = "iloveuamina";
 
  
    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
 
        mailSender.setUsername(MY_EMAIL);
        mailSender.setPassword(MY_PASSWORD);
 
 
        return mailSender;
    }
 
}