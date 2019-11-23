<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UserPage</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script>
$(document).ready(function(){
  $(".booktrain").click(function(){
    $("booktrains").hide();
   
  });
});
</script>
</head>
<style type="text/css">
.bottom::after{content: "";display: inline-block;clear: both;}
label{
font-size: 20px;
color: #aaa; 
font-weight: bold;
font-family: sans-serif;


}
th{

	font-size: 20px;
	font-family: sans-serif;
	font-weight: bold;
}
input[type="text"]{
width: 150px;
height: 30px;

}
#class-select{

	width: 150px;
height: 30px;
}
*{
	margin: 0;
	padding:0;
}

#navbar{height: 50px,border:solid;box-sizing: border-box;background-color: #75849c;padding: 10px}
#navbar::after{content: "";display: block;clear: both; }

.rightmenu{float: right;height: 50px;padding: auto 0;}
.rightmenu ul{

	list-style: none;
}
.rightmenu ul li{

	

	width: 120px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	text-transform: uppercase;
	float: left;
	position: relative;

}
.rightmenu ul li a{
	text-decoration: none;
	color: #fff;
	font-size: 20px;
}
a:hover{
	color: black;
	
}


.dropdown-content {
  display: none;
  position: absolute;
  background-color: #706547;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown-content a{
	color: #000;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {background-color: #000;}

.dropdown:hover .dropdown-content {
  display: block;
}



}
.list{
 	list-style-type: none;
 	margin:auto;
 	text-align: center;
 }
ul.list li{
	width: 250px;
	margin-bottom: 10px;

	color: #000;
}
ul.list li input[type="text"],[type="date"]{
	width: 200px;
	text-align: center;
	padding: 8px 0px;
	border:none;
	color: #666;
	background-color: #d3d3d3;

}
ul.list li input[type="password"]{
	width: 200px;
	text-align: center;
	padding: 8px 0px;
	border:none;
	background-color: #d3d3d3;

}
ul.list li input[type="button"]{
	width: 200px;
	padding: 8px 0px;
	background-color: DodgerBlue;
	color: white;

}
.selector{
	width: 200px;
	text-align: center;
	padding: 8px 0px;
	border:none;
	color: #666;
	background-color: #d3d3d3;
}

</style>
<body>
<div id="navbar">

		

			<div class="rightmenu">
				<ul >
					<li id="fisrtlist"> <a href="#">home</a> </li>
				
				
					<li> <a href="#aboutus">About us</a></li>
					
                    <li> <a href="#">Contact </a></li>	
				</ul>
			</div>
		</div>
	<div class="booktrains" style="width: 100%;height: 100px;border:solid green;padding-top: 20px;box-shadow: 20px 20px 20px 10px black; 
	box-sizing: border-box;padding-left: 20px">
		<label>From</label>
		<input type="text" name="Origin") />
		<i style='font-size:24px' class='fas'>&#xf362;</i>
		<span><label>to</label>
		<input type="text" name="Origin" /></span>

		<span><label for="class-select">Journey Classes:</label>

                                     <select id="class-select">
									   
									    <option value="AC">AC</option>
									    <option value="Sleeper">Sleeper</option>
									</select></span>
									<span><input type="date" value="Date" placeholder="Date" path="date"/></span>
      <span>
		<input type="submit" value="Search" style=" border-radius: 10%;background-color:#cf34eb;padding: 10px;font-size: 20px;color: #fff" /></span>
	
	</div>


 <div class="bottom" style="width: 100%;box-sizing: border-box;margin-top: 20px;" >
	<div class="left" style="height: 200px;width: 20%;float: left;box-sizing: border-box;" >
	</div>
	<div class="left" style="width: 80%;float: right;box-sizing: border-box;border-bottom: 5px solid green;border-left: 1px solid black">
		<h1 style="text-align: center;">coming soon</h1>
		<div class="result" style="width: 75%;height: 150px;margin:auto; ">
			<table  cellspacing="20px" cellpadding="20px">
				<tr>
					<th>Train Name</th>
					<th>Depart time</th>
					<th>Arrival time</th>
					<th>Duration</th>
					<th>Classes</th>
					<th>Action</th>
				</tr>

			</table>
		</div>
	</div>
	
</div> 
	

</body>
</html>