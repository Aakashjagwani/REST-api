<!--
Developed by:
[Code Authors]
Mihir Parikh
Aakash Jagwani
Aman Goyal
--><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
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


<script>
var rangeSlider = function(){
	  var slider = $('.range-slider'),
	      range = $('.range-slider__range'),
	      value = $('.range-slider__value');
	    
	  slider.each(function(){

	    value.each(function(){
	      var value = $(this).prev().attr('value');
	      $(this).html(value);
	    });

	    range.on('input', function(){
	    	//alert(this.value);
	      $(this).next(value).html(this.value);
	    });
	  });
	};

	$(document).ready(rangeSlider);</script>
	
<style>

$shade-10: #2c3e50 !default;
$shade-1: #d7dcdf !default;
$shade-0: #fff !default;
$teal: #1abc9c !default;


* {
  &,
  &:before,
  &:after {
    box-sizing: border-box;
  }
}

body {
  font-family: sans-serif;
  padding: 60px 20px;
  
  @media (min-width: 600px) {
    padding: 60px;
  }
}

.range-slider {
  margin: 60px 0 0 0%;
}


$range-width: 100% !default;

$range-handle-color: $shade-10 !default;
$range-handle-color-hover: $teal !default;
$range-handle-size: 20px !default;

$range-track-color: $shade-1 !default;
$range-track-height: 10px !default;

$range-label-color: $shade-10 !default;
$range-label-width: 60px !default;

.range-slider {
  width: $range-width;
}

.range-slider__range {
/*   -webkit-appearance: none; */
  width: calc(100% - (<%="#"%>{$range-label-width + 13px}));
  height: $range-track-height;
  border-radius: 5px;
  background: $range-track-color;
  outline: none;
  padding: 0;
  margin: 0;

  &::-webkit-slider-thumb {
    appearance: none;
    width: $range-handle-size;
    height: $range-handle-size;
    border-radius: 50%;
    background: $range-handle-color;
    cursor: pointer;
    transition: background .15s ease-in-out;

    &:hover {
      background: $range-handle-color-hover;
    }
  }

  &:active::-webkit-slider-thumb {
    background: $range-handle-color-hover;
  }

  &::-moz-range-thumb {
    width: $range-handle-size;
    height: $range-handle-size;
    border: 0;
    border-radius: 50%;
    background: $range-handle-color;
    cursor: pointer;
    transition: background .15s ease-in-out;

    &:hover {
      background: $range-handle-color-hover;
    }
  }

  &:active::-moz-range-thumb {
    background: $range-handle-color-hover;
  }
}


.range-slider__value {
  display: inline-block;
  position: relative;
  width: $range-label-width;
  color: $shade-0;
  line-height: 20px;
  text-align: center;
  border-radius: 3px;
  background: $range-label-color;
  padding: 5px 10px;
  margin-left: 8px;

  &:after {
    position: absolute;
    top: 8px;
    left: -7px;
    width: 0;
    height: 0;
    border-top: 7px solid transparent;
    border-right: 7px solid $range-label-color;
    border-bottom: 7px solid transparent;
    content: '';
  }
}

::-moz-range-track {
    background: $range-track-color;
    border: 0;
}

input::-moz-focus-inner,
input::-moz-focus-outer { 
  border: 0; 
}
</style>

<title>Train</title>
</head>
<body>
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
                    <li class="active"><a href="/train">
                    <span class="glyphicon glyphicon-home"></span> 
                    Train</a></li>
                    <li><a href="/test">
                    <span class="glyphicon glyphicon-king"></span>  
                    Test</a></li>
 
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

		<!-- MAIN -->
<div class="panel panel-primary">
    <div class="panel-heading">
        <h2 class="panel-title">Training</h2>
    </div>
    <div class="panel-body">
	<div class="col-xs-4">
		Enter Ratio For Training
	    <div class="range-slider">
		<input class="range-slider__range" min="1" max="100" value="50" name="train_ratio" id="train_ratio" type="range">
		<div class="range-slider__value">0</div>
		</div>
	</div>
    </div>

    <div class="panel-footer">
        <div class="row">
            <div class="col-xs-1">
                <p><button class="btn btn-success btn-default" id="train">Submit</button></p>
            </div>
            <div class="col-xs-1">
                <button class="btn btn-success btn-default" id="download" style="display: none;">Download</button> 
            </div>
        </div>
    </div>
 
</div>


<script type="text/javascript">
		function sendoneCall() {
			//show loading
			$.post("",{train_ratio:$("#train_ratio")[0].value}).then(function(data) {
				if (!data)alert("Failed!");
				else
					if(data.startsWith("success=")) {
						$("#download").css("display", "block");

						$("#download").click(function (){window.open("/download?model="+data.split("=")[1], "_blank");}); 
					}
					else alert("Status fail: "+data);
			});
		}

		$(document).ready(function() {
			$("#download").css("display", "none");

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
			$("#train").click(function() {
				//console.log("Training called...");
				$("#download").css("display", "none");
				sendoneCall();
			});
		});
</script>

</body></html><!--
Developed by:
[Code Authors]
Mihir Parikh
Aakash Jagwani
Aman Goyal
-->