<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>train home page</title>

<meta charset="utf-8">
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href=${pageContext.request.contextPath}/resources/images/slider.jpg" sizes="16x16">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

  <style>
  
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  .error{
  color:red;
  }
  .field-icon {
  float:right;
  /*  margin-left:-1px;  */
  margin-right:54px;
  font-size:20px;
  margin-top: -40px;
  position: relative;
  z-index: 2;
} 
  .error{
  color:red;
  }
  </style>

</head>
<body style="border:none;box-sizing: border-box;">

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

%>
	<div id="wrapper" style="border:none;">
		<div>
			<%@ include file="../MainPage/header.jsp"%>
		</div>
	<div>
			<%@ include file="../MainPage/homeHeader.jsp"%>
		</div>
 
		<div class="maincontainer">
			<div class="login-form" style="background: #fff;margin-top:59px">
				<img
					src="${pageContext.request.contextPath}/resources/images/user.png"
					style="margin-right: 120px;">

 <!--  -->
<!-- onsubmit="return Validation()" -->
            <form:form action="loginintoUserPage"  modelAttribute="loginformvalue" onsubmit="return Validation()" method="POST">
					<ul class="list">
						<li><h2>User Login</h2></li>
						<li style="color: red">${loginError}</li>
						

						<li><form:input type="text" placeholder="User Email"
								path="email" id="username" maxlength="20" />
								</li>
								<form:errors path="email" cssClass="error" />
						      <span id="name" class="error"></span>
					<li><form:input type="password" placeholder="..............."
						path="password" id="password-field"  maxlength="20" name="password" /></li>
						 <form:errors path="password" cssClass="error" />
						 <span id="password" class="error"></span>  
				
                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                        
						<li><input type="submit" value="login" class="btLogin" class="submits"/> </li>
						<li style="margin-left:1px"><a href="forgetpassword"
							style="color: #000;" data-toggle="modal" data-target="#Modal">Forget Password?</a></li>
						<li style="margin-left: 1px"><a href="#"
							style="color: #000;" data-toggle="modal" data-target="#myModal">Get
								Register..</a></li>
								<li style="margin-left: 1px;color:red"> ${userlogin}</li>
				
					</ul>
				</form:form>
			</div>



			<div class="w3-content w3-display-container"
				style="position: absolute; height: 320px; width: 720px; left: 400px;top:280px;box-sizing: border-box;">
				
				<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000" data-pause="hover">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" >
      <div class="item active">
        <img src="${pageContext.request.contextPath}/resources/images/newslider3.jpg" alt="Chania"  height="100%">
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/newslider3.jpg" alt="Chania"  height="100%" >
      </div>
    
      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/newslider3.jpg" alt="Flower" width="100%" height="100%;">
      </div>

     
    </div>


  </div>
			
			</div>
		


			<div class="findtrain" style="background: #fff;margin-top: 50px">
				<!-- <img src="images/user.png"> -->
				<form:form action="gotofindtrainpage"  modelAttribute="findtrainvalue" onsubmit="return findtrainvalidation()">
					<ul class="list">
						<li><h2>Find Train</h2></li>


						<li><form:input placeholder="From Place" path="fromplace" id="from" maxlength="20" /></li>
							<span id="From" class="error"></span>
						<li><form:input placeholder="To Place" path="to" id="to" maxlength="20" /></li>
							<span id="To" class="error"></span>
					
							<form:input path="trainDate" type="date" placeholder="Date"  id="date" style="margin-right:22px;margin-bottom:8px" />
							<p id="Date" class="error"></p>
						<!-- <label for="class-select">Choose Classes:</label> -->
						
		<%-- 				<li> <form:select
								path="classes"   items="${classes}" id="classes"  style="font-family:sans-serif; width:200px;
         height:45px;
         margin-top:10px;
         margin-bottom:-5px;
         padding: 2px 16px;
           box-sizing: border-box;
           background-color:#e3e6e4"/>
           
        
           </li> --%>
									<span id="Classes" class="error"></span>
						
               			<!-- 	<li><div class="g-recaptcha" data-sitekey="6LdE57cUAAAAAH3fO3ilWFf1HlzEBVsMMKnA7JPP"></div></li> -->
						<li><input type="submit" value="Find Train" class="btLogin" /></li>


					</ul>
				</form:form>
			</div>

