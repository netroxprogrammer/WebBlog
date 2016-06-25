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
<jsp:include page="includes/header.jsp" />
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
<div class="form-group">
  <label for="" class="col-sm-4 control-label">Search By Category:</label>
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
    </div>
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
<%
}
 }
 else{
     response.sendRedirect("login.jsp");
 }
%>

<jsp:include page="includes/footer.jsp" />