<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>DashBoard</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">
/*  */
window.onload = function () {
	var chart = new CanvasJS.Chart("chartContainer", {
		title:{
			text: "My First Chart in CanvasJS"              
		},
		data: [              
		{

			type: "column",
			dataPoints: [
				{ label: "apple",  y: 10  },
				{ label: "orange", y: 15  },
				{ label: "banana", y: 25  },
				{ label: "mango",  y: 30  },
				{ label: "grape",  y: 28  }
			]
		}
		]
	});
	chart.render();
}
</script>
<style type="text/css">

		*{
			margin: 0px;
			padding: 0px;
		}
		#container ul{
				text-align: center;
			list-style: none;

		}
			#container ul li{

				background-color: black;
				color: #fff;
				width: 150px;
				height: 50px;
				line-height: 50px;
			
				border:solid 1px white;
				text-align: center;
					border-radius: 10px;
				font-size: 20px;
				float: left;
				position: relative;
			}
				#container ul li a{

			border-bottom: none;
			}
			#container ul ul{

				display: none;
			}
			#container ul li:hover >ul
			{

				display: block;
			}
			#container li:hover{
				background-color: red;

			}
			#container ul ul ul{

				margin-left: 150px;
				top: 0px;
				position: absolute;
			}
			#container{
				
				height:50px;
				width: 100%;
				border:solid red;
				background-color: pink;

			}
			

	</style> 
</head>
<body>
	<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

%>
<div class="mains" style="border:solid yellow">
<div>
			<%@ include file="../MainPage/header.jsp"%>
		</div>

<div  id="container">

	<ul>
			<li><a href="home">Home</a></li>
		<!-- 	<li>Dashboard</li> -->
			
			<li>Graph
					<ul>
						
						<li id="reader1">Reader1</li>
						<li id="reader2">Reader2</li>
						
					

					</ul>
			</li>
		<li>Pdf Download
					<ul>
						
						<li><a href="pdfReader1">Reader1</a></li>
						<li id="pdfReader2">Reader2</li>
						
					

					</ul>
			</li>
	</ul>

	</div>
	<div class="report" style="width: 100%;height: 520px;border:solid green;box-sizing: content-box">
		<div style="display:flex;box-sizing: border-box;border:solid black">
		<div id="output" style="width: 45%;height: 400px;border:solid pink">
		<!-- <table class="table">
		<thead>
			<th>Sno</th>
			<th>Consumer name</th>
			<th>Address</th>
		</thead>
		<tr>
		<td></td>
		<td><p></p></td>
		
		</tr>
		</table> -->
				
		</div>
		
		<div class="graph" style="width: 45%;height: 400px;border:solid blue;margin-left: 150px;">
			<div id="chartContainer" style="height: 400px; width: 100%;"></div>			


		</div>
		</div>
		<div class="title" style="width: 100%;box-sizing: border-box;border:solid red;display: flex">
				<div class="title_For_data" style="width: 45%;height: 100px;border:solid red">
				</div>
				<div class="title_For_data" style="width: 45%;height: 100px;border:solid blue;margin-left: 150px">
				</div>
		
		
		</div>

	</div>
	

</div>
<div style="margin-top: 20px;">
			<%@ include file="../MainPage/footer.jsp"%>
		</div>
		<script>

		$(document).ready(function() {
	
			  $("#reader1").click(function() {
			    var displayResources = $("#output");
			    
			    displayResources.text("Loading data from JSON source...");

			    $.ajax({
			      type: "GET",
			      url: "bookedtrainValue", // Using our resources.json file to serve results
			      success: function(result) {
			        console.log(result);
			        var output =
			          "<table><thead><tr><th>Name</th><th>Provider</th><th>URL</th></thead><tbody>";
			        for (var i in result) {
			          output +=
			            "<tr><td>" +
			            result[i].name +
			            "</td><td>" +
			            result[i].provider +
			            "</td><td>" +
			            result[i].url +
			            "</td></tr>";
			        }
			        output += "</tbody></table>";

			        displayResources.html(output);
			        $("table").addClass("table");
			      }
			    });
			  });
			});
		</script>
	<!-- 	<script>
			$(document).ready(function(){
				
				 $('#reader1').click(function(){
				var name="mr1";
			
					$.ajax({
					
						url:"getDataFromServer",
						data: { 'namevalue' : name},
				
						success:function(data)
						{
							$('p').html(data);
							console.log(data);
							alert("it worked for consumer name.." +data);
							
							}
					
						});								
					}); 
				 $('#reader2').click(function(){
						var name="mr2";
					
							$.ajax({
								url:"getDataFromServer",
								data: { 'namevalue' : name},
							
								success:function(data)
								{
									var newdata=JSON.stringify(data);
									console.log(newdata);
									$('p').html(newdata);
									console.log(data);
									alert("it worked for consumer name.." +data);
									
									}
							
								});								
							});
				});
		</script> -->
</body>
</html>