     <footer class="text-center bg-dark">

 <a href="#" class="float-right" style="color: white;text-decoration: none; ">  2020 <i class="far fa-copyright"></i> Hs Group .LTD  All Right reserved</a>
     </footer>
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">User Login</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="dologin" method="post">
				<%
					String username = (String) session.getAttribute("username");
					if(username==null)
					{
						username = "";
					}
				%>
				<div class="text-danger"><%=username%></div>
				<div class="form-group mt-2">
        		<label>E-mail Id :</label>
        		<input type="text" name="username" class="form-control" placeholder=" Enter email as username">
        	</div>
        	<div class="form-group mt-2">
        		<label>Password :</label>
        		<input type="password" name="password" class="form-control" placeholder="enter password ">
        	</div>
        	<div class="form-group mt-2">
        		<button class="btn btn-success" type="submit">Login</button>
        	</div>
        	<div class="form-group mt-2">
        		<a href="forgetpass">Forget Password</a> || <a href="changepass"> Change Password </a>
        	</div>
        </form>
      </div>
   
    </div>
  </div>
</div>