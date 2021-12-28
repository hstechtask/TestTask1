<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel = "icon" href = "https://c8.alamy.com/comp/2AP4XBT/letter-hs-logo-design-vector-template-initial-linked-letter-hs-vector-illustration-2AP4XBT.jpg"
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
</style>
  </head>
  <body>
  <c:import url="/WEB-INF/jsp/header.jsp"></c:import>  
${msg}
<%--   <c:import url="page2"></c:import> --%>
   
<div class="container-fluid">
<div class="row">
         <div class="col-md-12" style="height:85vh; background-size:cover;background-image:url('${pageContext.request.contextPath}/assets/image/stuwallppr.jpeg');"> 
             <%--  <img src="${pageContext.request.contextPath}/assets/image/stuwallppr.jpeg" style="width: 100%; height:90vh;" > --%>
       <div class="text-white;p-3 pr-5 pl-5 text-center" style="margin-top:100px; text-shadow:0 0 5px black;"> 
         <h2 class="text-white">We are team that develope students and create their future bright and fill them with knowledge.</h2>
       </div>
         <div class="row mt-5 p-2">
         <div class="col-md-2">
         </div>
         <div style="background-color:rgba(255,255,255,0.8);padding:10px;border-radius:10px; box-shadow:0 0 10px white;" class="col-md-4 ">
         <div >
        <h2><center>Courses</center></h2>
        <h4><i class="fa fa-laptop" style="font-size:24px"></i> JAVA</h4>
        <h4><i class="fa fa-laptop" style="font-size:24px"></i> Spring MVC</h4>
        <h4><i class="fa fa-laptop" style="font-size:24px"></i> Spring BOOT</h4>
        <h4><i class="fa fa-laptop" style="font-size:24px"></i> Angular</h4>
        <h4><i class="fa fa-laptop" style="font-size:24px"></i> Python</h4>
      <B style="text-shadow:1px 1px 5px white;;">Know More About us At <a href="https://www.hsgroupngp.co.in/">www.hsgroupngp.co.in</a></B>  
     
         
         </div>
         </div>
         <div class="col-md-6">
         </div>
         
         </div>
         
         </div>
</div>
  
     </div>
     
 <!-- Modal -->

  
     
<div id="register_frm" class="m-4 p-4 shadow">
<div class="text-end"><b style="font-size:30px;" id="close_btn" class="point">X</b></div>
<div class="text-center" ><h3 >Add Student</h3></div>
<form action="saveStudent" method="post">
<label class="frm_elements" >ID</label>
<input readonly class="frm_elements" id="new_id" type="number" >
<lable class="frm_elements">Student Name</lable>
<input class="frm_elements frm_input" type="text" name="stu_name" required  placeholder="Enter Student Name">
<label class="frm_elements">Age</label>
<span id="prompt_msg"></span>
<input class="frm_elements frm_age" required type="number" name="stu_age" placeholder="Enter Student Age">
<label class="frm_elements">Address</label>
<input class="frm_elements  frm_input" type="text" name="stu_address" placeholder="Enter Student Address">
<label class="frm_elements">password</label>
<input class="frm_elements" id="psw" type="password" name="stu_password" placeholder="Enter password">
<span id="psw_msg"></span>
<label class="frm_elements">Re-type Password</label>
<input class="frm_elements frm_psw" type="password" placeholder="Retype password">
<button class="frm_elements" type="submit">Save</button>
</form>
</div>

<div id="login_frm" class="p-4 m-5 shadow">
<div class="text-end"><b style="font-size:30px;" id="login_close" class="point">X</b></div>
<div class="text-center" ><h3 >Login Student</h3></div>
<form action="student_login" method="post">
<lable class="frm_elements">Enter User Id</lable>
<input class="frm_elements" name="id" type="number" placeholder="User Id" >
<label class="frm_elements">Password</label>
<input class="frm_elements" name="stu_password" type="password" placeholder="Password">
<button class="frm_elements"  type="submit">Log In</button>
</form>
</div>





