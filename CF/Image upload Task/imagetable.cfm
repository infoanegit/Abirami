<cfoutput>
	<html>
		<head>
			<title>image view</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<link href="./assets/css/bootstrap.css" rel="stylesheet">
			<link rel = "stylesheet" href="./assets/css/style.css"> 
			<script src="./assets/js/jquery.min.js"></script>    
		</head> 
		<body class="imagecolor">
			<cfset imageobj = createObject( 'component', 'model') />
			<cfset imagefile = imageobj.getData() />
			<cfif structKeyExists(url, 'id')>
				<cfset imagefile = imageobj.getData("#url.id#")> 
			</cfif>
			<div class="container mt-3 w-25">
				<table class="table table-bordered">
					<thead class="table-warning">
						<tr>
							<th>ImageName</th>
							<th>Description</th>
							<th>Image</th>
						</tr>
					</thead>
					<tbody class="table-success">
						<cfloop query="#imagefile#">
							<tr>
								<td>#imagefile.imagename#</td>
								<td>#imagefile.description#</td>
								<td><img src="./assets/images/#imagefile.image#" alt="image" width="200" height="200"></td>
							</tr>
						</cfloop>
					</tbody>
				</table>
			</div>
		</body>
	</html>
</cfoutput>    