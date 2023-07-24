<cfoutput>
	<cfparam name="pageInfo.pagename" default="">
	<cfparam name="pageInfo.pagedesc" default="">

    <!DOCTYPE html>
    <html lang="en">
        <head>
            <title>list page</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="./assets/css/bootstrap.css" rel="stylesheet"> 
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>  
			<link rel = "stylesheet" href="./assets/css/style.css"> 
        </head>   
        <body class="style1">
			<div class="container form-group bg-info w-50 p-5 mt-5">
				<div class="container text-center">
					<h1><b>New User Form</b></h1>
				</div>
				<!--- getData in pageinfo --->
				<cfset cmsobj = createObject( 'component', 'model' ) /> 
				<cfif structKeyExists(URL,"id")>
					<cfset pageInfo = cmsObj.getData(URL.id)>
			    </cfif>		
					<!--- updateData & insertData in pageinfo	 --->
				<cfif structKeyExists(form,"submit") >
					<cfif structKeyExists(url, 'id') >						
					<cfset cmsObj.updateData(id=URL.id,pagename=form.pagename,pagedesc=form.pagedesc)>
					<cfelse>
					<cfset cmsobj.insertData(pagename=form.pagename,pagedesc=form.pagedesc)>
			     	</cfif>
					<cflocation url="list.cfm" addtoken="false">	
				</cfif>
				<form  method="post" id="form" name="test" >
					<div class="container form-group text-center w-50 mt-3">
						<label for="pagename" class="text-warning"><h4>Page Name</h4></label><br>
						<input type="text" id="pagename" name="pagename" value="#pageInfo.pagename#" class="form-control mt-2">
					</div>
					<div class="container form-group text-center w-50 mt-3">
						<label for="desc" class="text-warning" ><h4>Description</h4></label><br>
						<textarea id="desc" name="pagedesc" rows="3" class="form-control mt-2">#pageInfo.pagedesc#</textarea></textarea>
					</div>  
					<div class="container form-group text-center mt-3">
						<input type="submit" class ="btn btn-warning" name="submit" value="submit">
					</div>
				</form>     
			</div>
		</body>   	   
    </html>
</cfoutput>    
<script>
    $(document).ready(function() {
            $("form").on('submit', function() {
                var pagename = $('#pagename').val();
                var pagedesc = $('#desc').val();
                    if(pagename==""){
                        alert("enter the user name");
                        return false;
                    }
                    else if(!/^[a-zA-Z]*$/.test(pagename)){
                        alert("enter your valid username");
                        return false;
                    }
                    else if(pagedesc==""){
                        alert("enter the user descripition");
                        return false;
                    }
                    else{
                        return true;
                    }
            });
        });
</script> 
    