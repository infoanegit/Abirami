<cfoutput>
	<html>
		<head>
			<title>image upload</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<link href="./assets/css/bootstrap.css" rel="stylesheet">
			<link rel = "stylesheet" href="./assets/css/style.css"> 
			<script src="./assets/js/jquery.min.js"></script>    
		</head> 
		<body class="style1">
			<cfset imageobj = createObject( 'component', 'model') />
			<cfset imagefile = imageobj.getData("")>
			<div class="container mt-3 w-25">
				<table class="table table-bordered">
					<thead class="table-danger">
						<tr>
							<th>ImageName</th>
							<th>Thumbnail</th>
						</tr>
					</thead>
					<tbody  class="table-info">
						<cfloop query="#imagefile#">
							<tr>
								<td><a href="imagetable.cfm?id=#imagefile.ID#">#imagefile.ImageName#</a></td>
								<td> <cfimage action = "resize"  source="#expandPath('./assets/images/#imagefile.image#')#" destination="#expandPath('./assets/thumbnail/#imagefile.image#')#" height = "20" width="20" overwrite="true">
								<img src="./assets/thumbnail/#imagefile.image#"></td>
							</tr>
						</cfloop>
					</tbody>
				</table>
		    </div>		
		</body>
	</html>
</cfoutput>    