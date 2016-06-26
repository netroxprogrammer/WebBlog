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
                   
                    String title=  (String)request.getParameter("title");
                    String des=  (String)request.getParameter("des");
                    String category=  (String)request.getParameter("category");
                    int id =    Integer.parseInt(request.getParameter("idd"));
                    UplaodStatus post= new UplaodStatus();
                    post.setTitle(title);
                    post.setCategory(category);
                    post.setDescription(des);
                     post.setId(id);
                    db.updatePost(post);
                    response.sendRedirect("home.jsp");
                }
%>            


<jsp:include page="includes/header.jsp" />

<p class="btn btn-primary btn-lg btn-block"> Post Status</p>
<br><br><br>
<%
                int id=0;
               if(request.getParameter("delid")!=null){
                   id = Integer.parseInt(request.getParameter("delid"));
ArrayList<UplaodStatus> postlist = db.searchPost("nooo..",id);
for(UplaodStatus post : postlist){

%>
<form class="form-horizontal" action="editPost.jsp" method="get">
    <input type="hidden" value="<%=post.getId() %>" name="idd">
    <div class="form-group">
    <label for="title" class="col-sm-2 control-label">Title</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="title" value="<%=post.getTitle() %>" id="title" placeholder="Title">
    </div>
  </div>
    <div class="form-group">
  <label for="" class="col-sm-2 control-label">Description</label>
   <div class="col-sm-10">
  <input type="text" class="form-control" name="des" rows="5"  value="<%=post.getDescription() %>" id="Description">
  </div>
</div>

  <div class="form-group">
  <label for="" class="col-sm-2 control-label">Select Category:</label>
   <div class="col-sm-10">
  <select class="form-control" name="category">
  <%
  
 
  ArrayList<Category> list =  db.getCategory();
 for(Category cat : list){
  if(cat.getCategory().equalsIgnoreCase(post.getCategory())){
  %>
 
  <option value="<%=cat.getCategory() %>" selected><%=cat.getCategory() %></option>
 <%}else{%>
      <option value="<%=cat.getCategory() %>"><%=cat.getCategory() %></option>
  <%}
  
 }%>
  </select>
       
   </div>
  </div>
  <center>
  <input type="submit" name="submit" value="Update" class="btn btn-primary btn-lg">
   </center>
</form>

 <%  
} 
               }            }
            else{
                response.sendRedirect("login.jsp");
            }
 %>
<jsp:include page="includes/footer.jsp" />