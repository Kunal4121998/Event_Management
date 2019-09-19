<%-- 
    Document   : adminpanel
    Created on : Sep 3, 2019, 12:16:12 AM
    Author     : Kunal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>My css website</title>
</head>

 <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="newcss.css">
  
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
  
             <nav class="navbar navbar-dark navbar-expand-sm fixed-top">
   	             <div class="container">
   	             	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
   	             		<span class="navbar-toggler-icon"></span>
   	             	</button> 
   	             	<!-- make compatible for phone, data-toggle is bootstrap javascript comp -->
                   <a class="navbar-brand" href="#">Synergy</a>
                   <div class="collapse navbar-collapse" id="Navbar">
                   <ul class="navbar-nav mr-auto">
                   <li class="nav-item active"><a class="nav-link" href="adminpanel.jsp"><span class="fa fa-home fa-lg"></span> Home</a></li> 
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
                   <li class="nav-item dropdown">
                       <a class="nav-link dropdown-toggle" href="#" id="navbar-dropdown" role="button" data-toggle="dropdown">
                           <span class="fa fa-info fa-lg"></span> View</a>
                       <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            
                            <a class="dropdown-item" href="viewevent.jsp?page=1">Event</a>
                            <div class="dropdown-divider"></div>
                            
                            <a class="dropdown-item" href="participantupdate.jsp?page1=1" >Participant</a>
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

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

</body>
</html>


