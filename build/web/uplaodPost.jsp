<%@page import="Utils.UplaodStatus"%>
<%@page import="Utils.Users"%>
<%@page import="Utils.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DbHandler.DbConnection"%>
<%
     DbConnection db = new DbConnection();

            if(session!=null && session.getAttribute("login")!=null){
  //              response.sendRedirect("index.jsp");
%>            


<jsp:include page="includes/header.jsp" />

<p class="btn btn-primary btn-lg btn-block"> Post Status</p>
<br><br><br>
<form class="form-horizontal" action="PostStatus" method="get">
  <div class="form-group">
    <label for="title" class="col-sm-2 control-label">Title</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="title" id="title" placeholder="Title">
    </div>
  </div>
    <div class="form-group">
  <label for="" class="col-sm-2 control-label">Description</label>
   <div class="col-sm-10">
  <textarea class="form-control" name="des" rows="5" id="Description"></textarea>
  </div>
</div>
  <div class="form-group">
  <label for="" class="col-sm-2 control-label">Select Category:</label>
   <div class="col-sm-10">
  <select class="form-control" name="category">
  <%
  
 
  ArrayList<Category> list =  db.getCategory();
 for(Category cat : list){
  %>
 
  <option value="<%=cat.getCategory() %>"><%=cat.getCategory() %></option>
 <%}%>
  </select>
       
   </div>
  </div>
  <center>
  <input type="submit" name="submit"  class="btn btn-primary btn-lg">
   </center>
</form>
 <%  
 
            }
            else{
                response.sendRedirect("login.jsp");
            }
 %>
<jsp:include page="includes/footer.jsp" />