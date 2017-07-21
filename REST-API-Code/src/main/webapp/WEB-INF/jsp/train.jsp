<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
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
  -webkit-appearance: none;
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
<a href="/test"><h3>Test</h3></a>
<br>
		Enter Ratio For Training
		<div class="range-slider">
		<input class="range-slider__range" type="range" min="1" max="100" value="0"name="train_ratio" id="train_ratio">
		<span class="range-slider__value">0</span>
		</div>
		<br>
		<br>
		<button id="train">Submit</button>
		<div id="wait"
			style="display: none; width: 69px; height: 89px; border: 1px solid black; position: absolute; top: 50%; left: 50%; padding: 2px;">
			<img src='http://i.imgur.com/8YsAmq3.gif' />
		</div>
		<button id="download" >Download</button>
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
				console.log("Ajax call started");

				$("#wait").css("display", "block");
			});
			$(document).ajaxComplete(function() {
				console.log("Ajax call completed");
				$("#wait").css("display", "none");
			});
			$("#train").click(function() {
				console.log("Training called...");
				$("#download").css("display", "none");
				sendoneCall();
			});
		});
	</script>
		
</body>
</html>