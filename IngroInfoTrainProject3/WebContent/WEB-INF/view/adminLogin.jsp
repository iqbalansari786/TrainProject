<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>train home page</title>

<meta charset="utf-8">
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminlogin.css" />

<style>
.field-icon {
	float: right;
	/*  margin-left:-1px;  */
	margin-right: 54px;
	font-size: 20px;
	margin-top: -40px;
	position: relative;
	z-index: 2;
}

.error {
	color: red;
}
</style>
</head>
<body style="border: none">

	<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

%>

	<div id="wrapper">
		<div id="banner"
			style="height: 90px; width: 100%; box-sizing: border-box; background: linear-gradient(to right, #ccffff 0%, #ffffff 100%);">
			<div
				style="float: left; height: 80px; width: 70px; margin-top: 10px; margin-left: 10px">
				<img alt="logo"
					src="${pageContext.request.contextPath}/resources/images/bannerlogo.png">

			</div>
			<div
				style="float: right; width: 90%; height: 60px; margin-right: 70px">
				<h1
					style="position: relative; bottom: 7px; font-family: sanf; color: #000; font-size: 40px">Online
					TrainBooking Site</h1>
				<h2
					style="position: relative; font-family: sanf; color: purple; font-size: 20px; bottom: 40px">Make
					our life more digital compare to past..</h2>
			</div>

		</div>

		<div style="height: 500px; width: 40%; float: left; margin-top: 50px">

			<div class="login-form"
				style="background: #fff; margin-left: 15%; margin-top: 30px">
				<img
					src="${pageContext.request.contextPath}/resources/images/user.png"
					style="margin-right: 120px;">


				<form:form action="adminpage" modelAttribute="adminvalue">
					
					<ul class="list">
						<li><h2>Admin Login</h2></li>

						<li><form:input type="text" placeholder="Admin email"
								path="username" id=" username" maxlength="20" /><form:errors path="username" cssClass="error" /></li>
						
						<span id="name" class="error"></span>
						<li><form:input type="password" placeholder="..............."
								path="password" id="password-field" maxlength="20" /><form:errors path="password" cssClass="error"></form:errors></li>
						<span id="password" class="error"></span>
						<span toggle="#password-field"
							class="fa fa-fw fa-eye field-icon toggle-password"></span>
						
						<li><input type="submit" value="login" class="btLogin" /></li>

						<li style="margin-left: 55px"><a href="#"
							style="color: #000; margin-right: 80px" data-toggle="modal"
							data-target="#Modal">Forget Password?</a></li>
						<li style="color: red">${message}</li>

					</ul>
				</form:form>
			</div>
		</div>
		<div class="innersection"
			style="width: 60%; height: 506px; margin-left: 600px; margin-top: 70px; box-sizing: border-box;">
			<div class="leftSection" style="height: 200px; width: 100%;">
				<div class="liststyle" style="float: right;">
					<img
						src="${pageContext.request.contextPath}/resources/images/adminLoginLogo.jpg">
				</div>
				<div
					style="float: left; height: 150px; width: 500px; padding-left: 80px">
					<h1
						style="font-family: sans-serif; top: 30px; font-size: 40px; font-weight: bold; text-align: justify;">
						We Provide Smart<br> way of booking train
					</h1>
				</div>

			</div>

			<div class="middlenavbar" style="width: 100%; height: 210px;">
				<div class="home"
					style="height: 200px; width: 200px; border: solid red; float: left; margin-left: 100px; border-radius: 50%; box-shadow: 20px 20px 50px grey;">

					<a href="home"><img
						src="${pageContext.request.contextPath}/resources/images/homebutton.png"
						style="height: 200p; width: 200px; border-radius: 50%;"></a>

				</div>
				<div class="moreinfo"
					style="height: 200px; width: 200px; border: solid red; float: right; margin-right: 55px; border-radius: 50%; box-shadow: 20px 20px 50px grey;">
					<a href="aboutus"> <img
						src="${pageContext.request.contextPath}/resources/images/aboutus.png"
						style="height: 200p; width: 200px; border-radius: 50%;"></a>
				</div>


			</div>

		</div>

	</div>
	<!-- ..............forgetPassword.................. -->
	<div class="modal" id="Modal" style="margin-top: 100px">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Forget password</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" style="display: inline">

					<form action="forgetAdminpassword">
						<input type="text" name="username" placeholder="Enter username"
							required="required" style="margin-right: 50px" /> <input
							type="text" name="email" placeholder="Enter your email"
							required="required" />
						<div style="margin-top: 10px">
							<input class="btn btn-success" type="submit" value="submit"
								style="float: left; margin-left: 20px" />
							<button type="button" class="btn btn-danger" data-dismiss="modal"
								style="float: right; margin-right: 20px">Close</button>
						</div>
					</form>
				</div>





			</div>
		</div>
	</div>
	<div style="margin-top: 25px">
		<%@ include file="../MainPage/footer.jsp"%>
	</div>

	</div>
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