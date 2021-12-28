<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head><link rel = "icon" href = 
"https://c8.alamy.com/comp/2AP4XBT/letter-hs-logo-design-vector-template-initial-linked-letter-hs-vector-illustration-2AP4XBT.jpg"
		type = "image/x-icon"> 
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>	
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <title>Hello, world!</title>
<style type="text/css">.row-flex {
  display: flex;
  flex-wrap: wrap;
}

.navbar{box-shadow:0 0 15px black;}
.frm_elements{width:100%;padding:5px;margin:5px;}
.shadow{box-shadow:0 1px 12px black;}
.point{cursor:pointer;letter-spacing:1px;transition:letter-spacing 0.5s;}
.point:hover{letter-spacing:2px;text-shadow:0 0 5px black; background-color:orange;border-radius:10px; color:white;}
footer{position:fixed; bottom:0px; width:100%;}

</style>
  </head>
  <body >
  <c:import url="/WEB-INF/jsp/header.jsp"></c:import>  
${msg}
<div class="container-fluid mt-0 pt-0" style="background-color:#ebe9ec;">
<div class="row mt-0 pl-4  row-flex">
<div class="col-md-3 p-4 htt ">
		<div class="row row-flex p-2 h-100 bg-white shadow">
			<div class="col-md-12">
			<div><button class="btn btn-outline-primary w-100 mt-2" id="usertable">Student Task View</button></div>
			<div><button class="btn btn-outline-secondary w-100 mt-2" id="remark">Send Your task</button></div>
			<!-- <div><button></button></div> -->
			
			 <!-- <li class="active" ><a href="#"></a></li>
             <li><a href="#"></a></li>
               <li><a href="#" id="sendtask"> </a></li> -->
            
			</div>
		</div>
</div>
<div class="col-md-9 p-4 h-100 ">
	<div class="row bg-white p-2 shadow">
							<div class="col-md-12">
									<div id="usertable1">
										<input class="form-control w-100 mb-2" id="myInput" type="text"
											placeholder="Search..">
										<table
											class="table table-responsive table-hover  table-bordered table-striped tableback"
											id="myTable">
											<tr style="background-color: #ffca0a;">
												<th>Sr no.</th>
												<th>Task</th>
												<th>Task Work</th>
												<th>Task Time</th>
												<th>Username</th>
												<th>filename</th>
												<th>View Image</th>
												<th>Remark</th>
												<th>Delete</th>
											</tr>
											<c:forEach var="handler" items="${task }">
												<tr>
													<td>${handler.id }</td>
													<td>${handler.task }</td>
													<td>${handler.taskdetail }</td>
													<td>${handler.tasktime }</td>
													<td>${handler.username }</td>
													<td><a>
															<form action="viewimage/${handler.filename }">
																<button type="submit" class="btn btn-success">
																	<i class="fa fa-eye" style="font-size:24px"></i>
																</button>
															</form>
													</a></td>
													<td><img alt="img"
														src="http://localhost:8080/upl/${handler.filename }"
														width="100" height="100"></td>
													<td><a href="editremark/${handler.id }">
															<button class="btn btn-success">
																<i class="fa fa-comments" aria-hidden="true"></i>
															</button> <%--  --%>
													</a></td>
													<td><a href="deleteremark/${handler.id }"
														class="btn btn-danger"><i class="fa fa-trash-o" style="font-size:25px"></i></a></td>
												</tr>
											</c:forEach>
										</table>
				
				
				
				
									</div>
						<div id="remark1">

							<div class="row">
								<div class="col-md-5 p-3">
								
																<h5>${loginsuccess }:SendYour Task</h5>
										
										
																<div class=" bg-dark text-white p-3">
											<!--***************************************************************************-->
																	<div class="container-fluid">
																		<form action="sendEmailAttachment" method="post"
																			enctype="multipart/form-data">
																			<div class="form-group mt-2">
																				<label> TO </label> <input type="text" name="to"
																					class="form-control">
																			</div>
										
																			<div class="form-group mt-2">
																				<label> Subject </label> <input type="text" name="subject"
																					class="form-control">
																			</div>
										
																			<div class="form-group mt-2">
																				<label> Message </label>
																				<textarea rows="10" cols="3" class="form-control"
																					name="message"></textarea>
																			</div>
																			<div class="form-group mt-2">
																				<label>Attach File </label> <input type="file" name="file"
																					class="form-control">
																			</div>
																			<div class="form-group mt-5">
																				<button class="btn btn-success" type="submit">Send
																					Email</button>
																			</div>
																		</form>
																	</div>
																	<!-- *************************************************-->
										
										
																</div>
								
								</div>
								<div class="col-md-7 p-2">
									<div class="row bg-light" id="username">
                     <div class="col col-lg-12">
                    
                      <table class="table table-responsive table-hover  table-bordered table-striped tableback" class="container" id="myTable3" class="table table-striped">
					<thead>
					<tr style="background-color: #ffca0a;"> <th>Username</th></tr>
					</thead>
					<tbody>
             <c:forEach var="handler" items="${task2 }">
                  <tr> <td> ${handler.stuEmail }</td> </tr>
                   </c:forEach>
                   
                   </tbody>
                  
             </table>
            
                     </div>
                     
                 </div>
								</div>
							</div>


						</div>



					</div>
		</div>
