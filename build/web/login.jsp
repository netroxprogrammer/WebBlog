<%-- 
    Document   : login
    Created on : Jun 23, 2016, 4:49:40 AM
    Author     : mac
--%>

<jsp:include page="includes/header.jsp"/>
<%
            if(session!=null && session.getAttribute("login")!=null){
                response.sendRedirect("index.jsp");
            
}
            else{
               %>
            
<p class="btn btn-primary btn-lg btn-block">   Please Login </p> <br><br>
<form class="form-horizontal" action = "UserControl" method="post">
 <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" name= "email" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control"  name= "password" id="inputPassword3" placeholder="Password">
    </div>
  </div>
    <input type="hidden" value="login" name="check">
     <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <input type="submit"  value="Login" class="btn btn-default">
    </div>
  </div>
</form>
       
           <% }
        %>

<jsp:include page="includes/footer.jsp"/>