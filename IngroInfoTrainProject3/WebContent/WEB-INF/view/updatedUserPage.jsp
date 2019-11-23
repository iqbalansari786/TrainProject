 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<title>train home page</title>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/UserPagecss.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style type="text/css">
.title h1{
color:red;
text-align: center;
font-family: sans-serif;

}
.title p{
color:#fff;
text-align: justify;}


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
		<div class="mainSection" style="width: 100%;height: 540px;display: flex;box-sizing: border-box;">
		
	<!-- .....................................leftsection................................... -->
	
			<div class="leftsectionhome" style="height: 540px;width:80%;margin-left:0px; background-color: #dae3dc;display:flex">
				
				<div class="leftsectionhomeright" style="height: 540px;width: 200px;padding: 10px 0;border:solid red">
				<div class="leftsquare" style="height: 150px; width: 200px; box-sizing: border-box; ">

				<a class="knowlegebasebutton" href="#" style="border-bottom: none"><i class="material-icons" style="font-size: 60px; color: lightblue; text-shadow: 2px 2px 4px #000000; padding-left: 10px;padding-top: 18px;">computer</i></a>
				<h1 style="font-size: 20px; font-family: sans-serif; text-align: center;">Knowledge Base</h1>

			</div>
			<div class="middlesquare"
				style="height: 150px; width: 200px;box-sizing: border-box;margin-top:20px;padding-top: 18px;">
			<a class="morequestion" href="#">	<i class="glyphicon glyphicon-envelope"
					style="font-size: 60px; color: lightblue; text-shadow: 2px 2px 4px #000000; padding-left: 10px"></i></a>
				<h1
					style="font-size: 20px; font-family: sans-serif; text-align: center;">More
					Question?</h1>
			</div>
			<div class="rightsquare"
				style="height: 150px; width: 200px;margin-top:20px;padding-top: 18px;">
				<a class="faqclick" href="#"><i class="glyphicon glyphicon-envelope"
					style="font-size: 60px; color: lightblue; text-shadow: 2px 2px 4px #000000; padding-left:10px"></i></a>
				<h1
					style="font-size: 20px; font-family: sans-serif; text-align: center;">FAQs</h1>
			</div>
		
		</div>
	 <div class="leftsectionhomeleft"style="height:540px;width: 100%;background-image:url('${pageContext.request.contextPath}/resources/images/backimage.jpg ') ">
	 	<div class="knowledgebase" style="height: 540px;width: 100%;display:none">
	 			<div class="title">
	 				<h1>Knowledge about Train</h1>
	 				<p>The Indian Railways are operated and controlled by the Government of India. 
	 				It is the third largest rail network in the world, with tracks running well over 60,000 kilometres 
	 				which connect about 7500 stations, ferrying nearly 20 million people every day. There are varied types 
	 				of trains such as the Long Distance trains - which are compartmentalised in the Air Conditioned ('AC') 
	 				and Non AC classes. While the AC coaches are more sterile and 'privatised' with curtains and blankets, 
	 				the real experience lies in the Non-AC coaches where 
	 			one wakes up to shrieks of the tea vendor and the aroma of food from different stations.</p>
	 			</div>
	 	
	 	
	 	</div>
