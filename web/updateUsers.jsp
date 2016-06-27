<%@page import="Utils.UplaodStatus"%>
<%@page import="Utils.Users"%>
<%@page import="Utils.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DbHandler.DbConnection"%>
<%
   
     DbConnection db = new DbConnection();

            if(session!=null && session.getAttribute("login")!=null){
  //              response.sendRedirect("index.jsp");
                    
                if(request.getParameter("submit")!=null){
                   
                    String name =  (String)request.getParameter("userName");
                    String email=  (String)request.getParameter("email");
                    String pass=  (String)request.getParameter("password");
                    int id =    Integer.parseInt(request.getParameter("hid"));
                    Users user =  new Users();
                     user.setUserId(id);
                     user.setUserName(name);
                     user.setUserEmail(email);
                     user.setUserPassword(pass);
                    db.updateUsers(user);
                    response.sendRedirect("delusers.jsp");
                }
%>            


<jsp:include page="includes/header.jsp" />


<%
                int id=0;
               if(request.getParameter("delid")!=null){
                   id = Integer.parseInt(request.getParameter("delid"));
Users users = db.searchUser(id);

%>
<p class="btn btn-primary btn-lg btn-block">  Update User </p> <br><br>
<form class="form-horizontal"  action = "updateUsers.jsp" method="get">
     <input type="hidden" name="hid" value="<%=users.getUserId() %>" >
            <div class="form-group">
    <label for="userName" class="col-sm-2 control-label">UserName</label>
    <div class="col-sm-10">
      <input type="text" class="form-control"  value="<%=users.getUserName() %>" id="userName" name="userName" placeholder="userName">
    </div>
     </div>
    <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" value="<%=users.getUserEmail() %>" name="email" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="text" class="form-control"  value="<%=users.getUserPassword() %>" name="password" id="inputPassword3" placeholder="Password">
    </div>
  </div>
   
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <input type="submit" name="submit" value="Submit" class="btn btn-default">
    </div>
  </div>
</form>

 <%  

               }            }
            else{
                response.sendRedirect("login.jsp");
            }
 %>
<jsp:include page="includes/footer.jsp" />