<%@page import="Utils.UplaodStatus"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DbHandler.DbConnection"%>
<jsp:include page="includes/header.jsp"/>
<%
 DbConnection db = new DbConnection();
 if(session!=null && session.getAttribute("login")!=null){
     if(request.getParameter("delid")!=null){
         int id = Integer.parseInt(request.getParameter("delid"));
         db.deletePost(id);
         response.sendRedirect("myPosts.jsp?message= Delete SuccessFully");
     }
       
     
%>
 <div class="row"><div class="col-sm-9 col-sm-offset-3">
         <p align="left"><a href="uplaodPost.jsp" class="btn btn-primary">Add New Post</a></p>
<table class="table table-inverse">
  <thead>
    <tr>
      
      <th>Id</th>
      <th>Title</th>
      <th>Time</th>
       <th>Category</th>
       <th>Actions</th>
    </tr>
  </thead>
  <%
     ArrayList<UplaodStatus> list= db.readPosts();
     for(UplaodStatus post: list){
        %>
  <tbody>
    <tr>
     <td><%=post.getId() %></td>
      <td><%=post.getTitle() %></td>
      <td><%=post.getTime() %></td>
      <td><%=post.getCategory() %></td>
      <td> <a href="myPosts.jsp?delid=<%=post.getId() %>" class="btn btn-link">delete</a>
       <a href="editPost.jsp?delid=<%=post.getId() %>" class="btn btn-link">update</a></td>
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
     </div></div>
<jsp:include page="includes/footer.jsp" />