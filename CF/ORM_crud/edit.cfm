<cfoutput>
    <head>
		<title>ORM Concept</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="./assets/js/jquery.min.js"></script>
        <script src="./assets/js/style.js" ></script>
        <link href="./assets/css/bootstrap.css" rel="stylesheet">
    </head>
    <body>
        <cfset editData= EntityLoadbypk("employee",url.id)>
        <cfif structKeyExists(form,"submit")>
            <cfif  structKeyExists(url,"id")>
                <cfset editData.setname(form.empname)>
                <cfset editData.setage(form.empage)>
                <cfset EntitySave(editData)>
            </cfif>   
            <cflocation  url="list.cfm">
        </cfif>    
        <form  method="post" name="form">
            <h1 class= "text-dark " align ="center"><b>ORM-CRUD</b></h1>
            <div class="container w-25 mx-auto text-center p-5 bg-secondary">
                <div class="row mt-3 form-group text-center text-info">
                    <label for="empname" id="ename"><b>Emplayee Name</b>
                    <input type="text" id="empname" name="empname" class="form-control" value="#editData.getname()#">
                </div> 
                <div class="row mt-3 form-group text-info">
                    <label for="empage" id="eage"><b>Employee Age</b>
                    <input type="text" id="empage" name="empage" class="form-control" value="#editData.getage()#">
                </div>
                <div class="mt-3">
                    <input type="submit" name="submit" class ="btn btn-success" >
                </div>    
            </div>
        </form>
    </body>
</cfoutput>


        