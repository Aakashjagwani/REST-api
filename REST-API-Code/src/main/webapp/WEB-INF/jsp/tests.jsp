<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>Test</title>
<style>
.hide{display:none;}
.show{display:block;}
table{}
</style>
<script>
$(document).ready(function() {
//modeToggle	
$("#mode1").addClass("hide");
c=1;
$("#mode").click(function(){
if(c%2){
this.innerText="Upload new model";
$("#mode1").addClass("show").removeClass("hide");
$("#mode2").addClass("hide").removeClass("show");
$("#model_file")[0].value=null;
$("#msp")[0].value="1";
}else{
this.innerText="Use from avail session";
$("#mode2").addClass("show").removeClass("hide");
$("#mode1").addClass("hide").removeClass("show");
$("#msp")[0].value="0";
}
c++;
return false;
})

//waitAnim
$(document).ajaxStart(function() {
				console.log("Ajax call started");
				$("#wait").css("display", "block");
			});
$(document).ajaxComplete(function() {
				console.log("Ajax call completed");
				$("#wait").css("display", "none");
			});
			
//formPost
$("form#testform").submit(function() {

    var formData = new FormData(this);

//     $.post($(this).attr("action"), formData, function(data) {
//         alert(data);
//     });

$.ajax({
        url: window.location.pathname,
        type: 'POST',
        data: formData,
        async: false,
        success: function (data) {
            $("#result")[0].innerHTML=data;
            $("#result").addClass("show").removeClass("hide");
        },
        cache: false,
        contentType: false,
        processData: false
    });
    
    return false;
});

});




</script>

</head>
<body>
<a href="/train"><h3>Train</h3></a>
<a href="/test"><h3>Test</h3></a>
<br>
<form id="testform" method="POST" enctype="multipart/form-data" action="">
			<table>
				<tr><td>Test documents(zip/txt):</td><td><input type="file" name="test_file" /></td></tr>
                <tr><td>Model Selection mode:</td><td><button id="mode">Use saved one!</button></td></tr>
				<tr id="mode1"><td>Available model in session:</td><td>${sessionScope.sessionmodel}<input class="hide" name="model_sess_path_flag" id="msp" value="0"></td></tr>
                				
				<tr id="mode2"><td>Model to use:</td><td>
				<input type="file" name="model_file" id="model_file"/></td></tr>
				
				<tr><td></td><td><input type="submit" value="Upload" /></td></tr>
			</table>
</form>
<div id="wait"
			style="display: none; width: 69px; height: 89px; border: 1px solid black; position: absolute; top: 50%; left: 50%; padding: 2px;">
			<img src='http://i.imgur.com/8YsAmq3.gif' />
</div>
<div id="result" class="hide"></div>
</body>
</html>