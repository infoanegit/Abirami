<cfoutput>
	<html>
		<head>
			<title>crud operation</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<link href="./assets/css/bootstrap.css" rel="stylesheet">
			<script src="./assets/js/jquery.min.js"></script>    
		</head> 
		<cfset datObj = createObject( 'component', 'model') >
		<cfset Userinfo = datObj.getData()>

		<cfif structKeyExists(url, 'id')>
			<cfset datObj.deleteData("#url.id#")> 
			<cflocation url="list.cfm" addtoken="false">
		</cfif>
		 
		<a href="index.cfm" class="btn btn-info">Add New</a>
		
		<div class="container mt-3">
			<table class="table table-bordered table-info">
				<thead class="table-secondary">
					<tr>
						<th>Firstname</th>
						<th>Lastname</th>
						<th>Email</th>
						<th>gender</th>	
						<th>age</th>
						<th>location</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<cfloop query="#Userinfo#">
						<tr>
							<td>#Userinfo.firstName#</td>
							<td>#Userinfo.lastname#</td>
							<td>#Userinfo.mail#</td>
							<td>#Userinfo.gender#</td>
							<td>#Userinfo.age#</td>
							<td>#Userinfo.current_location#</td>
							<td>
								<a href="index.cfm?id=#userInfo.ID#" class="btn btn-info">Edit</a>
								<button class="btn btn-warning deleteBtn" data-id="#userInfo.ID#">Delete</button>
							</td>
						</tr>
					</cfloop>
				</tbody>
			</table>
		</div>
	</html>
	<script>
		$(".deleteBtn").on('click',function() {
			let text = "Press a button!\nEither OK or Cancel.";
			var test= $(this).attr("data-id");
	
			if (confirm(text) == true) {
				location.replace("list.cfm?id=" +test);
			}
			else {
				confirm("You canceled!");
				return false;
			}
		});
	
	</script>	
		
</cfoutput>  
				