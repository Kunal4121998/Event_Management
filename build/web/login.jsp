<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="newcss.css">
<title>Login Form Design</title>
   
<body>
    
       
        <div class="container-fluid">
            <div class="row justify-content-center justify-content-sm-center">
                <div class="col-12 col-sm-6 col-md-3">
                    <form class="form-container" action="login" method="post">
                      <div class="form-group">
                          <h3 class="text-center">Admin Login</h3>
                        <label for="email">Email address:</label>
                        <input type="email" class="form-control" name="email" placeholder="Enter Email" required="email">
                       </div>
                      <div class="form-group">
                   <label for="pwd">Password:</label>
                   <input type="password" class="form-control" name="password" placeholder="Enter Password" required="password">
             </div>
             <div class="form-group form-check">
                <label class="form-check-label">
                   <input class="form-check-input" type="checkbox"> Remember me
              </label>
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