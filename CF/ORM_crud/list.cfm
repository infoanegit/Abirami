<cfoutput>
        <!DOCTYPE html>
        <head>
            <title>ORM-CRUD-Table</title>
            <link rel="stylesheet" href="./assets/css/style.css">
            <script src="./assets/js/jquery.min.js"></script>
            <link href="./assets/css/bootstrap.css" rel="stylesheet">
        </head>
        <cfset pagedata=EntityLoad('employee')>
        <cfif structKeyExists(url,"id")>
            <cfset deleteData = EntityLoadbypk("employee",url.id)>
            <cfset EntityDelete(deleteData)>
            <cflocation  url="list.cfm" addtoken="false">
        </cfif> 
        <div class = "mx-auto text-center p-3">
            <a href="index.cfm" class="btn btn-success">ADD NEW </a>
        </div>
        <table class="table table-bordered mx-auto text-center w-50">
            <thead>
                <tr class="table-dark">
                    <th>Employee Name</th>
                    <th>Employee Age</th>
                    <th>Update/Delete</th>
                </tr>
            </thead>
            <tbody>
                <cfloop array="#pagedata#" index="data">
                    <tr>
                        <td>#data.getname()#</td>
					    <td>#data.getage()#</td>
                        <td>
                        <a href="edit.cfm?id=#data.getid()#" class="btn btn-info">Edit</a>
                        <a href="list.cfm?id=#data.getid()#" class="btn btn-secondary">Delete</a>
                        </td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </cfoutput>