<div id="emp_register_frm" class="m-4 p-4 shadow">
<div class="text-end"><b style="font-size:30px;" id="close_btn" class="point">X</b></div>
<div class="text-center" ><h3 >Add Employee</h3></div>
<form action="saveStudent" method="post">
<label class="frm_elements" >ID</label>
<input disabled class="frm_elements" id="new_id" type="number" >
<lable class="frm_elements">Student Name</lable>
<input class="frm_elements frm_input" type="text" name="stu_name" required  placeholder="Enter Student Name">
<label class="frm_elements">Age</label>
<span id="prompt_msg"></span>
<input class="frm_elements frm_age" required type="number" name="stu_age" placeholder="Enter Student Age">
<label class="frm_elements">Address</label>
<input class="frm_elements  frm_input" type="text" name="stu_address" placeholder="Enter Student Address">
<label class="frm_elements">password</label>
<input class="frm_elements" id="psw" type="password" name="stu_password" placeholder="Enter password">
<span id="psw_msg"></span>
<label class="frm_elements">Re-type Password</label>
<input class="frm_elements frm_psw" type="password" placeholder="Retype password">
<button class="frm_elements" type="submit">Save</button>
</form>
</div>

<div id="emp_login_frm" class="p-4 m-5 shadow">
<div class="text-end"><b style="font-size:30px;" id="login_close" class="point">X</b></div>
<div class="text-center" ><h3 >Login Employee</h3></div>
<form action="student_login" method="post">
<lable class="frm_elements">Enter User Id</lable>
<input class="frm_elements" name="id" type="number" placeholder="User Id" >
<label class="frm_elements">Password</label>
<input class="frm_elements" name="stu_password" type="password" placeholder="Password">
<button class="frm_elements"  type="submit">Log In</button>
</form>
</div>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>
<script type="text/javascript">
$(document).ready(function(){
	$("#admin_panel").hide();
	$("#new_id").val($("#max_id").val());
	$("#register_frm").hide();
	$("#login_frm").hide();
	$("#emp_register_frm").hide();
	$("#emp_login_frm").hide();
	
	$("#add_emp").click(function(){
		$("#emp_register_frm").show(200);
		$("#emp_login_frm").hide();
		$("#login_frm").hide(200);
		$("#register_frm").hide(100);
	});
	
	
	$("#emp_login").click(function(){
		$("#emp_register_frm").hide(200);
		$("#emp_login_frm").show(200);
		$("#login_frm").hide(200);
		$("#register_frm").hide(100);
		
	});
	
	
	$("#student_login").click(function(){
		$("#login_frm").show(200);
		$("#register_frm").hide(100);
		$("#emp_register_frm").hide(200);
		$("#emp_login_frm").hide(200);
	});
	$("#login_close").click(function(){
		$("#login_frm").hide(200);
	});
	$('#add_student').click(function(){
		$("#register_frm").show(200);	
		$("#login_frm").hide(100);
		$("#emp_register_frm").hide(200);
		$("#emp_login_frm").hide(200);
	});
	
	$("#close_btn").click(function(){
		$("#register_frm").hide(200);			
	});
	
	$(".frm_input").keyup(function(){
	text = $(this).val().toUpperCase();
	console.log(text);
	$(this).val(text);
	});
	
	$(".frm_age").keyup(function(){
		age = $(this).val();
		if(age < 15 || age > 25)
			{
			$("#prompt_msg").text("! Age should be between 15 to 25 !!");
			$("#prompt_msg").css("color","red");
			}
		else
			{
			$("#prompt_msg").text("");
			$("#prompt_msg").css("color","red");
			}
	});
	
	$(".frm_psw").keyup(function(){
		console.log("psw key pressed ");
		console.log($("#psw").val());
		console.log($(".frm_psw").val());
		
		if($("#psw").val() == $(".frm_psw").val())
			{
			console.log("password matched ");
			$("#psw_msg").text("password matched");
			}
		else
			{
			console.log("password not mathing  ");
			$("#psw_msg").text("password not matching...");
			$("#psw_msg").css("color","red");
			}
		
	});
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