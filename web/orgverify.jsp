<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="newcss.css">
<title>Login Form Design</title>
   
<body>
    
       
        <div class="container-fluid">
            <div class="row justify-content-center justify-content-sm-center">
                <div class="col-12 col-sm-6 col-md-3">
                    <form class="form-container" action="logorgverify" method="post">
                         <div class="form-group">
                          <h3 class="text-center">Verify</h3>
                         </div>
                        <div class="form-group">
                         <label for="event">Event</label>
                         <select id="pvevent" class="form-control" name="event" required="select event">
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
                     
                      <div class="form-group">
                   <label for="pwd">Password:</label>
                   <input type="password" class="form-control" name="password" placeholder="Enter Password" required="password">
             </div>
             <button type="submit" class="btn btn-primary btn-block">Submit</button>
             
                    </form>          
                </div>
               
            </div>
        </div>
 
        
 <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
</body>

</html>