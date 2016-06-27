<jsp:include page="includes/header.jsp" />

<p class="btn btn-primary btn-lg btn-block">   add New User</p> <br><br>
<form class="form-horizontal"  action = "UserControl" method="post">
   <div class="form-group">
    <label for="userName" class="col-sm-2 control-label">UserName</label>
    <div class="col-sm-10">
      <input type="text" class="form-control"  name="userName" id="userName" name="userName" placeholder="userName">
    </div>
  </div>
    <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" name="email" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control"  name="password" id="inputPassword3" placeholder="Password">
    </div>
  </div>
    <input type="hidden" name="check" value="adduser">
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <input type="submit"  value="Sign up" class="btn btn-default">
    </div>
  </div>
</form>
<jsp:include page="includes/footer.jsp" />