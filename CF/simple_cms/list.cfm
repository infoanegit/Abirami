<cfoutput>
	<html>
		<head>
			<title>list of pageinfo</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<link href="./assets/css/bootstrap.css" rel="stylesheet">
			<link rel = "stylesheet" href="./assets/css/style.css"> 
			<script src="./assets/js/jquery.min.js"></script>    
		</head> 
        <!--- ObjectCreation --->
		<cfset cmsObj = createObject( 'component', 'model') >
		<cfset pageInfo = cmsObj.getData()>
        <!--- deletePageInfo --->
		<cfif structKeyExists(url, 'pageid')>
			<cfset cmsObj.deleteData(id = "#url.pageid#")> 
			<cflocation url="list.cfm" addtoken="false">
		</cfif>
		<cfif session.userrole EQ "Editor" OR session.userrole EQ "Admin">
			<div class="text-center"><a href="add.cfm" class="btn btn-info">Add New</a></div>
	    </cfif>		
		<div class="container mt-3">
			<body class="colors">
				<form method="post">
					<table class="table table-bordered table-info">
						<thead class="table-secondary">
							<tr>
								<th>PageName</th>
								<th>pagedesc</th>
								<cfif session.userrole EQ "Editor" OR session.userrole EQ "Admin">
									<th colspan = "2">Actions </th>
								</cfif>
							</tr>
						</thead>
						<tbody>
							<cfloop query="#pageInfo#">
								<tr>
									<td>#pageInfo.pagename#</td>
									<td>#pageInfo.pagedesc#</td>
									<cfif session.userrole EQ "Admin">
										<td><a href="add.cfm?id=#pageInfo.pageid#" class="btn btn-info tets">Edit</a>
										<a class="btn btn-warning deleteBtn" data-id="#pageInfo.pageid#">Delete</a></td>
									</cfif>	
									<cfif session.userrole EQ "editor">
										<td><a href="add.cfm?id=#pageInfo.pageid#" class="btn btn-info">Edit</a></td>
									</cfif>			
								</tr>
							</cfloop>
						</tbody>
					</table>
					<div class="text-center">
						<input type="submit" class="btn btn-warning " value="Logout" name="logout">
					</div>
				</form>
			</body>		
			<cfif structKeyExists(form,"logout")>
				<cfset StructClear(session)>
				<cflocation url="index.cfm" addtoken="false">
		    </cfif>		
		</div>
	</html>
	<script>
		$(".deleteBtn").on('click',function(e) {
			e.preventDefault();	
			let text = "Do you want delete the record !\nEither OK or Cancel.";
			var test= $(this).attr("data-id");
			if (confirm(text) == true) {
				location.replace("list.cfm?pageid=" +test);
			}
			else {
				return false;
			}
		});
	</script>	
</cfoutput>  
				