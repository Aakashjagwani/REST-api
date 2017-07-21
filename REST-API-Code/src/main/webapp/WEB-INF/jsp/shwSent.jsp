<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<title> Aa Gya</title>
<script>
var setId=-1;
function sendtoshowres(){
	alert("Result processed.");
	window.location="/showRes";
}
function parseCall(res){
	if (res=="success")sendtoshowres();
	if(res=="wait")return;
	else {
		clearInterval(setId);
		console.log("Fail");
	    $("#anim")[0].style="display:none";
		alert("Response received: "+res)
	}
}
function sendoneCall(){
	$.ajax({
        url: "/statusRead"
    }).then(function(data) {
       $('#myres').append(data+"<br>");
       $("#anim")[0].style="display:block";
       parseCall(data);
    });
}
function sendAll(){
	setId=setInterval(sendoneCall,5000);	
}
</script>
</head>
<body onload="sendAll()">
<!-- <img id="anim" src="http://i.imgur.com/8YsAmq3.gif"></img> -->
<p id="myres">-</p>
V1:<br>
${valueobj}
</body>
</html>