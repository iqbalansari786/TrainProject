<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri = "http://www.springframework.org/tags/form" prefix = "form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modify train</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <style>
 input[type="button"]:hover
  {
	background-color:#3366ff;   
  }
  
  </style>

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
		
		

<div class="modifyvar" style="width: 100%;box-sizing: border-box;overflow:scroll;height: 515px">
	
	
			<table class="table table-hover" style="border-collapse: collapse;
  width: 100%">
  
				<thead style="font-size:15px;">
					<th >Train No</th>
					<th >Train Name</th>
					<th>From</th>
					<th>To place</th>
					<th>No seat</th>
					<th>Departure date</th>
				
					<th>Duration</th>
					<th>Fare</th>
					<th>Action</th>
				</thead>
				<tbody>
<c:forEach var="templist" items="${listoftrain}">
<c:url var="updatelink" value="updatetrains">
<c:param name="tid" value="${templist.tid}" />
</c:url>
<c:url var="deletelink" value="deleteTrain">
<c:param name="tid" value="${templist.tid}" />


</c:url>
<tr>
<td>${templist.trainNumber}</td>
<td>${templist.trainname}</td>
<td>${templist.fromplace}</td>
<td>${templist.to}</td>
<td>${templist. trainSeat}</td>
<td>${templist. trainDate}</td>

<td>${templist.duration}</td>
<td>${templist.fare}</td>

<td>  <a href="${updatelink}" style="color:blue"><button style="border-radius: 5px;padding: 10px 10px;background-color: green;color:#fff;border:none">Update</button></a>
|<a href="${deletelink}" onclick="myFunction()" style="color:purple"><button style="border-radius: 5px;padding: 10px 10px;background-color: red;color:#fff;border:none;margin-left:3p">Delete</button></a> 

</td>
</tr>
</c:forEach>
</tbody>
			</table>
		</div >
	

	<div style="margin-top: 23px">
			<%@ include file="../MainPage/footer.jsp"%>
		</div>
		
            

</div>


<script>
function myFunction() {
alert("Are You confirm..");
}


</script>
</body>
