<%-- 
    Document   : delete
    Created on : Sep 8, 2019, 11:33:57 PM
    Author     : Kunal
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<%
    String d=request.getParameter("d");
    Connection con=null;
                        Statement st=null;
                        PreparedStatement stmt=null;
                        ResultSet rs=null;
                        Class.forName("com.mysql.jdbc.Driver").newInstance();  
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event2","root","");
                        st=con.createStatement();
                        st.executeUpdate("delete from organiser where id='"+d+"'");
                        response.sendRedirect("vieworg.jsp?page2=1");
                     
    %>