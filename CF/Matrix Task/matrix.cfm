<!DOCTYPE html>
    <head>
        <title>List function</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script> 
        <link href="./assets/css/bootstrap.css" rel="stylesheet">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>    
    <cfoutput>
        <div class="container bg-secondary text-light w-25 p-3">
            <h1 class= "text-info" align ="center"><b>Matrix</b></h1>
            <cfset count = 0 />
            <cfloop index="i" from="1" to="9">
                <cfif i EQ 4 OR i EQ 7>
                    <br>
                </cfif>
                #i#
                <cfset count ++ />
            </cfloop>  
        </div>      
    </cfoutput>
</html>    
