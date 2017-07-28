<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, 
initial-scale=1, maximum-scale=1, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-waitingfor/1.2.4/bootstrap-waitingfor.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


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
				//console.log("Ajax call started");
				//$("#wait").css("display", "block");	
				waitingDialog.show('Please wait!');
			});
			$(document).ajaxComplete(function() {
				//console.log("Ajax call completed");
				//$("#wait").css("display", "none");
				waitingDialog.hide();
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
<nav class="navbar navbar-default"></nav>
<nav class="navbar navbar-inverse container-fluid navbar-fixed-top">
        <div>
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" 
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
                aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" 

                href="/">Document Classifier</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="/train">
                    <span class="glyphicon glyphicon-home"></span> 
                    Train</a></li>
                    <li class="active"><a href="/test">
                    <span class="glyphicon glyphicon-king"></span>  
                    Test</a></li>
 
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
<!--
<form id="testform" method="POST" enctype="multipart/form-data" action="">
			<table>
				<tr><td>Test documents(zip/txt):</td><td><input type="file" name="test_file" /></td></tr>
                <tr><td>Model Selection mode:</td><td><button type="button" id="mode">Use saved one!</button></td></tr>
				<tr id="mode1"><td>Available model in session:</td><td>${sessionScope.sessionmodel}<input class="hide" name="model_sess_path_flag" id="msp" value="0"></td></tr>
                				
				<tr id="mode2"><td>Model to use:</td><td>
				<input type="file" name="model_file" id="model_file"/></td></tr>
				
				<tr><td></td><td><input type="submit" value="Upload" /></td></tr>
			</table>
</form>
-->
<div class="container">
<form id="testform" method="POST" enctype="multipart/form-data" action="" class="form-horizontal">
<div class="panel panel-primary">
    <div class="panel-heading">
        <h2 class="panel-title">Testing</h2>
    </div>
    <div class="panel-body">
    
    <div class="form-group">
	<label for="test_file" class="col-sm-2 control-label">Test documents(zip/txt):</label>
	<input type="file" name="test_file" />
    </div>
    


    <div class="form-group">
	<label for="mode" class="col-sm-2 control-label">Model Selection mode:</label>
	<button class="btn btn-success btn-default"  type="button" id="mode">Use saved one!</button>
    </div>


	<div class="form-group"  id="mode1">
	<label for="msp" class="col-sm-2 control-label">Available model in session:</label>
	${sessionScope.sessionmodel}<input class="hide" name="model_sess_path_flag" id="msp" value="0">
    </div>
    
    
	<div class="form-group"  id="mode2">
	<label for="model_file" class="col-sm-2 control-label">Model to use:</label>
	<input type="file" name="model_file" id="model_file"/>
    </div>
    
    </div>

    <div class="panel-footer">
        <div class="row">
            <div class="col-xs-1">
                <p><button class="btn btn-success btn-default">Upload</button></p>
            </div>
        </div>
    </div>
    </div>
    
 </form>
 </div>
<div class="container">
<div id="result" class="hide"></div>
</div>
</body>
</html>