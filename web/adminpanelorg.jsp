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
<body background="img/intro-carousel/2.jpg">
  
 <%
     response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
     
     
   String m=(String)session.getAttribute("em");
   String n=(String)session.getAttribute("pas");
   String o=(String)session.getAttribute("eve");
   if(m==null&&n==null&&o==null)
   {
       response.sendRedirect("loginorg.jsp");
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
                   <li class="nav-item active"><a class="nav-link" href="adminpanelorg.jsp"><span class="fa fa-home fa-lg"></span> Home</a></li> 
                   <li class="nav-item dropdown">
                       <a class="nav-link dropdown-toggle" href="#" id="navbar-dropdown" role="button" data-toggle="dropdown">
                           <span class="fa fa-info fa-lg"></span> Add</a>
                       <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            
                            
                            <a class="dropdown-item" href="addparticipant1.jsp">Participant</a>
                            
                             
                       </div>
                   </li> 
                   <li class="nav-item dropdown">
                       <a class="nav-link dropdown-toggle" href="#" id="navbar-dropdown" role="button" data-toggle="dropdown">
                           <span class="fa fa-info fa-lg"></span> View</a>
                       <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            
                            
                            <a class="dropdown-item" href="orgverify.jsp" >Participant</a>
                            
                             
                       </div>
                   </li>   
                    	             	
                    </ul>
                       
                       <form action="logout1" method="post">
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


