<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri = "http://www.springframework.org/tags/form" prefix = "form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add train</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/form.css" /> 
<style>

td:hover{
color: blue;
}
.footer{
margin-top:254px;
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
		
 
<div class="addtrain" style="width: 100%;height: 280px;
box-shadow: 10px 10px 10px grey;">


<form:form action="addingTrain"  modelAttribute="addtrainform" onsubmit="return Addtrainvalidation()"  >


<table class="table text-left ml-5 mr-5 ">
<%-- <tr><form:error path="adtrain" /></tr> --%>
  
    <tr style="display: none"> 
  <td> <form:hidden path="tid"/></td>
    </tr>
        <tr>
      <td>Train Number:</td> 
           <td><form:input  path="trainNumber" id="trainnumber" /><span id="Trainnumber" class="error"></span></td>
   <td>Train Name:</td> 
            <td><form:input  path="trainname" id="trainname" required="required" maxlength="20"/><span id="Trainname" class="error"></span></td>
       
        <td>From Place:</td>
            <td><form:input path="fromplace" id="from" required="required" maxlength="20"/><span id="From" class="error"></span></td>
    
             
           <td>To Place:</td>
            <td><form:input  path="to" id="to" required="required" maxlength="20"/><span id="To" class="error"></span></td>
           
           
        </tr>
        <br>
           <tr>
            <td>Departure date</td> 
             <td><form:input path="trainDate" type="date" required="required"  placeholder="Date" style="font-family:sans-serif;
 
     width:180px;
     height:30px;
     padding: 8px 16px;
 
      box-sizing: border-box;"/></td>
             
              <td> Seat Class:</td>
            <td><form:select path="classes" items="${Class}"  style="font-family:sans-serif; width:180px;
  height:30px;
  padding: 2px 16px;
 box-sizing: border-box;" /></td>

  
    <td>No Seat:</td>
            <td><form:input  path="trainSeat" type="Number" id="trainseat" required="required" maxlength="3"/><span id="Trainseat" class="error"></span></td>
             <td>Duration:</td>
            <td><form:input  path="duration" id="duration"/><span id="Duration" class="error"></span></td>
            
          
        </tr>
        <tr>
  <!--    <td>Departure time:</td>
            <td><input type="time" path="time"  style="font-family:sans-serif; width:180px;
      height:30px;
      padding: 2px 16px;
      box-sizing: border-box;"/></td> -->
         
        <td>Total fare:</td>
            <td><form:input  path="fare" type="Number" SSid="fare"/><span id="Fare" class="error"></span></td>
       

        </tr>
       
<tr>
<td colspan="8"><input type="submit" value="Add train"  style="border:none;
  font-size:15px;
  font-family:inherit;
  width: 200px;
   border-radius:5%;
  background-color:#036bfc;
  padding: 8px 16px;
  margin-top:25px;
  color:#fff;
  margin-left:605px;
  box-sizing: border-box;"></td>
  
 
</tr>
  </table>

    </form:form> 
 <!--    onclick="window.location.href='#'"
  <button id="history"  style="border:none;
  position:relative;
  font-size:15px;
  font-family:inherit;
  width: 200px;
   border-radius:5%;
  background-color:#036bfc;
  padding: 6px 12px;
 	top:-55px;
  color:#fff;
  float:right;
  margin-right:205px;
  box-sizing: border-box;">history</button> -->
</div>
<div class="container" style="height:260px;">

            <h2 align="center" class="text-primary">History of added Train </h2><hr />
            <div> </div>
             
            <!-- Table to show the data fetched from the db. -->             
            <table class="table" align="center">
                <thead>
                  <tr>
                   <th >Train No</th>
					<th >Train Name</th>
					<th>From</th>
					<th>To place</th>
					<th>No seat</th>
					<th>Departure date</th>
					
					<th>Duration</th>
					<th>Fare</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="templist" items="${listoftrain}">
 
<tr style="height: 50px;">
<td>${templist.trainNumber}</td>
<td>${templist.trainname}</td>
<td>${templist.fromplace}</td>
<td>${templist.to}</td>
<td>${templist. trainSeat}</td>
<td>${templist. trainDate}</td>

<td>${templist.duration}</td>
<td>${templist.fare}</td>

 
</tr>
 </c:forEach> 
                </tbody>
              </table>
            
              <!-- Pagination links in spring mvc. --> 
                     
              <ul class="pagination pagination-sm" style="margin-left:50%;margin-top:-10px;">
                <li class="page-item"><a style="font-size: 30px;" class="page-link" href="/IngroInfoTrainProject3/ShowAddTrain/1">1</a></li>
                <li class="page-item"><a style="font-size: 30px;margin-left:20px" class="page-link" href="/IngroInfoTrainProject3/ShowAddTrain/2">2</a></li>
                <li class="page-item"><a style="font-size: 30px;margin-left:20px" " class="page-link" href="/IngroInfoTrainProject3/ShowAddTrain/3">3</a></li>
              </ul>
              
        </div>  
<%-- <div class="historybox" style="width: 100%;height:260px;overflow-y: scroll;box-sizing: border-box;margin-top: 5px;color:#000;display:none">
<h1>History of AddedTrain</h1>
<table class="table table-hover">
				<thead style="font-size:15px;">
					<th >Train No</th>
					<th >Train Name</th>
					<th>From</th>
					<th>To place</th>
					<th>No seat</th>
					<th>Departure date</th>
					
					<th>Duration</th>
					<th>Fare</th>
			
				</thead>
		<!-- 		listoftrain -->
 <c:forEach var="templist" items="${data}">
 
<tr style="height: 50px;">
<td>${templist.trainNumber}</td>
<td>${templist.trainname}</td>
<td>${templist.fromplace}</td>
<td>${templist.to}</td>
<td>${templist. trainSeat}</td>
<td>${templist. trainDate}</td>

<td>${templist.duration}</td>
<td>${templist.fare}</td>

 
</tr>
 </c:forEach> 

			</table>

</div>   --%>
	<div class="footer">
			<%@ include file="../MainPage/footer.jsp"%>
		</div>
</div>
<script type="text/javascript">

 function Addtrainvalidation() {
	 
	 var tnumber = document.getElementById('trainnumber').value;
	 var numbers = /^[0-9]+$/;
	 var tname = document.getElementById('trainname').value;
	 var tfrom = document.getElementById('from').value;
	 var tto = document.getElementById('to').value;
	 var tduration=document.getElementById('duration').value;
	 var tfare=document.getElementById('fare').value;
	 if (tnumber == null || tnumber == "") {
			document.getElementById('Trainnumber').innerHTML = " ** plz trainNo. ";
			return false;
		} 
	 else if(!tnumber.match(numbers)) {
			document.getElementById('Trainnumber').innerHTML = "plz number only";
			return false;
		}
		else{
			document.getElementById('tnumber').innerHTML = "";
			}

	 if (tname == null || tname == "") {
			document.getElementById('Trainname').innerHTML = " ** plz tranname. ";
			return false;
		} 
	 else if(tname.match(numbers)) {
			document.getElementById('Trainname').innerHTML = "plz String only";
			return false;
		}
	 else{
			document.getElementById('Trainname').innerHTML = "";
			}


	 if (tfrom == null || tfrom == "") {
			document.getElementById('From').innerHTML = " ** plz Departure location. ";
			return false;
		} 
	 else if(tfrom.match(numbers)) {
			document.getElementById('From').innerHTML = "plz String only";
			return false;
		}
	 else{
			document.getElementById('From').innerHTML = "";
			}
 }
	
	



</script>
<script>
$(document).ready(function(){

$('#history').click(function(){
	$('.container').toggle();
/* 	   $('.footer').removeClass("footer"); */


/* $.ajax({
	url:'historyoftrain',
	success:function(data){
	
		retunr data;
		alert("done");
		}
}); */
	
});
	
});
</script>
</body>
</html>
