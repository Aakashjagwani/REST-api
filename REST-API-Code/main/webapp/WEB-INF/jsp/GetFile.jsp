<!-- Never used -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		Enter File Path For Testing<input type="text" name="f"><br>
		<br>
		<button id="train">Submit</button>

		<div id="wait"
			style="display: none; width: 69px; height: 89px; border: 1px solid black; position: absolute; top: 50%; left: 50%; padding: 2px;">
			<img src='http://i.imgur.com/8YsAmq3.gif' />
		</div>
		
	V1:<br> ${valueobj}
	
	<script type="text/javascript">
		function sendoneCall() {
			$.ajax({
				url : "/statusRead"
			}).then(function(data) {
				//$('#myres').append(data + "<br>");
				if(data=="wait")sendoneCall();
				else
					if(data.startsWith("success=")) window.location="/TestC?f="+data.split("=")[1]; 
					else alert("Data: "+data);
			});
		}

		$(document).ready(function() {
			$(document).ajaxStart(function() {
				console.log("Ajax call started");
				$("#wait").css("display", "block");
			});
			$(document).ajaxComplete(function() {
				console.log("Ajax call completed");
				$("#wait").css("display", "none");
			});
			$("#train").click(function() {
				console.log("Training called...");
				sendoneCall();
			});
		});
	</script>
</body>
</html>
