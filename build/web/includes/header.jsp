
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>My Blog</title>

    <!-- Bootstrap Core CSS -->

<link href="./css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="./css/blog-post.css" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link href="./css/sb-admin-2.css" rel="stylesheet">
<!-- Optional theme -->

  <script src="./js/sb-admin-2.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" 
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">My Blog</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="home.jsp">Home</a>
                    </li>
                    <% 
                  
            if(session!=null && session.getAttribute("login")!=null){
  %>                
                   <li>
                        <a href="uplaodPost.jsp">add New Post</a>
                    </li>
                      
                   <li>
                        <a href="myPosts.jsp">My Post</a>
                    </li>
                    
                     <li>
                        <a href="chanegPass.jsp">change Password</a>
                    </li>
                    <%
                    if(session.getAttribute("role").equals("admin")){ 
                    %>
                    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Accounts
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="addusers.jsp">Add Users</a></li>
          <li><a href="delusers.jsp">Delete/update User</a></li>
        </ul>
      </li>
                  
                    <%}%>
                     <li>
                        <a href="logout.jsp">Logout</a>
                    </li>
                    
                    
                    
  
            <%} else{ %>
            
            <li>
                        <a href="login.jsp">Login</a>
                    </li>           
                    <li>
                        <a href="signup.jsp">Sign up</a>
                    </li>
                        <% }%>
                    
                </ul>
                    
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
  <% 
                  
            if(session!=null && session.getAttribute("login")!=null){
  %>               
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <center> <img src="images/profile.png" class="img-responsive" alt="profile Image" width="100" height="80">
                            <a href="logout.jsp">Logout</a>
                        </center>
                            <li>
                            <a href="chanegPass.jsp"><i class="fa fa-dashboard fa-fw"></i> Security</a>
                        </li>
                        <li>
                            <a href="uplaodPost.jsp"><i class="fa fa-bar-chart-o fa-fw"></i> add New Post<span class="fa arrow"></span></a>
                            
                        </li>
                         <li>
                            <a href="myPosts.jsp"><i class="fa fa-bar-chart-o fa-fw"></i>All Posts<span class="fa arrow"></span></a>
                            
                        </li>
                        <%
                    if(session.getAttribute("role").equals("admin")){ 
                    %>
                        <li>
                            <a href="addusers.jsp"><i class="fa fa-bar-chart-o fa-fw"></i> Add Users<span class="fa arrow"></span></a>
                            
                        </li>
                        <li>
                            <a href="delusers.jsp"><i class="fa fa-bar-chart-o fa-fw"></i> Delete/update User<span class="fa arrow"></span></a>
                            
                        </li>
                        <%} }
                        %>
                       
                                    </ul>
                                </div>
            </div>
    <!-- Page Content -->
    <div class="container">
