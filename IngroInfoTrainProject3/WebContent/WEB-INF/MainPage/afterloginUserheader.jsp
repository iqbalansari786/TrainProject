
<!DOCTYPE html>
<html>
<head>
<title>Userheader</title>

  <link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/homenav.css" />  

<body>
	
<!-- style="font-size: 16px;font-family: inherit;color:#fff" -->
  
    <nav class="shift" style="background-color: #6F6F6F;box-sizing: border-box;">
    <ul>
          <li><a class="active" href="userPage" style="font-size: 16px;height:63px;padding-top:20px;" >Home</a></li>
          <li><a href="DetailofTrain" style="font-size: 16px;height:63px;padding-top:20px;">Train </a></li>
             <li><a href="detailofbooktrain" style="font-size: 16px;height:63px;padding-top:20px;" >Modify </a></li>
             		<li><a href="logout" style="font-size: 16px;height:63px;padding-top:20px;">logout </a></li>
							<div style="float: left;margin-left: 950px;box-sizing: border-box;color:#fff;">
							
					<li ><span style="color: #0f65db;font-size: 25px">User</span><br>${username}</li>
						</div>
        </ul>
  </nav> 


</body>
</html>