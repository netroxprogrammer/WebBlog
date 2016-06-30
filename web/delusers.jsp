<%@page import="Utils.Users"%>
<%@page import="Utils.UplaodStatus"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DbHandler.DbConnection"%>
<jsp:include page="includes/header.jsp"/>
<%
 DbConnection db = new DbConnection();
 if(session!=null && session.getAttribute("login")!=null){
     if(request.getParameter("delid")!=null){
         int id = Integer.parseInt(request.getParameter("delid"));
         db.deleteUsers(id);
         response.sendRedirect("delusers.jsp?message= Delete SuccessFully");
     }
       
     
%>
 <div class="row"><div class="col-sm-9 col-sm-offset-3">
<table class="table table-inverse">
  <thead>
    <tr>
      
      <th>Id</th>
      <th>User Name</th>
      <th>Email</th>
       <th>Actions</th>
    </tr>
  </thead>
  <%
     ArrayList<Users> list= db.getUsers();
     for(Users post: list){
        %>
  <tbody>
    <tr>
     <td><%=post.getUserId() %></td>
      <td><%=post.getUserName() %></td>
      <td><%=post.getUserEmail() %></td>
     <td> 
      <% if(post.getRole().equalsIgnoreCase("admin")){  %>
       <a href="#" class="btn btn-link">No</a> 
      <a href="updateUsers.jsp?delid=<%=post.getUserId() %>" class="btn btn-link">update</a>
       
      <%
      } if(post.getRole().equalsIgnoreCase("fromAdmin")){%>
    <a href="delusers.jsp?delid=<%=post.getUserId() %>" class="btn btn-link">delete</a>
       <a href="updateUsers.jsp?delid=<%=post.getUserId() %>" class="btn btn-link">update</a></td>
  <%}%>    
</tr>
    
  </tbody>
  <% 
     }
  %>
</table>
<%
 }
 else{
     response.sendRedirect("login.jsp");
 }
%>
     </div>
 </div>
<jsp:include page="includes/footer.jsp" />