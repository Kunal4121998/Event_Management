/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.addpart;

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
@WebServlet("/addparticipant11")
public class addpartorg extends HttpServlet {
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String pvname=request.getParameter("pname");
        String pvmob=request.getParameter("pmobile");
        String pvemail=request.getParameter("pemail");
        String pvevent=request.getParameter("pevent");
        String pv2name=request.getParameter("pname");
        String pv2mob=request.getParameter("pmobile");
        String pv2email=request.getParameter("pemail");
        String pv2event=request.getParameter("pevent");
        
        
        String pvuname=request.getParameter("puname");
          String pvapaid=request.getParameter("pamountpaid");
            String pvdue=request.getParameter("pamountdue");
              String pvclgname=request.getParameter("clgname");
                String pvmop=request.getParameter("pmode");
                  String pvwho=request.getParameter("preceiver");
                    String pvteam=request.getParameter("pteam");
        String subject="Login details";
        String msg="Your Login details are: Email: "+pvemail+"    "+"password: "+pvmob;
       
    
   
        PrintWriter out =response.getWriter();
        participant e=new participant();
        e.setName(pvname);
        e.setMobile(pvmob); 
        e.setEmail(pvemail);
        e.setEvent(pvevent);
        e.setUsername(pvuname);
        e.setPaid(pvapaid);
        e.setDue(pvdue);
        e.setCollege(pvclgname);
        e.setPayment(pvmop);
        e.setReceiver(pvwho);
        e.setTeammembers(pvteam);
        
        
        int status=addparticipant.save(e);
        if(status>0)
        {
               out.println("Entered Successfully");
               
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
                    message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(pv2email));
                    MimeBodyPart textpart =new MimeBodyPart();
                    Multipart multipart =new MimeMultipart();
                    String final_Text="Dear "+pv2name+"Subject: "+subject+"     "+"Message: "+msg;
                    textpart.setText(final_Text);
                    multipart.addBodyPart(textpart);
                    message.setContent(multipart);
                    message.setSubject("Login details");
                   
                     Transport.send(message);
                     out.println("Email Sent Successfully");
                    response.sendRedirect("addparticipant1.jsp");
    } catch (MessagingException ex) {
        
    out.println(ex);

    }
     
          
        }else{
            out.println("unable to enter");
            
            
        }
        
}       
}
        
        
   
    

