package com.kh.makeit.common;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class SendMail {
    public SendMail(){}
    
    final static String username="i37491287@gmail.com";
    final static String password="1q2w3e4r!@#$";
    
    public static int sendmail(String email){
        
        Properties props = new Properties(); 
        /*props.put("mail.smtp.user",username); 
        props.put("mail.smtp.password", password);*/
        props.put("mail.smtp.host", "smtp.gmail.com"); 
        props.put("mail.smtp.port", "25"); 
        props.put("mail.debug", "true"); 
        props.put("mail.smtp.auth", "true"); 
        props.put("mail.smtp.starttls.enable","true"); 
        props.put("mail.smtp.EnableSSL.enable","true");
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
        props.setProperty("mail.smtp.socketFactory.fallback", "false");   
        props.setProperty("mail.smtp.port", "465");   
        props.setProperty("mail.smtp.socketFactory.port", "465"); 
        
        int randomNo = ((int)(Math.random()*1000000));
        
    
        Session session = Session.getInstance(props, 
         new javax.mail.Authenticator() { 
        protected PasswordAuthentication getPasswordAuthentication() { 
        return new PasswordAuthentication(username, password); 
        }});
        try{
            Message message = new MimeMessage(session); 
            message.setFrom(new InternetAddress("i37491287@gmail.com"));// 
            message.setRecipients(Message.RecipientType.TO,
            InternetAddress.parse(email)); 
            message.setSubject("MakeIT 인증번호 입니다.");
            message.setText("인증번호는 ["+randomNo+"]번 입니다.");//내용 
            //message.setContent("인증번호는 ["+randomNo+"]번 입니다.","text/html; charset=utf-8");
            Transport.send(message); 
            
        } catch(Exception e){
            e.printStackTrace();
        }
        return randomNo;
    }    
}