</div>

</div>

</div>









    <c:import url="/WEB-INF/jsp/footer.jsp"></c:import> 
             <script>
$(document).ready(function(){
  $("#myInput1").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable1 tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
    <script>
$(document).ready(function(){
  //  $('#myTable3').dataTable();
});
</script>   
           <script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
      <script>
		$( window ).on( "load", function() {
			$("#usertable1").show();
		$("#remark1").hide();
		$("#sendtask1").hide();
		$("#username").hide();
	});

	$(document).ready(function(){  
    $("#remark").click(function(){ 
    	 $("#remark").addClass("btn-primary");
    	 $("#remark").removeClass("btn-outline-secondary");
    	 $("#usertable").addClass("btn-outline-secondary");
    	 $("#usertable").removeClass("btn-primary");
    	$("#usertable1").hide();
    	$("#remark1").show();
    	$("#username").show();
    	$("#sendtask1").hide();
    });  
});  

	$(document).ready(function(){  
    $("#sendtask").click(function(){  
    	$("#remark1").hide();
    	$("#usertable1").hide();
    	$("#sendtask1").show();
    	$("#username").hide();
    });  
});  

	$(document).ready(function(){  
		$("#usertable").addClass("btn-primary");
    	$("#usertable").removeClass("btn-outline-primary");
		
    $("#usertable").click(function(){ 
    	$("#usertable").addClass("btn-primary");
    	$("#usertable").removeClass("btn-outline-primary");
    	 $("#remark").addClass("btn-outline-secondary");
    	 $("#remark").removeClass("btn-primary");
    	
    	
    	$("#remark1").hide();
    	$("#usertable1").show();
    	$("#sendtask1").hide();
    	$("#username").hide();
    });  
});  
</script>
<script type="text/javascript">
$(document).ready(function(){
    var maxField = 10; //Input fields increment limitation
    var addButton = $('.add_button'); //Add button selector
    var wrapper = $('.field_wrapper'); //Input field wrapper
    var fieldHTML = '<div><input type="text" name="to" class="form-control" value=""/><a href="javascript:void(0);" class="remove_button">&nbsp;&nbsp;Remove</a><br></div>'; //New input field html 
    var x = 1; //Initial field counter is 1
    
    //Once add button is clicked
    $(addButton).click(function(){
        //Check maximum number of input fields
        if(x < maxField){ 
            x++; //Increment field counter
            $(wrapper).append(fieldHTML); //Add field html
        }
    });
    
    //Once remove button is clicked
    $(wrapper).on('click', '.remove_button', function(e){
        e.preventDefault();
        $(this).parent('div').remove(); //Remove field html
        x--; //Decrement field counter
    });
});
$("#home, #sign_up, #login, #admin_login").hide();
</script>
	 
   
  </body>
</html>