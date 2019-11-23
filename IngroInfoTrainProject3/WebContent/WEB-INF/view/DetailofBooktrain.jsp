
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri = "http://www.springframework.org/tags/form" prefix = "form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detail of booktrain</title>

 <style>


 thead{
	 color:blue;
     font-weight: bold;
      
}

</style> 
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



<div class="main" style="height: 535px;width: 100%;overflow: scroll;">
<table class="table table-hover">
<thead>
<th>Train name</th>
<th>Train number</th>
<th>Fullname</th>
<th>Age</th>
<th>Idproof</th>
<th>Totalfare</th>
<th>Action</th>

</thead>
<tbody>
<c:forEach var="templist" items="${listofbooktrain}">

 <c:url value="/report" var="pdfURL" >
 <%-- 		<c:param name="bookid" value="${templist.bookid }"/> --%>
 </c:url>
 
 <c:url var="deletelink" value="/deleteofticket">
 <c:param name="bookid" value="${templist.bookid }" />


</c:url>
<tr>

<td>${templist.trainname }</td>
<td>${templist.trainNumber }</td>
<td>${templist.fullname }</td>
<td>${templist.age }</td>
<td>${templist.idproof }</td>
<td>${templist.totalfare }</td>
<!-- <button style="border-radius: 5px;padding: 1px;background-color: green;color:#fff;border:none">Update</button>
<button style="border-radius: 5px;padding: 1px;background-color: red;color:#fff;border:none;margin-left:3p">Pdf download</button> -->

<td> 
<a href="${deletelink}" style="color:purple"><button style="border-radius: 5px;padding: 6px 30px;background-color: green;color:#fff;border:none">Cancel</button></a>|
<a href="${pdfURL}" style="color:blue"><button style="border-radius: 5px;padding: 6px 10px;background-color: red;color:#fff;border:none;margin-left:3p">Ticket download</button></a>
</td>
</tr>
</tbody>
</c:forEach>




</table>

</div>
<div>
			<%@ include file="../MainPage/footer.jsp"%>
		</div>

</body>
</html>