<!-- .............findtrain,.............. -->

			<!-- The Modal -->
			<div class="modal" id="myModal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">Registration page</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<%@ include file="../MainPage/registration.jsp"%>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal" style="font-size: 15px">Close</button>
						</div>

					</div>
				</div>
			</div>
			<!--   ......................forgot password............... -->
			<div class="modal" id="Modal" style="margin-top: 100px">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">Forget password</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body" style="height: 100px">
							
							<form:form action="forgetpassword" modelAttribute="forgetvalue">
							<form:input type="text" path="firstname" placeholder="Enter username" required="required" style="margin-right:50px;width:200px;"/>
							<form:input type="text" path="email" placeholder="Enter your email" required="required" style="width:200px;" />
							<div style="margin-top: 10px">
							<input class="btn btn-success" type="submit" value="submit" style="float: left;margin-left: 26px;font-size: 15px;"/>
							<button type="button" class="btn btn-danger" data-dismiss="modal" style="float: right;margin-right: 26px;font-size: 15px">Close</button>
							</div>
							</form:form>
						</div>

						<!-- Modal footer -->
						

					</div>
				</div>
			</div>
			


		</div>
		<div style="margin-top:40px">
			<%@ include file="../MainPage/footer.jsp"%>
		</div>
	</div>


 	<script>
		function Validation() {
			var name = document.getElementById('username').value;
			var pass = document.getElementById('password-field').value;
			if(name == null || name==""){
				document.getElementById('name').innerHTML=" ** Enter User Email Id";
				return false;
			}else if( name.indexOf('@') <= 0){
					document.getElementById('name').innerHTML=" ** Enter Valid Email";
				return false;
				 }
			 else if( ((name.charAt(name.length-4) != ".") && ((name.length-3) != "."))){
					document.getElementById('name').innerHTML=" ** Invalid  Email";
				return false;
				 }
			 else{
				 document.getElementById('name').innerHTML="";
			 }

	
			if (pass == null || pass == "") {
				document.getElementById('password').innerHTML = " ** Enter Your Password";
				return false;
			} else {
				document.getElementById('password').innerHTML = "";
			}
		}
		</script>
		<script>
		function findtrainvalidation() {
			var fromplace = document.getElementById('from').value;
			 var numbers = /^[0-9]+$/;
			var to = document.getElementById('to').value;
			var dateoftrain=document.getElementById("date").value;

			if (fromplace == null || fromplace == "") {
				document.getElementById('From').innerHTML = " ** Please enter from";
				return false;
			} 
			 else if(fromplace.match(numbers)) {
					document.getElementById('From').innerHTML = "plz String only";
					return false;
				}
			else {
				document.getElementById('From').innerHTML = "";
			}

			if (to == null || to == "") {
				document.getElementById('To').innerHTML = " ** Enter destination";
				return false;
			}else if(to.match(numbers)) {
				document.getElementById('From').innerHTML = "plz String only";
				return false;
			}
			 else {
				document.getElementById('To').innerHTML = "";
			}
			if (dateoftrain == null || dateoftrain == "") {
				document.getElementById('Date').innerHTML = " ** Enter date";
				return false;
			} else {
				document.getElementById('Date').innerHTML = "";
			}
				
		}
	</script>

<script>
$(".toggle-password").click(function() {


  $(this).toggleClass("fa-eye fa-eye-slash");
	  var input = $($(this).attr("toggle"));
	  if (input.attr("type") == "password") {
	    input.attr("type", "text");
	  } else {
	    input.attr("type", "password");
	  } 
	});
</script>
</body>
</html>