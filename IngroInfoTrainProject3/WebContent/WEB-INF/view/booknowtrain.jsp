<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booknow train</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style>

td:hover{
color:blue;
}
.error{
color:red;
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

<div id="wrapper" style="box-sizing: border-box;">
	<div>
			<%@ include file="../MainPage/header.jsp"%>
		</div>

<div>
			<%@ include file="../MainPage/afterloginUserheader.jsp"%>
		</div>
		

 <div class="booktrain" style="width: 100%;height: 400px; 
box-shadow: 20px 20px 10px grey;">
<form:form action="booknowtrain" onsubmit="return booknowvalidation()" modelAttribute="booknowvalue" enctype="multipart/form-data">
    <table class="table text-left ml-5 mr-5 " style="padding: 20px">
        <tr>
         <td>Train Number:</td>
            <td><form:input path="trainNumber" name="trainNumber" value= "${trainnumber}" readonly="true"/></td>
             <td>Train Name:</td>
            <td><form:input path="trainname" name="trainname" value= "${trainname}" readonly="true"/></td>
            <td>Your name:</td>
            <td><form:input path="fullname" id="fullname"/><span id="Fullname" class="error"></span></td>
            
             <td>Age:</td>
            <td><form:input path="age" id="age"/><span id="Age" class="error"></span></td>
                <td>Email:</td>
            <td><form:input path="email" id="email"/><span id="Email" class="error"></span></td>
           
        </tr>
        <br>
           <tr>
             <td>Address:</td>
            <td><form:input path="address" id="address"/><span id="Address" class="error"></span></td>
              <td>id proof:</td>
            <td><form:select path="idproof" id="idproof" items="${selectclasss }"  style="font-family:sans-serif; width:180px;
        height:30px;
        padding: 2px 16px;
           box-sizing: border-box;"/><span id="Idproof" class="error"></span></td>
             <td>Attachment:</td>
            <td> <input name="file" id="fileToUpload" type="file" required="required" style="font-family:sans-serif; width:180px;
            height:30px;
             padding: 2px 16px;
               box-sizing: border-box;" /><span id="Photo" class="error"></span></td>
            <td>Total fare:</td>
            <td><form:input path="totalfare" id="Totalfare" required="required"/></td>
       
        </tr>
        <br>
 
        



    </table>
     <input type="submit" value="Book Train" style="border:none;
  font-size:15px;
  font-family:inherit;
  width: 250px;
  border-radius:5%;
  background-color:#036bfc;
  padding: 8px 16px;
  margin: 8px 0;
  color:#fff;
margin-left:-120px;
margin-top:60px;
  box-sizing: border-box;">
    </form:form>
</div>

<div style="margin-top:140px">
			<%@ include file="../MainPage/footer.jsp"%>
		</div>
</div>
<script type="text/javascript">
 function booknowvalidation() {
	 
	 var fname = document.getElementById('fullname').value;
	 var ages = document.getElementById('age').value;
	 var numbers = /^[0-9]+$/;
	 var emailid = document.getElementById('email').value;
	 var pwd = document.getElementById('idproof').value;
	 var photo=document.getElementById('fileToUpload').value;
	 if (fname == null || fname == "") {
			document.getElementById('Fullname').innerHTML = " ** plz name.. ";
			return false;
		} else if(fname.match(numbers)) {
			document.getElementById('Fullname').innerHTML = "plz String only";
			
		}
		else{
			document.getElementById('Fullname').innerHTML = "";
			}
		
	 if (ages == null || ages == "") {
			document.getElementById('Age').innerHTML = " ** plz age.. ";
			return false;
		} else if(!ages.match(numbers)) {
			document.getElementById('Age').innerHTML = "plz number only";
			return false;
		}
		else{
			document.getElementById('Age').innerHTML = "";
			}

		
	 if (emailid == null || emailid == "") {
			document.getElementById('Email').innerHTML = " ** plz email.. ";
			return false;
		}
	 else if( emailid.indexOf('@') <= 0){
			document.getElementById('Email').innerHTML=" ** Enter Valid Email";
		return false;
		 }
	

		 else {
			document.getElementById('Email').innerHTML = "";
		}
	 if (photo == null || photo == "") {
			document.getElementById('Photo').innerHTML = " ** plz attatchment.. ";
			return false;
		} else {
			document.getElementById('Photo').innerHTML = "";
		}
		
	
}


</script>
</body>
</html>