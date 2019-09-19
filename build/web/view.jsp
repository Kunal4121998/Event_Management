<%-- 
    Document   : participantupdate
    Created on : Sep 8, 2019, 5:13:52 PM
    Author     : Kunal
--%>
<%@page import="java.util.List"%>
<%@page import="com.table.ParDao"%>
<%@page import="com.table.par"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h3>Participant</h3>
            </div>
            <div class="col-md-4">
                <form action="" method="get">
                    <input type="text" class="form-control" name="q" placeholder="Search here...">
                </form>
            </div>
            <div class="row">
            <div class="col-md-4 offset-10">
                <form action="addparticipant.jsp" method="get">
                    <button class="btn btn-primary">Add Participant</button>
                </form>
            </div>            
            </div>
        </div>
        </div>
        <div class="container"> 
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Event</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>
            
            <tbody>
                    <%
                        String spaceid=request.getParameter("u");
                        
                        
                        
                          List<par> list=ParDao.getRecords(start, total);
                        for(par p:list){
                            %>
                            <tr>
                                 <td><%=rs.getString("id")%></td>
                                 <td><%=rs.getString("Name")%></td>
                                 <td><%=rs.getString("Mobile")%></td>
                                 <td><%=rs.getString("Email")%></td>
                                 <td><%=rs.getString("Event")%></td>
                                 <td>
                                     <a href='edit.jsp?u=<%=rs.getString("id")%>' class="btn btn-warning">Edit</a>
                                      <a href='delete.jsp?d=<%=rs.getString("id")%>' class="btn btn-danger">Delete</a>
                                 </td>
                            </tr>
                            <%
                        }
                            %>
                            
            </tbody>
        </table>
                            <a href="participantupdate.jsp?page=1">1</a>
                            <a href="participantupdate.jsp?page=2">2</a>
                            <a href="participantupdate.jsp?page=3"><3/a>
        
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
