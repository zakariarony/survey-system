<html>
	<head>
		<title>PHP SURVEY SYSTEMS</title>
		<link href="stylesheets/public.css" media="all" rel="stylesheet" type="text/css" />
	
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){ 
			    $(".other_option").hide();

			    $("input").click(function(){ 
			    	//alert($(this).val());
			  	 if($(this).is(':checked'))
				    $("#other_option_"+$(this).val()).show();
				else
				    $("#other_option_"+$(this).val()).hide();
			    
			  });

			});
		</script>

	</head>
	<body>
		<div id="header">
			<h1>PHP SURVEY SYSTEMS script</h1>
		</div>
		<div id="main">
