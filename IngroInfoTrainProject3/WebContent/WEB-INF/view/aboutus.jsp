<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>About us</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/aboutus.css" />
	
	<style>
	
	.preheight{
	height: 500px;
	width: 200px;
	border:solid red;
	}
	.images{
	margin-top:-30px;
	background-size: cover;
	}
	.col{
	border-radius:5%;
	margin-left: 100px;
	}
	.desc{
	text-align: justify;
	overflow-y: scroll;
	height: 180px;
	text-overflow: inherit;
	color:#000;
	}
	.title{
	text-align: center;
	
	}
	.title h1{
	font-family: sans-serif;
	font-style: italic;
	}
	input[type="text"],input[type="email"]
	{
	font-size: 20px;
	font-family: sans-serif;
	}

	</style>
</head>

<body background-color="#ebf2f2">
	 <div id="banner" style="height: 90px; width: 100%;box-sizing:border-box;   background:linear-gradient(to top left, #ffffff 48%, #000000 99%)">
			<div style="float:left;height: 80px;width: 70px;margin-top:10px;margin-left: 10px">
			<img alt="logo" src="${pageContext.request.contextPath}/resources/images/bannerlogo.png">
			
			</div>
			<div style="float:right;width: 90%;height: 60px;margin-right: 70px">
			<h1 style="position:relative;bottom:7px;font-family: sanf;color: #000;font-size: 40px">Online TrainBooking Site</h1>
		<h2 style="position:relative;font-family: sanf;color: purple;font-size: 20px;bottom: 40px">Make our life more digital compare to past..</h2>
			</div>

		</div>

	<div>
			<%@ include file="../MainPage/homeHeader.jsp"%>
		</div>

	

  <div class="container-fluid" style="background-color: #ebf2f2;">
    <h1 style="font-family: inherit;font-weight: bold">About Us</h1> 
   <p style="font-family:san-serif;color: purple;font-size: 20px;">Our mission is to increase the public 's employment and understanding of British art from the 16th century to present day</p>
  
  </div>

  <div class="info" style="background-color: #ebf2f2;margin-top: 20px;">
    
 
    <div class="row">


     <div class="col preheight" >
       <div class="images">
			<img src="${pageContext.request.contextPath}/resources/images/strength.png" width="100%" height="200px">
		</div>
		<div class="title">
		<h1>Our Strength</h1>
		
		</div>
		<div class="desc">
		
		<p>Our strength comes from our professionals who have a thorough and extensive awareness of current industry practices 
		and applicable business methodologies, complimented by our established relationships with nationally respected engineering, process, and software firms. 
		This unique pool of resources brings our clients a perspective unsurpassed in the utility industry.</p>
		</div>
</div>
<div class="col preheight" >
<div class="images">
			<img src="${pageContext.request.contextPath}/resources/images/whatwedo.jpg" width="100%" height="200px">
		</div>
		<div class="title">
		<h1>What We do?</h1>
		
		</div>
		<div class="desc">
		<p>IngroInfo Software Solutions Pvt Ltd is registered under company's act 1956 and currently has a development centre 
		in Silicon City, Bangalore, India.We are privately owned company for providing Information Technology enabled services, 
		related resource provisioning and software development. Having extensive experience 
		in providing Billing & Revenue Management Solutions to various states owned distribution utilities in India..</p>
		</div>
</div>
<div class="col preheight" >
<div class="images">
			<img src="${pageContext.request.contextPath}/resources/images/whoweare.jpg" width="100%" height="200px">
		</div>
		<div class="title">
		<h1>Who We are?</h1>
		
		</div>
		<div class="desc">
			<p>Ingroinfo Software Solutions Pvt Ltd is software Development and service based company, 
			which believes that IT should be a highly value-adding asset to businesses that rely on technology to provide a\
			 competitive advantage in their industry 
			our vision and passion to provide services in the field of information technology.</p>
		</div>
</div>

  </div>
   
</div>

<div style="display: flex;">
 <div class="container-fluid contact" style="width:800px;margin-left:40px;margin-top: 20px;background-color: #ebf2f2;">
	<div class="row" style="background-color: #ebf2f2">
		<div class="col-md-3" style="margin-top:-60px;height: 400px">
			<div class="contact-info">
				<img src="https://image.ibb.co/kUASdV/contact-image.png" alt="image"/>
				<h2>Contact Us</h2>
				<h4 style="color:#fff">We would love to hear from you !</h4>
			</div>
		</div>
		<div class="col-md-9" style="margin-top:-60px;">
			<div class="contact-form">
			<form:form action="Contactus" modelAttribute="contactvalue">
				<div class="form-group">
		
				  <div class="col-sm-10">          
					<form:input type="text" path="firstName" class="form-control" placeholder="Enter First Name"/>
				  </div>
				</div>
				<div class="form-group">
			
				  <div class="col-sm-10">          
					<form:input  path="lastName" type="text" class="form-control" placeholder="Enter Last Name" />
				  </div>
				</div>
				<div class="form-group">
			
				  <div class="col-sm-10">
					<form:input path="email" type="email" class="form-control" id="email" placeholder="Enter email"/>
				  </div>
				</div>
				<div class="form-group">
				
				  <div class="col-sm-10">
					<textarea class="form-control" rows="5" id="comment" name="msg" placeholder="Leave ur comment" style="font-family: sans-serif;font-size: 20px;"></textarea>
				  </div>
				</div>
				<div class="form-group">        
				  <div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default mt-3" style="margin-right: 180px;font-size: 20px;">Submit</button>
				  </div>
				  
				</div>
				</form:form>
			</div>
		</div>
	</div> 
		</div>
		<div style="height: 400px;width: 650px;margin-top: 20px;overflow: hidden;margin-right: 35px">
		<div class="title">
		<h1>Contact us</h1>
		</div>
		<div class="des">
		 <h3 style="text-transform:none;text-align: left">For All The Service Enquiries Mail Us </h3>

    <p style="text-align: justify;">To discover how Ingroinfo can help your organization achieve higher performance, provide some information about your business needs, 
    so we may respond with a formal proposal or an answer to your inquiry. Please , write us email at </p>
		</div>
		<div style="text-align: justify;">
		
     <h3>Write to us</h3>

       <h5>Sales</h5>

       <a href="mailto:sales@ingroinfo.com">sales@ingroinfo.in</a>

       <h5  >Support</h5>

       <a href="mailto:support@ingroinfo.com">support@ingroinfo.in</a>

       <h5  >Human Resources</h5>

       <a href="mailto:hr@ingroinfo.com">hr@ingroinfo.in</a>
</div>
		
		</div>
 </div>
 

<div>
			<%@ include file="../MainPage/footer.jsp"%>
		</div>
<script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
</script>
</body>
</html>
