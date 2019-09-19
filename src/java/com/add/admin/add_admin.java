/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.add.admin;

import com.add.admin.admin;
import com.adddao.part;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kunal
 */
@WebServlet("/addadmin")
public class add_admin extends HttpServlet {
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String uname=request.getParameter("email");
        String passed=request.getParameter("password");
        
        String name=request.getParameter("name1");
        String subject="Login details";
        String msg="Your Login details are: Username: "+uname+"    "+"password: "+passed;
        PrintWriter out =response.getWriter();
        admin a=new admin();
        
        a.setUsername(uname);
        a.setPassword(passed);
        
        int status=addadmin.save1(a);
        if(status>0)
        {
            
             final String username="gcoen021@gmail.com";
        final String password="@admin123";
        Properties props=new Properties();
        
        props.put("mail.smtp.auth",true);
         props.put("mail.smtp.starttls.enable",true);
         props.put("mail.smtp.host","smtp.gmail.com");
          props.put("mail.smtp.port","587");
               Session session =Session.getInstance(props, new javax.mail.Authenticator() {

               @Override
                   protected PasswordAuthentication getPasswordAuthentication() {
                   return new PasswordAuthentication(username,password); //To change body of generated methods, choose Tools | Templates.
                 }
              });
               try{
                    Message message=new MimeMessage(session);
                    message.setFrom(new InternetAddress(username));
                    message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(uname));
                    MimeBodyPart textpart =new MimeBodyPart();
                    Multipart multipart =new MimeMultipart();
                    String final_Text="Dear "+name+"     "+"Message: "+msg;
                    textpart.setText(final_Text);
                    multipart.addBodyPart(textpart);
                    message.setContent(multipart);
                    message.setSubject("Login details");
                   
                     Transport.send(message);
            
            out.println("Entered Successfully");
            response.sendRedirect("addadmin.jsp");
          
        }
               catch (MessagingException ex) {
        
    out.println(ex);

    }}else{
            out.println("unable to enter");
            
            
        }
        
    }
    
    }

