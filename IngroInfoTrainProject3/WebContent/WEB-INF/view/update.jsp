<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri = "http://www.springframework.org/tags/form" prefix = "form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Train</title>
</head>
<style>

td:hover{
color: blue;
}
</style>

<body>

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
 if(session.getAttribute("adminemail")==null)
{
	
	response.sendRedirect("/");
} 

%>
<div class="wrapper">
		<div>
			<%@ include file="../MainPage/header.jsp"%>
		</div>
	<div>
			<%@ include file="../MainPage/adminheader.jsp"%>
		</div>
		
<div class="addtrain" style="width: 100%;height: 300px;
box-shadow: 20px 20px 10px grey;">
<form:form action="updatetrain" modelAttribute="addtrainvalue">
    <table class="table text-left ml-5 mr-5 " >
  
    <tr style="display: none">
  <td> <form:hidden path="tid"/></td>
    </tr>
      
          <tr>
      <td>Train Number:</td> 
           <td><form:input  path="trainNumber" /></td>
   <td>Train Name:</td> 
            <td><form:input  path="trainname"/></td>
       
        <td>From Place:</td>
            <td><form:input path="fromplace"/></td>
  
             
  <td>To Place:</td>
            <td><form:input  path="to"/></td>
           
           
        </tr>
        <br>
           <tr>
               <td>Departure date</td> 
             <td><form:input path="trainDate" type="date" placeholder="Date" style="font-family:sans-serif;
 
  width:180px;
  height:30px;
  padding: 8px 16px;
 
  box-sizing: border-box;"/></td>
              <td> Seat Class:</td>
            <td><form:select path="classes" items="${Class}"  style="font-family:sans-serif; width:180px;
  height:30px;
  padding: 2px 16px;
 box-sizing: border-box;"/></td>

  
    <td>No Seat:</td>
            <td><form:input  path="trainSeat"/></td>
             <td>Duration:</td>
            <td><form:input  path="duration"/></td>
            
          
        </tr>
        <tr>
  <!--  <td>Departure time:</td>
            <td><input type="time" path="time"  style="font-family:sans-serif; width:180px;
  height:30px;
  padding: 2px 16px;
 box-sizing: border-box;"/></td> -->
         
        <td>Total fare:</td>
            <td><form:input  path="fare"/></td>
       

        </tr>
<tr>
<td colspan="4"><input type="submit" value="Update Train" style="border:none;
  font-size:15px;
  font-family:inherit;
  width: 200px;
   border-radius:5%;
  background-color:#036bfc;
  padding: 8px 16px;
  margin-top:17px;
  color:#fff;
  margin-left:400px;
  box-sizing: border-box;"></td>
  
<td colspan="6"><input type="Button" value="History"   style="border:none;
  font-size:15px;
  font-family:inherit;
  width: 200px;
  background-color:#036bfc;
  padding: 8px 16px;
  margin-top:17px;
  color:#fff;
    margin-right:400px;
  border-radius:5%;
  box-sizing: border-box;"></td>
</tr>
        
    
      


    </table>
 <!--  <input type="submit" value="Add train"  style="   font-family:sans-serif;
  font-size:15px;
  width: 200px;
  padding: 8px 16px;
  margin: 8px 0;
  box-sizing: border-box;
  border:  solid #000;
  border-radius: 4px;">  -->
    </form:form>
</div>
<div style="margin-top: 238px">
			<%@ include file="../MainPage/footer.jsp"%>
		</div>
</div>

<script>
		function TrainValidation() {
			var name = document.getElementById('trainName').value;
			

			if (name == null || name == "") {
				document.getElementById('trainname').innerHTML = " ** Please enter trainName";
				return false;
			} else if (!isNaN(name)) {
				document.getElementById('name').innerHTML = " ** String Only";
				return false;
			} else {
				document.getElementById('name').innerHTML = "";
			}

		}
		</script>
</body>
</html>