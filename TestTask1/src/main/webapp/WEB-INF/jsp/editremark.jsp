<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hs Group</title>
<link rel = "icon" href = 
"https://c8.alamy.com/comp/2AP4XBT/letter-hs-logo-design-vector-template-initial-linked-letter-hs-vector-illustration-2AP4XBT.jpg"
		type = "image/x-icon"> 

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
<style>
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: red;
  color: white;
  text-align: center;
}
</style>
</head>
<body>
 <div style="box-shadow:0px 2px 8px black;z-index:20000;"><c:import url="/WEB-INF/jsp/header.jsp"></c:import> </div> 
    <div class="container-fluid mt-2 p-3" style="background-color:#ebe9ec;">
       <%--   <div class="row">
             <div class="col col-lg-12">
             <div class="" style=" background-color: #ebe9ec;">
                   <h2 style="text-align: center;">Welcome to HS Group</h2>
                   <p style="text-align: center;"> Student Panel </p>
                   <h4 style="text-align: center;"> ${loginsuccess } </h4>
             </div>
             </div>
         </div> --%>
          
         <div class="row">
              <div class="col col-lg-3">
              
              </div>
               <div class="col col-lg-6 bg-white shadow p-3" style="border-radius:8px;" >
                    <h3>Send Remark by Email </h3>
                    <c:forEach var="student" items="${handlers}">
                  <form action="/TestTask1/sendemail" method="post">
                        <div class="form-group mt-2">
                        <label>Sr No.</label>
                        <input type="text" class="form-control" name="id" value="${student.id }"> 
                        </div>
                        <div class="form-group mt-2">
                        <label>Task</label>
                        <input type="text" class="form-control" name="task" value="${student.task }"> 
                        </div>
                        <div class="form-group mt-2">
                        <label>Task Detail</label>
                        <textarea rows="3" cols="3" name="taskdetail" class="form-control">${student.taskdetail }</textarea>
                        </div>
                        <div class="form-group mt-2">
                        <label>Task submit Timing</label>
                        <input type="text" class="form-control" name="tasktime"  value="${student.tasktime }" > 
                        </div>
                        <div class="form-group mt-2">
                        <label>Username</label>
                        <input type="text" class="form-control" name="username"  value="${student.username }" > 
                        </div> 
                        <div class="form-group mt-2">
                        <label>Remark</label>
                        <textarea rows="3" cols="3" name="remark" class="form-control"></textarea>
                        </div>
                        <div class="form-group mt-2">
                        <button class="btn btn-success">Submit</button> 
                        </div>
                  </form>   
                  </c:forEach> 
              </div>
               <div class="col col-lg-3">
              
              </div>
         </div>
     </div>
     <script type="text/javascript">
     $(document).ready(function(){
    	 $("#home, #sign_up, #login, #admin_login").hide();
     });
     </script>
</body>
</html>