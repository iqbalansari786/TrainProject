<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style>
input {
	width: 600px;
}

td {
	font-family: sans-serif;
	font-size: 20px;
}

.container {
	padding: 16px;
	background-color: white;
}

.signin {
	background-color: #f1f1f1;
	text-align: center;
}
</style>
</head>
<body>
	<div class="container" style="width: 100%; margin: auto;">

		<p class="text-center" style="font-size: 25px;">The form is
			mandatory to fill...</p>

		<form:form action="registeringprocess"
			onsubmit="return RegistrationValidation()" method="post"
			modelAttribute="regvalue" enctype="multipart/form-data" id="theform">
			<p>${msg}</p>
			<table class=" text-left table-borderless table-condensed  align="center">
				<form:hidden path="id" />

				<tr>
					<td>First Name:</td>
					<td><form:input path="firstname" id="name" maxlength="20" /></td>
					<td><form:errors path="firstname" cssClass="error" /></td>
					<!-- <td><span id="Firstname" class="error"></span></td> -->

				</tr>
				<tr>
					<td>Last Name:</td>
					<td><form:input path="lastname" id="lastname" maxlength="20" /></td>
					<td><span id="Lastname" class="error"></span></td>
				</tr>
				<tr>
					<td>Enter Email:</td>
					<td><form:input path="email" id="emails" maxlength="30" /><span
						id="Email" class="error"></span></td>

				</tr>


				<tr>
					<td>Enter password:</td>
					<td><form:password path="password" id="password" tabindex="1" /></td>
					<td><span id="Password" class="error"></span></td>
				</tr>
				</tr>
				<tr>
					<td>Enter confirm password:</td>
					<td><form:password path="confirmPassword"
							id="confirm_password" onChange="checkPasswordMatch();" /></td>
					<td><span class="registrationFormAlert"
						id="divCheckPasswordMatch"></span></td>
				</tr>



				<tr>
					<td>Enter Nationality:</td>
					<td><form:input path="Nationality" id="nationality"
							maxlength="20" /></td>
					<td><span id="Nationality" class="error"></span></td>

				</tr>
				<tr>
					<td>Enter Address:</td>
					<td><form:textarea path="address" id="address" maxlength="50"
							style="width:600px;" /></td>
					<td><span id="Address" class="error"></span></td>
				</tr>

				<%-- <tr>
				
					 <td>Gender:</td>
					<td><form:radiobutton path="gender" value="Male" label="Male"/>
						<form:radiobutton path="gender" value="Female" label="Female" /></td>
					<td><form:errors path="gender" cssClass="error" /></td> 

				</tr> --%>
				<tr>
					<td>Select IdProof:</td>
					<td><form:select path="idProof" items="${idproof}"
							id="idproof"
							class="browser-default custom-select custom-select-lg mb-3"
							style="font-family:sans-serif; width:600px;
           						 height:40px; 
						          padding: 2px 16px;
						           box-sizing: border-box;">

						</form:select></td>

					<td><span id="Idproof" class="error"></span></td>

				</tr>
				<tr>
					<td colspan="2">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroupFileAddon01"
									style="font-style: sans-serif; font-size: 20px;">Attachment</span>
							</div>
							<div class="custom-file">
								<input type="file" name="file" class="custom-file-input"
									id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" required="required"
									style="height: 40px"> <label class="custom-file-label"
									for="inputGroupFile01" style="height: 40px">Choose file</label>
							</div>
						</div>
					</td>
					<!-- <td>Attachement:</td>
					<td><input name="file" id="fileToUpload" type="file"
						id="photo"
						style="font-family: sans-serif; width: 180px; height: 30px; padding: 2px 16px; box-sizing: border-box;" /></td> -->

				</tr>
				<!-- pattern="[7-9]{1}[0-9]{9}"
							title="Phone number with 7-9 and remaing 9 digit with 0-9"
							required="required"  -->
				<tr id="phone_no">
					<td>Enter Phone no:</td>
					<td><form:input path="mobile" id="mobile" type="Number" /></td>
					<td><span><button class="btn btn-primary" id="sendotp" style="margin-left:-64px;height: 34px;">send otp</button></span></td>

				</tr>
				<!-- 	pattern="\d{6}"
						title="sry plz valid otp" required="required"  -->
				<tr id="phone_no1" style="display: none">
					<td>Enter OTP:</td>
					<td><input type="text" name="otp" id="otpvalue"
						style="width: 200px;" /> <span><p>${msgs}</p></span> <a
						id="verify" href="#">Verify</a>|
						<a href="#" id="change">Change number</a>
						<!-- <button class="btn" id="change">Change number</button> --></td>

				</tr>


				<tr>
					<td></td>

					<td>
						<div class="input-prepend">
							<span class="add-on"><i class="icon-user icon-white"></i></span>
							<input type="submit" class="btn-primary" value="Register"
								id="submit">
						</div>
				</tr>

				<tr>
					<td colspan="2">
						<div class="container signin">

							<p>
								Already have an account? <a href="home">Sign in</a>.
							</p>
						</div>
					</td>

				</tr>
			</table>
		</form:form>

	</div>
	<script>
		function RegistrationValidation() {
			var numbers = /^[0-9]+$/;
			var password = $("#password").val();
			var confirmPassword = $("#confirm_password").val();

			var mobileno = document.getElementById('mobile').value;
			var names = document.getElementById('name').value;
			var emailid = document.getElementById('emails').value;

			if (emailid == "" || emailid == null)

				if (emailid == null || emailid == "") {
					document.getElementById('Email').innerHTML = " ** Please email";
					return false;
				} else if (emailid.indexOf('@') <= 0) {
					document.getElementById('Email').innerHTML = " ** Please  valid email";
					return false;
				}

				else {
					document.getElementById('Email').innerHTML = "";

				}
			if (password != confirmPassword) {
				alert("wrong");
				return false;
			}

		}
	</script>



	<script>
		$(document).ready(function() {
			var afterotp="";
			$('#verify').click(function() {

				var otpvalue = $("#otpvalue").val();
				
				if(otpvalue==afterotp)
					{
		            alert("verified.."+afterotp);
		            $('#phone_no1').hide();
					$('#phone_no').show();
					}
				else{
						alert("sry bro plz enter valid otp");
					}

			});

			$('#change').click(function() {
				$('#phone_no1').hide();
				$('#phone_no').show();

			});
			$('#sendotp').click(function() {

				var mobile_no = $("#mobile").val();

				$('#phone_no').hide();
				$('#phone_no1').show();
				
			 $.get("webapi/myresource/{mobile_no}", function(data, status){
					    alert("Data: " + data + "\nStatus: " + status);
					    afterotp=data;
					  }); 
			});
			});
	
	
	</script>

</body>
</html>