/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kunal;


import com.login.dao.LogiinDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kunal
 */
@WebServlet("/logorg")
public class logorg extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String event=request.getParameter("event");
         LogiinDao dao=new LogiinDao();
       
        
           
         if(dao.check1(email,password,event))
        {
        HttpSession session=request.getSession();
        session.setAttribute("em", email);
        session.setAttribute("pas", password);
        session.setAttribute("eve", event);
        response.sendRedirect("adminpanelorg.jsp");
                }
        else
        {
            response.sendRedirect("loginorg.jsp");
           PrintWriter out=response.getWriter();
           out.println("Wrong Credentials");
        }
        
        
    }
    
}
