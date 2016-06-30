<%@page import="Utils.Users"%>
<%@page import="DbHandler.DbConnection"%>
<jsp:include page="includes/header.jsp"/>
        <%
            DbConnection db = new DbConnection();
            if(session!=null && session.getAttribute("login")!=null){
                if(request.getParameter("submit")!=null){
                 String pass =  request.getParameter("newpass");
                Users user = new Users();
                 int  id = (Integer)session.getAttribute("id");
                 user.setUserId(id);
                 user.setUserPassword(pass);
                 db.changePassword(user);
                 response.sendRedirect("logout.jsp");
                }
           %>  
           <div class="row"><div class="col-sm-9 col-sm-offset-3">
           <form class="form-horizontal" action = "chanegPass.jsp" method="post">
 <div class="form-group">
    <label for="newpass" class="col-sm-2 control-label">New Password</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name= "newpass" id="inputEmail3" placeholder="New Password">
    </div>
  </div>
     <input type="hidden" value="login" name="check">
     <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <input type="submit" name="submit" value="submit" class="btn btn-default">
    </div>
  </div>
</form>
               </div></div>
       
           
            <%}
            else{
                response.sendRedirect("login.jsp");
            }
        %>
        <jsp:include page="includes/footer.jsp" />
 
