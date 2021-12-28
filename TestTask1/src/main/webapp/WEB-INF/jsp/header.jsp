<style>
body{}
footer{position:fixed; bottom:0px; width:100%;}
.point{cursor:pointer;letter-spacing:1px;transition:letter-spacing 0.5s;}
.point:hover{text-decoration:none; letter-spacing:2px; background-color:orange;border-radius:10px; color:white;}
</style>
 <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <nav class="navbar navbar-expand-lg text-dark" style="background-color:#e9f8ff;">
 <a class="navbar-brand" href="#" > <img alt="img" width="50" height="50" src="${pageContext.request.contextPath}\assets\image\hslogo.png"></a>
    <a class="navbar-brand text-dark" href="#">Hs Group Software Training and Consultancy
</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 ml-5">
    
        
      </ul>
	<ul class="nav justify-content-end">
	
  <li class="nav-item">
    <a id="home" class="nav-link active point" aria-current="page" href="home">Home</a>
  </li>
   <li id="sign_up" class="nav-item"><a href="register" class="nav-link point"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li id="login" class="nav-item"><span class="glyphicon glyphicon-log-in  point nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal1" >&nbsp;Login</span> </a></li>
       <li id="admin_login" class="nav-item"><span class="glyphicon glyphicon-log-in point nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal2" >&nbsp;Admin Login</span> </a></li>
       
  
				<li id="admin_panel" class="nav-item pr-5 ">  <h3 class="text-success">Admin Panel</h3>Welcome &nbsp; ${loginsuccess} &nbsp; <a class='mr-5 pr-5' href="/TestTask1/logout">
						
							<i class="fa fa-sign-out" style="font-size:18px; color:red;"></i>
						
					</a>
				</li>
									
		
 
</ul>
	
    </div>
  </div>
</nav>

  <!-- Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">User Login</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <div class="modal-body">
        <form action="adminlogin" method="post">
				
				<div class="form-group">
        		<label>UserName :</label>
        		<input type="text" name="username" class="form-control">
        	</div>
        	<div class="form-group">
        		<label>Password :</label>
        		<input type="password" name="password" class="form-control">
        	</div>
        	<div class="form-group mt-3 text-right row">
        	<div class="col-md-9">
        	</div>
        	<div class="col-md-3">
        			<button class="btn btn-success w-100" type="submit">Login</button>
        	</div>
        	</div>
        </form>
      </div>
    
    </div>
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>