 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<title>train home page</title>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminhome.css" />

</head>
<body>

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
 if(session.getAttribute("adminemail")==null)
{
	
	response.sendRedirect("/");
} 

%>

	<div id="wrapper" style="box-sizing: border-box;">
		<div>
			<%@ include file="../MainPage/header.jsp"%>
		</div>
	<div>
			<%@ include file="../MainPage/adminheader.jsp"%>
		</div>
<div style="width: 100%;height:540px;overflow:hidden;">
<div class="why">
		<div class="container" style="margin-top:-150px">
			<div class="row">
				<div class="col text-center">
					<div class="section_subtitle">simply amazing places</div>
					<div class="section_title"><h2>Why choose us?</h2></div>
				</div>
			</div>
			

			<div class="row why_row">
				
				<!-- Why item -->
				<div class="col-lg-4 why_col" >
					<div class="why_item">
						<div class="why_image">
							<img alt="logo" src="${pageContext.request.contextPath}/resources/images/fastservice.png" height="200px" width="200px">
						
						</div>
						<div class="why_content text-center">
							<div class="why_title"style="margin-top: 0px">Fast Services</div>
							<div class="why_text">
								<p class="text-justify">We are here to provide facility for you all as bases on your time.</p>
							</div>
						</div>
					</div>
				</div>

				<!-- Why item -->
				<div class="col-lg-4 why_col" >
					<div class="why_item">
						<div class="why_image">
							<img alt="logo" src="${pageContext.request.contextPath}/resources/images/team.png">
							
						</div>
						<div class="why_content text-center">
							<div class="why_title">Great Team</div>
							<div class="why_text">
								<p class="text-justify">Actually our company beleive that working alone is not much efficent than as group.</p>
							</div>
						</div>
					</div>
				</div>

				<!-- Why item -->
				<div class="col-lg-4 why_col" >
					<div class="why_item">
						<div class="why_image">
						<img alt="logo" src="${pageContext.request.contextPath}/resources/images/beastdeal.png">

						</div>
						<div class="why_content text-center">
							<div class="why_title">Best Deals</div>
							<div class="why_text">
								<p class="text-justify">We also have best deal for my client .For example, suppose that market forces determine that a widget costs $5. A widget buyer is, therefore, willing to forgo the utility in $5 to possess the widget, and the widget seller perceives that $5 is a fair price for the widget. This simple theory of determining prices is one of the core principles underlying economic theory....</p>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

</div>
	</div>

	<div >
			<%@ include file="../MainPage/footer.jsp"%>
		</div>
</body>
</html>