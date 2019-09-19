/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kunal;

import com.adddao.AddDao;
import com.adddao.part;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kunal
 */
@WebServlet("/addevent")
public class add_event extends HttpServlet {
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String evname=request.getParameter("ename");
        String evtype=request.getParameter("etype");
        String evhead=request.getParameter("ehead");
        String evvenue=request.getParameter("evenue");
        String evtime=request.getParameter("etime");
        PrintWriter out =response.getWriter();
        part e=new part();
        e.setEvname(evname);
        e.setEvtype(evtype); 
        e.setEvhead(evhead);
        e.setEvvenue(evvenue); 
        e.setEvtime(evtime); 
        
        int status=AddDao.save(e);
        if(status>0)
        {
            out.println("Entered Successfully");
            response.sendRedirect("addevent.jsp");
          
        }else{
            out.println("unable to enter");
            
            
        }
        
    }
    
}
