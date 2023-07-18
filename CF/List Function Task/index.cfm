<cfoutput>
    <!DOCTYPE html >
		<head>
			<title>List function</title>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script> 
			<link href="./assets/css/bootstrap.css" rel="stylesheet">
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
		</head>    
		<body>
			<div class="container bg-dark w-50"><br><br>
				<h1 class= "text-info" align ="center"><b>List function (divisible by 3)</b></h1>
				<form id="form" action="" method="POST" align ="center" name="testForm">
					<label for="Enter any number" class="text-light">Enter a list:</label>
					<input type="text" name="textField" id="list" value=""><br><br>
					<input type="submit" value="submit" name="submit" class="btn btn-success"><br><br>
			    </from>	
		    </div>	
			<cfif structKeyExists(form, 'submit')>
				<cfset mylist="#form.textField#">
				<cfloop index="i" list="#myList#">
					<cfif isNumeric(i) AND ( i MOD 3 EQ 0 )>
						<div class="text-center text-primary">	
							<cfdump	var=#i#>
					    </div>		
					</cfif>
				</cfloop>	
		    </cfif>			
		</body>			
    </html>               
</cfoutput>
<script>
	$("form").on('submit', function() {  
	   var list = $('#list').val();
	   var regex = /^(?:\d+(?:\.[\d{1,2}]*)?|\.[\d{1,2}]+)(?:,[\s]?(?:\d+(?:\.[\d{1,2}]*)?|\.[\d{1,2}]+))*$/;
	   if(list==""){
		   alert("please enter the list in textbox");
		   return false;
	    } 
		else if(list=="0"){
			alert("please enter the non zero element");
			return false;
		}	
	    else if(regex.test(list) == false){
            alert("only allowed list in separated by comma and numeric value");
            return false;
		}
	});
</script>	   