<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Please wait...</title>


<style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  border-radius:10px; 
}



.button2:hover {
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

</style>
</head>

<body>

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

%>
	<div id="wrapper" style="border:none;">
			
	
	
	<div style="width: 100%;height: 650px;overflow: hidden">
	<a href="home" style="margin-left: 700px;margin-top: 290px"><button class="button button2">Home</button></a>
		<h1 style="text-align: center;font-family: sans-serif;font-size: 200px">Someting is wrong</h1>
		
		
	
	</div>
 </div>

</body>
</html>