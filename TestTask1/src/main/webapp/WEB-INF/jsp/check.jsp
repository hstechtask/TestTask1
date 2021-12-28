<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Hs Group</title>
<link rel = "icon" href = 
"https://c8.alamy.com/comp/2AP4XBT/letter-hs-logo-design-vector-template-initial-linked-letter-hs-vector-illustration-2AP4XBT.jpg"
		type = "image/x-icon"> 

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  
  
  
 <style>footer{position:fixed; bottom:0px; width:100%;}
 .point{cursor:pointer;letter-spacing:1px;transition:letter-spacing 0.5s;}
.point:hover{text-decoration:none; letter-spacing:2px; background-color:orange;border-radius:10px; color:white;}
 
   footer {
      background-color: #474743;
      padding: 25px;
    }           
     pra{
    color: white;
    }      
     .p1 {
  font-family: "Times New Roman", Times, serif;
}  
    </style>

<meta name="viewport" content="width=device-width, initial-scale=1">


</head>

   <script type="text/javascript">
   function gettime() {
	
	   Format formatter = new SimpleDateFormat("dd/MM/yyyy");
       Long date = session.getLastAccessedTime();
       String datenew = formatter.format(date);
}
   alert('datenew');
         
   </script>
   <%   Format formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
       Long date = session.getLastAccessedTime();
       String datenew = formatter.format(date); 
       
       %>
       <%-- session manage --%>
        <c:set var="sessionreg" scope="session" value="${taskd}"/>  
		<c:choose>
		    <c:when test= "${sessionreg=='taskd'}">
		        <script>alert('your task submited succesfully')</script>
		        <% session.setAttribute("taskd", null); %>
		    </c:when>
		<c:otherwise>
		    
		</c:otherwise>
		
		</c:choose>
<body>
<nav class="navbar navbar-expand-lg text-dark" style="background-color:#e9f8ff;box-shadow:0px 1px 10px black;">
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
	
  
				<li id="admin_panel" class="nav-item pr-5 ">  <h3 class="text-success">Student Panel</h3>Welcome &nbsp; ${loginsuccess} &nbsp; <a class='mr-5 pr-5' href="logout">
						
							<i class="fa fa-sign-out" style="font-size:18px; color:red;"></i>
						
					</a>
				</li>
									
		
 
</ul>
	
    </div>
  </div>
</nav>
<script>
		$( window ).on( "load", function() {
			$("#usertable1").show();
		$("#remark1").hide();
		
		
	});
	</script>

<script>  
	$(document).ready(function(){  
    $("#remark").click(function(){  
    	$("#usertable1").hide();
    	$("#remark1").show();
    	$("#remark").addClass(" btn-primary");
    	$("#remark").removeClass("btn-outline-secondary");
    	$("#show_stu_table").addClass("btn-outline-secondary");
    	$("#show_stu_table").removeClass("btn-primary");
    	    
    	
    });  
    $("#show_stu_table").click(function(){  
    	$("#usertable1").show();
    	$("#remark1").hide();
    	$("#show_stu_table").addClass(" btn-primary");
    	$("#show_stu_table").removeClass("btn-outline-secondary");
    	$("#remark").addClass("btn-outline-secondary");
    	$("#remark").removeClass("btn-primary");
    	
    });  
});  
</script>

  <script>  
	$(document).ready(function(){  
    $("#usertable").click(function(){  
    	$("#remark1").hide();
    	$("#usertable1").show();
    	
    });  
});  
</script>
    <div class="container-fluid" style="background-color:#e9f8ff;">
         <div class="row p-3">
         <div class="col-md-3 bg-white shadow pt-2">
         
         
         
            <div> <button class="btn btn-primary w-100" id="show_stu_table">Student View</button></div>
             <div><button class="btn btn-secondary-outline w-100 mt-2" id="remark">Your Remark</button></div>
            
            
         </div>
         <div class="col col-lg-6 " >
               <div id="usertable1">
                   <h3>Submit your Task detail </h3>
                  <form class="bg-white p-2 shadow" action="taskdetail" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                       
                        <input type="hidden" class="form-control" name="username" value="${loginsuccess }"> 
                        </div>
                        <div class="form-group">
                        <label>Task</label>
                        <input type="text" class="form-control" name="task"> 
                        </div>
                        <div class="form-group">
                        <label>Task Detail</label>
                        <textarea rows="3" cols="3" name="taskdetail" class="form-control"></textarea>
                        </div>
                        <div class="form-group">
                        <label>Task submit Timing</label>
                        <input type="text" class="form-control" name="tasktime" value="<%= datenew %>" onkeyup="gettime()" > 
                        </div>
                        <div class="form-control">
                        <input type="file" name="file" >
                        </div>
                        &nbsp;
                        <div class="form-group">
                        <button class="btn btn-success">Submit</button> 
                        </div>
                  </form>    
               </div>
               <div id="remark1" class="bg-white p-2 shadow">
                 <a href="remarkby/${loginsuccess}">click here</a>
                 <h2>${loginsuccess}</h2> 
                <input class="form-control" id="myInput" type="text" placeholder="Search..">
                 
                 <table class="table table-responsive table-hover  table-bordered table-striped tableback" id="myTable">
					<tr style="background-color: #ffca0a;"> <th>Task </th><th>Task Work</th><th>Task Time</th><th>Remark</th></tr>
                 <c:forEach var="handler" items="${modaltask }">
                  <tr> <td>${handler.task }</td><td>${handler.taskdetail }</td><td>${handler.tasktime }</td> <td>${handler.remark }</td></tr>
                   </c:forEach>
                 </table>
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

              </div>
         </div>
             <div class="col col-lg-3">
             
             </div>
         </div>
         <%-- footer --%>
         <div class="row">
             <div class="col col-lg-12">
            <h4>.</h4>
             </div>
         </div>
         
         
         <div class="row">
     <div class="col col-lg-12">
        <footer class="container-fluid text-center">

 <a href="#" class="float-right" style="color: white;text-decoration: none; ">  2020 <i class="far fa-copyright"></i> Hs Group .LTD  All Right reserved</a>
     </footer>
     </div>
     </div>
     
       </div>
     <c:import url="/WEB-INF/jsp/footer.jsp"></c:import>  
</body>
</html>