<cfoutput>
	<!DOCTYPE html bg-dark>
		<head>
			<title>Odd or Even Task</title>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script> 
			<link href="./assets/css/bootstrap.css" rel="stylesheet">
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
		</head>    
		<body>
			<div class="container bg-dark w-50 p-5">
				<h1 class= "text-info" align ="center"><b>Odd/Even</b></h1>
				<form id="form" action="" method="POST" align ="center" name="testForm">
					<label for="Enter any number" class="text-light">Enter any number</label><br><br>
					<input type="text" name="textField" id="numbers" value=""><br><br>
					<input type="submit" value="submit" name="submit" class="btn btn-success">
				</form>
			</div>
			<p><h4 align="center">odd numbers are in blue and even numbers are in green</h4></p>
			<cfif structKeyExists(form, 'submit')>
				<cfloop index="i" from="1" to="#form.textField#">
					<cfif i MOD 2 EQ 0>
						<div class="odd text-center">
							#i#<br>
						</div>	
					<cfelse>
						<div class="even text-center">
							#i#<br>
					    </div>		
					</cfif>
				</cfloop>
			</cfif>
		</body>
	</html>
</cfoutput>

<style>
	.odd{
		color: blue;
	}
	.even{
        color:green;
	}
</style>
<script>
	 $("form").on('submit', function() {  
		var number = $('#numbers').val();
		if(number==""){
			alert("please enter any value in textbox");
			return false;
		}
		else if(/[^0-9]|^0+(?!$)/g.test(number)){
            alert("only numeric value allowed");
            return false;
		}
		if(number=="0"){
			alert("please enter the non zero element");
			return true;
		}	
	});		
</script>