<!-- 	 	...........knowlegbase end.............. -->
<div class="morequestion" style="height: 540px;width: 100%;display:none">
	 			<div class="title">
	 				<h1>More Question about us</h1>
	 				<p>The Indian Railways are operated and controlled by the Government of India. 
	 				It is the third largest rail network in the world, with tracks running well over 60,000 kilometres 
	 				which connect about 7500 stations, ferrying nearly 20 million people every day. There are varied types 
	 				of trains such as the Long Distance trains - which are compartmentalised in the Air Conditioned ('AC') 
	 				and Non AC classes. While the AC coaches are more sterile and 'privatised' with curtains and blankets, 
	 				the real experience lies in the Non-AC coaches where 
	 			one wakes up to shrieks of the tea vendor and the aroma of food from different stations.</p>
	 			</div>
	 	
	 	
	 	</div>
	 	<!-- 	 	...........morequestion end.............. -->
	 <div class="faq" style="height: 540px;width: 100%;display:none">
	 			<div class="title">
	 		
	 	<h1>Some FAQ?</h1>
				 			<dl style="color: #fff;text-align: justify;">
			
			<dt>
			Should I Book ticket before travelling by train?
			</dt>
			<dd>
			Ofcourse you should have ticket based on rule of train else you might be fined by tt.
			</dd>
			
			<dt>
			Should i need to take food outside of train or with train canteen?
			</dt>
			<dd>
			its totally depends on you but what we recomend take food inside train rather taking outside it is safety compare to outside.
			</dd>
			
			
			
			</dl>


</div>

	 	
	 	</div>
	 	<!-- 	 	...........faq end.............. -->
	 	 <div class="bookingguideline" style="height: 540px;width: 100%;display:none;margin-left: 50px">
	 			<div class="title">
	 				<h1>How to Book train</h1>
	 					<ul style="text-align: justify;color: #fff;list-style: decimal;">
	 							<li>First You should go to tran menu..</li>
	 							<li>Next u will get Booknow option</li>
	 							<li>Click on booknow </li>
	 							<li>u will get booking form and u need to fill all the field mandatory</li>
	 					
	 					</ul>
	 			</div>
	 	
	 	
	 	</div>
	 	 	<!-- 	 	...........bookingguideline end.............. -->
	 	 		 <div class="deletingguideline" style="height: 540px;width: 100%;display:none;margin-left: 50px">
	 			<div class="title">
	 				<h1>How to Delete ticket?</h1>
	 					<ul style="text-align: justify;color: #fff;list-style: decimal;">
	 							<li>First You should go to Modify option..</li>
	 							<li>Next u will get list of booked train by you</li>
	 							<li>there is two option one is for downloading ticket and another is for deleting </li>
	 							
	 					
	 					</ul>
	 			</div>
	 	
	 	
	 	</div>
		</div>
		
			</div>
	<!-- 		.............................leftsection end............................... -->
	
			<div class="rightsectionhome" style="width: 20%;height: 540px;border:solid red;margin-left:0px;">
				<table class="table">
					<tr>
						<td width="100%" style="text-align: center;"><h1
								style="color: #000">GuideLine</h1></td>
					</tr>
					<tr>
						<td class="text-left"><a  class="bookingstep" href="#">1.How to book
								Ticket?</a></td>
					</tr>
					<tr>
						<td class="text-left"><a  class="deletingstep" href="#">2.How to delete
								ticket?</a></td>
					</tr>

				</table>
			</div>
		
		</div>
		
		
	<div>
			<%@ include file="../MainPage/footer.jsp"%>
		</div>

	</div>
<script>
$(document).ready(function(){
  $(".knowlegebasebutton").click(function(){
    $(".knowledgebase").show();
    $(".deletingguideline").hide();
  
  });
  
  $(".morequestion").click(function(){
	    $(".knowledgebase").hide();
	    $(".bookingguideline").hide();
	    $(".deletingguideline").hide();
	    $(".faq").hide();
	  
	  });
  
  $(".bookingstep").click(function(){
	    $(".knowledgebase").hide();
	    $(".faq").hide();
	    $(".bookingguideline").show();
	    $(".deletingguideline").hide();
	  
	  });
  
  
  $(".deletingstep").click(function(){
	    $(".knowledgebase").hide();
	    $(".faq").hide();
	    $(".bookingguideline").hide();
	    $(".deletingguideline").show();
	  
	  });
  
 $(".faqclick").click(function(){
	    $(".knowledgebase").hide();
	    
	    $(".bookingguideline").hide();
	    $(".deletingguideline").hide();
	    $(".faq").show();
	  
	  }); 
});
</script>

</body>
</html>