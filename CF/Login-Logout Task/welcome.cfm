<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <title>WElCOME-page</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="./assets/css/bootstrap.css" rel="stylesheet"> 
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>  
        </head>   
        <body>
            <form id="form" name="welcome" method="post">
                <div class="container from-group bg-info w-50 p-5 mt-5">
                    <div class="container ">
                    <h1 align ="center" class="text-warning"><b>WELCOME</b></h1> 
                        <div class="text-center text-success"><h3>Hi...<cfif structKeyExists(session, "username")><cfoutput>#session.username#
                        </cfoutput>
                        </cfif></h3></div>
                    </div>
                    <div class="container text-center mt-3"> 
                        <input type="submit" class ="btn btn-warning" name="Logout" value="Logout">   
                    </div>                        
                </div>
            </form>    
            <cfif structKeyExists(form, 'Logout')>
                <cfset structclear(session)> 
                <cflocation url="index.cfm" addtoken="false">
            </cfif>
        </body>      
    </html>
</cfoutput>    
    