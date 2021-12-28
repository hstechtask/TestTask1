<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head><link rel = "icon" href = 
"https://c8.alamy.com/comp/2AP4XBT/letter-hs-logo-design-vector-template-initial-linked-letter-hs-vector-illustration-2AP4XBT.jpg"
		type = "image/x-icon"> 
		
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

    <title>Hello, world!</title>
<style type="text/css">
.navbar{box-shadow:0 0 15px black;}
.frm_elements{width:100%;padding:5px;margin:5px;}
.shadow{box-shadow:0 1px 12px black;}
footer{position:fixed; bottom:0px; width:100%;}
#user_register{height:80vh;background-image:url("${pageContext.request.contextPath}/assets/image/register_user.png");background-size:cover;}
</style>
  </head>
  <body>
  <c:import url="/WEB-INF/jsp/header.jsp"></c:import>  

${msg}
<div class="row container-fluid mt-4" style="background-color:#ebe9ec;">
<div id="user_register" class="col-md-6">
 </div>
 <div class="col-md-6 ">
 		 
                     <form class="p-4 shadow bg-white p-2 mt-4" action="studentregistration" method="post">
                     <h2>Fill The Registration Form</h2>
                <div class="form-group mt-3">
                    <label>Student Name </label>
                    <input type="text" id="fname" name="stuName"  required  class="form-control">
                </div>
                <div class="form-group mt-3">
                    <label>Student Email </label>
                    <input type="email" name="stuEmail"  required  class="form-control" id="email">
                    <small id="checkemail" class="text-danger"></small>
                </div>
                 
                  <div class="form-group mt-3">
                    <label>Student Phone </label>
                    <input type="tel" name="stuPhone"  required  class="form-control">
                </div>
                <div class="form-group mt-3">
                    <label>Student Password</label> 
                    <input type="password" name="stuPassword"  required  class="form-control">
                </div> 
                 <div class="form-group mt-5">
                    <button class="btn btn-success" type="submit">Register</button>
                </div>
            </form>		
 
 </div>
 
</div>

<script>
$(document).ready(function(){
	$("#admin_panel, #sign_up").hide();
	
});
</script>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    -->
    <c:import url="/WEB-INF/jsp/footer.jsp"></c:import>  
  </body>
</html>