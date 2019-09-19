

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
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
                   <li class="nav-item"><a class="nav-link" href="adminpanel.jsp"><span class="fa fa-home fa-lg"></span> Home</a></li> 
                   <li class="nav-item dropdown">
                       <a class="nav-link dropdown-toggle active" href="#" id="navbar-dropdown" role="button" data-toggle="dropdown">
                           <span class="fa fa-info fa-lg"></span> Add</a>
                       <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            
                            <a class="dropdown-item" href="addevent.jsp">Event</a>
                            <div class="dropdown-divider"></div>
                            
                            <a class="dropdown-item " href="addparticipant.jsp" >Participant</a>
                            <div class="dropdown-divider"></div>
                            
                            <a class="dropdown-item active" href="addorg.jsp">Organiser</a>
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
  <div class="container-fluid">
            <div class="row justify-content-center justify-content-sm-center">
                <div class="col-12 col-sm-6 col-md-3">  
                    <form class="form-container" action="addorg" method="post" name="form1">
    <div class="form-group">
        <h3 class="text-center">Add Organiser</h3>
        <p>Name</p>
        <input type="text" name="oname" class="form-control" placeholder="Enter Name" required="Enter name">
    </div>
                        <div class="form-group">
            <p>Mobile no.</p>
            <input type="text" name="omobile" class="form-control" placeholder="Enter Mobile no." required="enter mobile">
            
                         <div class="form-group form-check">
                <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" id="myCheck" onclick="phonenumber(document.form1.omobile)">Verify Number
              </label>
                        </div>
                        </div>
                        <div class="form-group">
            <p>Email id</p>
            <input type="email" class="form-control" name="oemail" placeholder="Enter Email" required="enter email">
                        </div>
                        <div class="form-group">
                            <p>Password</p>
            <input type="password" class="form-control" name="opass" placeholder="Set Password" required="enter email">
                        </div>
                        <div class="form-group">
            <p>Event</p>
            <select name="oevent" class="form-control" required="select event">
            <option value="Select event" selected>Select Event</option>
            <%
                 try {
       Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event2","root","");
        Statement st=con.createStatement();
       
        ResultSet rs=st.executeQuery("SELECT * FROM `event2`");
        
        while(rs.next())
        {
            %>
            <option><%=rs.getString(2)%></option>
            <%
        }
           
    } catch (Exception ex) {
           
            ex.printStackTrace();      }
    
            
            
            
            
            %>
        </select>
                        </div>
   <button type="submit" class="btn btn-primary btn-block">Add</button>
        </form>
                </div>
            </div>
  </div>

<script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="phone_no.js"></script>
        <script src="js/bootstrap.min.js"></script>
</body>
</html>