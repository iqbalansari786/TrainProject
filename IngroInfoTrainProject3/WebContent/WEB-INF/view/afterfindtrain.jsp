
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri = "http://www.springframework.org/tags/form" prefix = "form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UserPage</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

</head>
<style>
body{
width: fixed;
overflow: hidden;
}
input[type="text"]
{
	color:red;
}
</style>

<body>

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

%>
<div id="banner" style="height: 90px; width: 100%;box-sizing:border-box;   background:linear-gradient(to top left, #ffffff 48%, #000000 99%)">
			<div style="float:left;height: 80px;width: 70px;margin-top:10px;margin-left: 10px">
			<img alt="logo" src="${pageContext.request.contextPath}/resources/images/bannerlogo.png" height="70px" width="80px">
			
			</div>
			<div style="float:right;width: 90%;height: 60px;margin-left: 50px;">
			<h1 style="position:relative;bottom:7px;font-family: sanf;color: #000;font-size: 40px;left:320px">Online TrainBooking Site</h1>
		<h2 style="position:relative;font-family: sanf;color: purple;font-size: 20px;bottom: 40px;left:330px;padding-top: 2px">Make our life more digital compare to past..</h2>
			</div>

		</div>

	<div>
			<%@ include file="../MainPage/homeHeader.jsp"%>
		</div>

	<div class="booktrains" style="width: 100%;height: 100px;padding-top: 20px;box-shadow: 20px 20px 20px 10px black; 
	box-sizing: border-box;padding-left: 20px">
	<form action="home">
	<label>From</label>
	 <input type="text" name="from" value="${trainvalue.getFromplace() }" readonly="readonly"/>
		<i style='font-size:24px' class='fas'>&#xf362;</i>
		<span><label>to</label>
		<input type="text" value="${trainvalue.getTo()}" readonly="readonly" /></span>

		<span><label for="class-select">Journey Classes:</label>
              <input type="text" value="${trainvalue.getTrainDate()}" readonly="readonly" /></span>

                                   
									<!-- <span><input type="date" value="Date" placeholder="Date" /></span> -->
      <span>
		<input type="submit" value="modify search" style=" border-radius: 10%;background-color:#cf34eb;padding: 10px;font-size: 20px;color: #fff" /></span>
	</form>
	</div>


 <div class="bottom" style="width: 100%;height:420px; border-box;margin-top: 20px;overflow-y: scroll;" >
	
	<div class="left" style="width: 100%;box-sizing: border-box;border-left: 1px solid black">
		<h1 style="text-align: center;">${message}</h1>
		<div class="result" style="width: 75%;height: 150px;margin:auto; ">
			<table class="table table-hover">
			
			
			<thead style="color: red;font-size: 15px;font-family: sans-serif;">
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

 <c:url var="book" value="/homepagebooking">
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
<a href="${book}" style="color:purple">Book now</a>

</td> 
</tr>
 </c:forEach> 

			</table>
		</div>
	</div>
	
</div> 
		<div>
			<%@ include file="../MainPage/footer.jsp"%>
		</div>

</body>
</html>