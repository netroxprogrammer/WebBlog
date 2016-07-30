<%@page import="Utils.Comments"%>
<%@page import="Utils.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Utils.UplaodStatus"%>
<%@page import="Utils.UplaodStatus"%>
<%@page import="DbHandler.DbConnection"%>

     
<% 
    
     DbConnection db = new DbConnection();
 if(session!=null && session.getAttribute("login")!=null){
          
    if(request.getParameter("comment")!=null && request.getParameter("uid")!=null){
        
         Comments comment = new Comments();
         comment.setComment((String)request.getParameter("comment"));
         comment.setId(Integer.parseInt(request.getParameter("uid")));
         db.updateComments(comment);
         response.sendRedirect("home.jsp");
    }
    int  userid1= (Integer)session.getAttribute("id");
     
    if(request.getParameter("submit")!=null){
   
    Comments comment =  new Comments();
    String description = request.getParameter("des");
   String  userName =(String) session.getAttribute("name");
   int  userid= (Integer)session.getAttribute("id");
   int postId = Integer.parseInt(request.getParameter("postid"));
   comment.setComment(description);
   comment.setUserName(userName);
   comment.setUserid(userid);
   comment.setPostId(postId);
   if(db.addComments(comment)){
       response.sendRedirect("home.jsp");
   }
    }
    
%>
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
                   
                    <%
                    if(session.getAttribute("role").equals("admin")){ 
                    %>
                  
                  
                    <%}%>
                     <li>
                        <a href="logout.jsp">Logout</a>
                    </li>
                       <li>
                            <a href="myPosts.jsp"><i class="fa fa-bar-chart-o fa-fw"></i>My Accounts<span class="fa arrow"></span></a>
                            
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
  <div class="form-group">
      <center> <small>Search By Category:</small></center>
   <div class="col-sm-10">
   
       <form action="search.jsp">
       <select class="form-control" name="category">
     
 <%
  ArrayList<Category> lists =  db.getCategory();
 for(Category cat : lists){
  %>
 
  <option value="<%=cat.getCategory() %>"><%=cat.getCategory() %></option>
  
  <%}%>

  </select>
  <br>
  <center> <input type="submit" name="Search"  value="Search" class="btn btn-sm btn-primary">  </center>  
   
       </form>
  </div>
</div>
                        <%
                   }
                        %>
                       
                                    </ul>
                                </div>
            </div>
    <!-- Page Content -->
    <div class="container">


<script>
      function takeInput(){
        var person = prompt("Enter Comment", "");
if (person != null) {
    var id = document.getElementById("button").value;
 window.location.replace("home.jsp?comment="+person+"&uid="+id);
}
    }
    
    
</script>
 <div class="row">
     <div class="col-sm-9 col-sm-offset-3">

<br><br><br>
<% 
ArrayList<UplaodStatus> list = db.readPosts();
for(UplaodStatus post : list){
    
%>
<div class="row">
    
    
    <h4 class="media-heading"><font color="blue"><%=post.getTitle()%></font><br>
    <small><%=post.getTime() %></small> <br>
    <small> By <%=post.getAuthor() %></small> 
    <br>
    <%=post.getDescription() %>
 </h4>
 
 
 <div class="row  well">  
 
     <% 
ArrayList<Comments> cmnt = db.readComments(post.getId());
for(Comments c : cmnt){
%>

    <input type="hidden" name="check" value="delete">
 <h4 class="media-heading"><font color=lue"><%=c.getUserName() %></font><br>
    <small><%=c.getComment() %></small> <br>
     
    <small> By <%=c.getUserName() %></small> 
    <%
    if(c.getUserid()== userid1){
    %>
   
    <a href="UserControl?id=<%=c.getId() %>" class="btn btn-link">delete</a>
   
        <button  type="button" id="button"  value="<%=c.getId() %>" name="edit" onclick="takeInput();" class="btn btn-link" >edit</button>
    <%}%>
    <br>
    
 </h4>
    
</form

<%
}
%>
<label>Write Comments:</label><br>
<form>
<div class="col-sm-7">
         <input type="hidden" value="<%=post.getId() %>" name="postid">
         <textarea class="form-control" name="des" rows="5" cols="2" id="Description"></textarea>
     <input type="submit" name="submit"  class="btn btn-primary">
 </div>
              </form>
</div>

 </div>
     </div>
 </div>
         
<%
}
 }
 else{
     response.sendRedirect("login.jsp");
 }
%>
  
<jsp:include page="includes/footer.jsp" />