<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verify first</title>
<style>
#wrapper {
	font-family: Lato;
	font-size: 1.5rem;
	text-align: center;
	box-sizing: border-box;
	color: #333; # dialog { border : solid 1px #ccc;
	margin: 10px auto;
	padding: 20px 30px;
	display: inline-block;
	box-shadow: 0 0 4px #ccc;
	background-color: #FAF8F8;
	overflow: hidden;
	position: relative;
	max-width: 450px; h3 { margin : 0 0 10px;
	padding: 0;
	line-height: 1.25;
}

span {
	font-size: 90%;
}

#form {
	max-width: 240px;
	margin: 25px auto 0; input { margin : 0 5px;
	text-align: center;
	line-height: 80px;
	font-size: 50px;
	border: solid 1px #ccc;
	box-shadow: 0 0 5px #ccc inset;
	outline: none;
	width: 20%;
	transition: all .2s ease-in-out;
	border-radius: 3px; &: focus { border-color : purple;
	box-shadow: 0 0 5px purple inset;
}

&
::selection {
	background: transparent;
}

}
button {
	margin: 30px 0 50px;
	width: 100%;
	padding: 6px;
	background-color: #B85FC6;
	border: none;
	text-transform: uppercase;
}

button { &.close { border:solid2px;
	border-radius: 30px;
	line-height: 19px;
	font-size: 120%;
	width: 22px;
	position: absolute;
	right: 5px;
	top: 5px;
}

div {
	position: relative;
	z-index: 1;
}

img {
	position: absolute;
	bottom: -70px;
	right: -63px;
}

}
}
input[type=text] {
	border: none;
	border-bottom: 2px solid red;
	height: 20px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="banner"
			style="height: 90px; width: 100%; box-sizing: border-box; background: linear-gradient(to right, #ccffff 0%, #ffffff 100%);">
			<div
				style="float: left; height: 80px; width: 70px; margin-top: 10px; margin-left: 10px">
				<img alt="logo"
					src="${pageContext.request.contextPath}/resources/images/bannerlogo.png"
					height="80px" width="90px">

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

		<div id="dialog">
			<p>${msgs}</p>
			<h3>Please enter the 4-digit verification code we sent via SMS:</h3>
			<span>(we want to make sure it's you before we contact our
				movers)</span>
<!-- pattern="\d{6} -->
			<form action="verifyOtp">

				<input type="text" size="20" maxlength="10" 
					name="otp" required="required" 
					style="height: 25px; border-bottom: 2px solid red;"> <input
					type="submit" value="Verify"
					style="background-color: blue; width: 100px; color: white; padding: 4px; text-align: center; text-decoration: none; display: inline-block; font-size: 20px; margin: 4px 2px; cursor: pointer;">

			</form>

			<div>
				Didn't receive the code?<br /> <a href="/otp">Send code again</a><br />
				<a href="#">Change phone number</a>

			</div>
</body>
</html>