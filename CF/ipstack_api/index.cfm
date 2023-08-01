<cfoutput>
    <!DOCTYPE html>
    <head>
		<title>IP stack-api</title>
		<link rel="stylesheet" href="./assets/css/style.css">
        <link href="./assets/css/bootstrap.css" rel="stylesheet">
		<script src="./assets/js/jquery.min.js"></script>
    </head>
    <body>
		<form name="form" method="post">
			<div class="container mt-5 mx-auto w-50 bg-secondary">
				<div class="col-sm-12  text-center mx-auto w-50 ">
					 <label for="usertext" class="text-info"><h3>Enter Your IP ADDRESS</h3></label>
				</div>
				<div class=" container mx-auto">
					<input type="text" name="usr" id="IP" class="form-control mx-auto w-50 align-center" placeholder="Enter your IP">
				</div>
                <div class=" container mx-auto p-3 text-center ">
					<input type="submit" value="submit" name="submit" id="submit" class=" btn-success text-light btn"></br>
				</div>
            </div>
        </form>
    </body> 
    <cfif structKeyExists(form,"submit")>
        <cfset ipObj = createObject("component","model")>   
    </cfif>    
</cfoutput>    

















