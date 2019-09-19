<%-- 
    Document   : participantupdate
    Created on : Sep 8, 2019, 5:13:52 PM
    Author     : Kunal
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
         <link rel="stylesheet" type="text/css" href="newcss1.css">
    </head>
    <body>
         <%
             response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
             %>
             <%
   String m=(String)session.getAttribute("em");
   String n=(String)session.getAttribute("pas");
   if(m==null&&n==null)
   {
       response.sendRedirect("login.jsp");
   }
   
%>
  <nav class="navbar navbar-dark navbar-expand-sm  fixed-top">
   	             <div class="container">
   	             	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
   	             		<span class="navbar-toggler-icon"></span>
   	             	</button> 
   	             	<!-- make compatible for phone, data-toggle is bootstrap javascript comp -->
                   <a class="navbar-brand" href="#">Synergy</a>
                   <div class="collapse navbar-collapse" id="Navbar">
                   <ul class="navbar-nav mr-auto">
                   <li class="nav-item"><a class="nav-link" href="adminpanel.jsp"><span class="fa fa-home fa-lg"></span> Home</a></li> 
                   <li class="nav-item dropdown">
                       <a class="nav-link dropdown-toggle" href="#" id="navbar-dropdown" role="button" data-toggle="dropdown">
                           <span class="fa fa-info fa-lg"></span> Add</a>
                       <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            
                            <a class="dropdown-item" href="addevent.jsp">Event</a>
                            <div class="dropdown-divider"></div>
                            
                            <a class="dropdown-item" href="addparticipant.jsp">Participant</a>
                            <div class="dropdown-divider"></div>
                            
                            <a class="dropdown-item" href="addorg.jsp">Organiser</a>
                            <div class="dropdown-divider"></div>
                            
                            <a class="dropdown-item" href="addadmin.jsp">Admin</a>
                             
                       </div>
                   </li> 
                   <li class="nav-item dropdown active">
                       <a class="nav-link dropdown-toggle" href="#" id="navbar-dropdown" role="button" data-toggle="dropdown">
                           <span class="fa fa-info fa-lg"></span> View</a>
                       <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            
                            <a class="dropdown-item" href="viewevent.jsp?page=1">Event</a>
                            <div class="dropdown-divider"></div>
                            
                            <a class="dropdown-item active" href="participantupdate.jsp?page1=1" >Participant</a>
                            <div class="dropdown-divider"></div>
                            
                            <a class="dropdown-item" href="vieworg.jsp?page2=1">Organiser</a>
                            <div class="dropdown-divider"></div>
                            
                            <a class="dropdown-item" href="viewadmin.jsp?page3=1">Admin</a>
                             
                       </div>
                   </li>   
                    </ul>
                       <form action="logout" method="post">
                       <ul class="navbar-nav navbar-right">
                           <li class="nav-item ml active"><input class="form-control" type="submit" value="Logout"></li> 	 
                       </ul>
                       </form>
                </div>
 

   	             </div>                                                                  
 
             </nav>


                   <div class="card card-container">
                    <h3 class="card-header abc text-center text-white">Participant Details</h3>
                    <div class="card-body">
  
     
        <div class="container">
        <div class="row">
            <div class="col-6 col-md-8">
                <form action="" method="post">
                    <input type="text" class="form-control" name="q" placeholder="Search here...">
                </form>
            </div>
            <div class="row">
            <div class="col-6 col-md-4 offset-5">
                <form action="addparticipant.jsp" method="get">
                    <button class="btn btn-primary">Add Participant</button>
                </form>
            </div>            
            </div>
        </div>
        </div>
        <div class="container table-responsive card-container"> 
            <div class="row">
                
                 
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Event</th>
                     <th>Username</th>
                    <th>Paid</th>
                    <th>Due</th>
                    <th>College</th>
                    <th>M.O.P</th>
                    <th>Receiver</th>
                    <th>Team</th>
                    <th class="text-center">Action1</th>
                    <th class="text-center">Action2</th>
                </tr>
            </thead>
            
            <tbody>
                     <%
              
                        String spaceid=request.getParameter("page1");
                        int pageid=Integer.parseInt(spaceid);
                        int total=50;
                        if(pageid==1){}
                        else{
                            pageid=pageid-1;
                        pageid=pageid*total+1;
                        }        
                        Connection con=null;
                        Statement st=null;
                        ResultSet rs=null;
                        PreparedStatement ps=null;
                        Class.forName("com.mysql.jdbc.Driver");  
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event2","root","");  
                        st=con.createStatement();
                        
                        String query=request.getParameter("q");
                        String data;
                        if(query!=null){
                            data="SELECT * FROM `participant` where `Name` like'%"+query+"%' or Mobile like'%"+query+"%' or Email like'%"+query+"%' or Event like'%"+query+"%' or Username like'%"+query+"%' or `Amount Paid` like'%"+query+"%' or `Amount Due` like'%"+query+"%' or `College Name` like'%"+query+"%' or `M.O.P` like'%"+query+"%' or `Receiver` like'%"+query+"%' or `Team Members` like'%"+query+"%'";
                        }else
                        {
                            data="SELECT * FROM participant limit "+(pageid-1)+","+total;
                        }
                        
                        rs=st.executeQuery(data);
                        while(rs.next()){
                            %>
                            <tr>
                                 <td><%=rs.getString("id")%></td>
                                 <td><%=rs.getString("Name")%></td>
                                 <td><%=rs.getString("Mobile")%></td>
                                 <td><%=rs.getString("Email")%></td>
                                 <td><%=rs.getString("Event")%></td>
                                  <td><%=rs.getString("Username")%></td>
                                 <td><%=rs.getString("Amount Paid")%></td>
                                 <td><%=rs.getString("Amount Due")%></td>
                                 <td><%=rs.getString("College Name")%></td>
                                 <td><%=rs.getString("M.O.P")%></td>
                                 <td><%=rs.getString("Receiver")%></td>
                                 <td><%=rs.getString("Team Members")%></td>
                                 <td>
                                     <a href='edit.jsp?u=<%=rs.getString("id")%>' class="btn btn-warning">Edit</a>
                                 </td>
                                 <td>
                                      <a href='delete.jsp?d=<%=rs.getString("id")%>' class="btn btn-danger">Delete</a>
                                 </td>
                            </tr>
                            <%
                        }
                            %>
                            
            </tbody>
        </table>
                            
                             <nav aria-label="...">
  <ul class="pagination">

    <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=1">1</a></li>
    <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=2">2</a></li>
     <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=3">3</a></li>
    <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=4">4</a></li>
     <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=5">5</a></li>
    <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=6">6</a></li>
     <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=7">7</a></li>
    <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=8">8</a></li>
     <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=9">9</a></li>
    <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=10">10</a></li>
     <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=11">11</a></li>
    <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=12">12</a></li>
    
     <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=13">13</a></li>
     <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=14">14</a></li>
    <li class="page-item"><a class="page-link" href="participantupdate.jsp?page1=15">15</a></li>
    
    
   
  </ul>
                             </nav>
                    </div>
                    </div>
               
        </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
