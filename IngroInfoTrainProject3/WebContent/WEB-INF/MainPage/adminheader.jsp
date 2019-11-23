<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin header</title>

	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/homenav.css" />
</head>
<body>



  <nav class="shift" style="background-color: #6F6F6F;box-sizing: border-box;">
    <ul >
<!--      -->
          <li ><a class="active" href="adminhome" style="font-size: 16px;height:63px; inherit;color:#fff;padding-top:20px;">home</a></li>
          <li><a href="ShowAddTrain" style="font-size: 16px;font-family: inherit;color:#fff;height:63px;padding-top:20px;">Add train</a></li>
             <li><a href="Modify" style="font-size: 16px;font-family: inherit;color:#fff;height:63px;padding-top:20px;">Modify </a></li>
        <!--    <li><a href="#" style="font-size: 16px;font-family: inherit;color:#fff;height:63px;padding-top:20px;">UserDetail</a></li> -->
           <li><a href="logout" style="font-size: 16px;font-family: inherit;color:#fff;height:63px;padding-top:20px;">logout </a></li>

			<div style="float: left;margin-left: 950px;box-sizing: border-box;color:#fff;">
							
					<li ><span style="color: #0f65db;font-size: 25px">Admin</span><br>${adminemail}</li>
						</div>

        </ul>
  </nav>
</body>
</html>