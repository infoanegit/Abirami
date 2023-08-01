<cfoutput>
    <!DOCTYPE html>
    <head>
		<title>ORM Concept</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="./assets/js/jquery.min.js"></script>
        <script src="./assets/js/style.js" ></script>
        <link href="./assets/css/bootstrap.css" rel="stylesheet">
    </head>
    <cfset pagedata=EntityLoad('employee')>
    <cfif structKeyExists(form, 'submit')>
        <cfset page = EntityNew("employee")>
        <cfset page.setname(form.empname)>
        <cfset page.setage(form.empage)>
        <cfset entitySave(page)>
        <cflocation url="list.cfm">
    </cfif>
    <body>
        <form  method="post" name="form">
            <h1 class= "text-dark " align ="center"><b>ORM-CRUD</b></h1>
            <div class="container w-25 mx-auto text-center p-5 bg-secondary">
                <div class="row mt-3 form-group text-center text-info">
                    <label for="empname" id="ename"><b>Emplayee Name</b>
                    <input type="text" id="empname" name="empname" class="form-control" >
                </div> 
                <div class="row mt-3 form-group text-info">
                    <label for="empage" id="eage"><b>Employee Age</b>
                    <input type="text" id="empage" name="empage" class="form-control" >
                </div>
                <div class="mt-3">
                    <input type="submit" name="submit" class ="btn btn-success" >
                </div>    
            </div>
        </form>
    </body>
</cfoutput>   


