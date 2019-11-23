<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri = "http://www.springframework.org/tags/form" prefix = "form" %>
<!DOCTYPE html>
<html>
<head>
<title>Details</title>
<meta charset="ISO-8859-1">
	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
   <link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/DetailOfAddtrain.css" />

</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
 if(session.getAttribute("username")==null)
{
	
	response.sendRedirect("/");
} 

%>
<div id="wrapper">


	<div>
			<%@ include file="../MainPage/header.jsp"%>
		</div>

<div>
			<%@ include file="../MainPage/afterloginUserheader.jsp"%>
		</div>
		<div  class="Booktrain" style="width: 100%;height: 500px;">

	<div class="addtrain" style="width: 100%;height: 500px;overflow:scroll;">
			<table class="table table-hover">
					<thead>
				     <th>TrainNo</th>
					<th>Train Name</th>
					<th>From</th>
					<th>To</th>
					<th>Departure date</th>
				
					<th>Duration</th>
					<th>total fare</th>
				
					<th>Action</th>
					
				</thead>
				
 <c:forEach var="templist" items="${listoftrain}">

<c:url var="book" value="/booknow">
<c:param name="tid" value="${templist.tid}" />


</c:url> 
<tr>
<td> ${templist.trainNumber}</td>
<td> ${templist.trainname}</td>
<td> ${templist.fromplace} </td>
<td>${templist.to}</td>
<td>${templist.trainDate}</td>

<td> ${templist.duration} </td>
<td>${templist.fare}</td>

<td> 
<a href="${book}" style="color:purple"><button  style="border-radius: 3px;padding: 10px 10px;background-color: red;color:#fff;border:none;margin-left:3p">Booknow</button></a>

</td> 
</tr>
 </c:forEach> 

			</table>
		</div>

</div>
	<div style="margin-top:25px">
			<%@ include file="../MainPage/footer.jsp"%>
		</div>
<div>
			<%@ include file="../MainPage/footer.jsp"%>
		</div>
</div>

</body>
</html>