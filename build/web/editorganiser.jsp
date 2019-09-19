<%-- 
    Document   : edit
    Created on : Sep 8, 2019, 10:05:27 PM
    Author     : Kunal
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
          <%
              response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
              
              
   String m=(String)session.getAttribute("em");
   String n=(String)session.getAttribute("pas");
   if(m==null&&n==null)
   {
       response.sendRedirect("login.jsp");
   }
   
%>
        <div class="container">
            <div class="row">
                <h1>Edit</h1>
            </div>
        </div>
    <div class="container">
        
            
                <%
                        Connection con=null;
                        Statement st=null;
                        PreparedStatement stmt=null;
                        ResultSet rs=null;
                        Class.forName("com.mysql.jdbc.Driver").newInstance();  
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event2","root",""); 
                     
                %>
                <form method="post">
            <%
                   st=con.createStatement();
                   String u=request.getParameter("u");
                   String data="Select * from organiser where id='"+u+"'";
                   rs=st.executeQuery(data);
                   while(rs.next()){
              %>
              <input type="hidden" name="id" value="<%=rs.getString("id")%>">
            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" name="nm" value="<%=rs.getString("Name")%>"/>
            </div>
            <div class="form-group">
                <label>Phone</label>
                <input type="text" class="form-control" name="pn" value="<%=rs.getString("Mobile")%>"/>
             </div>
            <div class= "form-group">
                <label>Email</label>
                <input type="email" class="form-control" name="em" value="<%=rs.getString("Email")%>"/>
            </div>
            <div class="form-group">
                <label>Event</label>
                <input type="text" class="form-control" name="ev" value="<%=rs.getString("Event")%>"/>
            </div>
              <%
                }
              %>
              
            <button class="btn btn-primary">Submit</button>
            </form>
            </div>    
        
    
    </body>
</html>
<%
                   String a=request.getParameter("id");
                   String b=request.getParameter("nm");
                   String c=request.getParameter("pn");
                   String d=request.getParameter("em");
                   String e=request.getParameter("ev");
                   if(a!=null&&b!=null&& c!=null &&d!= null &&e!=null)
                   {
                       String query="update organiser set Name=?,Mobile=?,Email=?,Event=? where id='"+a+"'";
                       stmt=con.prepareStatement(query);
                       stmt.setString(1, b);
                        stmt.setString(2, c);
                         stmt.setString(3, d);
                          stmt.setString(4, e);
                          stmt.executeUpdate();
                          response.sendRedirect("vieworg.jsp?page2=1");
                          
                        
                   }
                   %>
