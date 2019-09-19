/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.addorg;

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
@WebServlet("/addorg")
public class addorg extends HttpServlet {
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String ovname=request.getParameter("oname");
        String ovmobile=request.getParameter("omobile");
        String ovemail=request.getParameter("oemail");
        String ovpass=request.getParameter("opass");
        String ovevent=request.getParameter("oevent");
        String subject="Login details";
        String msg="Your Login details are: Username: "+ovemail+"    "+"password: "+ovpass;
        PrintWriter out =response.getWriter();
        organiser e= new organiser();
        e.setName(ovname);
        e.setMobile(ovmobile); 
        e.setEmail(ovemail);
        e.setEvent(ovevent); 
        e.setPassword(ovpass);
        
        int status=add_org.save(e);
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
                    message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(ovemail));
                    MimeBodyPart textpart =new MimeBodyPart();
                    Multipart multipart =new MimeMultipart();
                    String final_Text="Dear "+ovname+"  "+"Subject: "+subject+"     "+"Message: "+msg;
                    textpart.setText(final_Text);
                    multipart.addBodyPart(textpart);
                    message.setContent(multipart);
                    message.setSubject("Login details");
                   
                     Transport.send(message);
                     out.println("Email Sent Successfully");
                    response.sendRedirect("addorg.jsp");
    } catch (MessagingException ex) {
        
    out.println(ex);

    }
       
          
        }else{
            out.println("unable to enter");
            
            
        }
        
    }
    
}
