<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <title>Login page</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="./assets/css/bootstrap.css" rel="stylesheet"> 
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script> 
            <link rel = "stylesheet" href="./assets/css/style.css"> 
        </head>   
        <body class="style">
            <div class="container form-group bg-info w-50 p-5 mt-5">
                <div class="container text-center">
                    <h1><b>USER LOGIN</b></h1>
                </div>
                <form  method="post" id="form" name="test" >
                    <div class="container form-group text-center w-50 mt-3">
                        <label for="userName" class="text-warning"><h4>UserName</h4></label><br>
                        <input type="text" id="userName" name="userName" class="form-control mt-2">
                    </div> 
                    <div class="container form-group text-center w-50 mt-3">
                        <label for="password" class="text-warning"><h4>Password</h4></label><br>
                        <input type="password" id="password" name="password" class="form-control mt-2">
                    </div>  
                    <div class="container form-group text-center mt-3">
                        <input type="submit" class ="btn btn-warning" name="Login" value="Login">
                    </div>
                </form>     
            </div>
        </body>      
    </html>
    <cfset cmsobj = createObject( 'component', 'model') /> 
    <cfif structKeyExists(form,"Login")>
        <cfset checkloginObj = cmsobj.checklogin(username=form.username,password=form.password) /> 
        <cfif checkloginObj.recordcount gt 0>
            <cfset session.username = checkloginObj.username />
            <cfset session.userrole= checkloginObj.userrole />
            <cflocation url="list.cfm" addtoken="false">
        <cfelse>
            <p class="text-center text-danger"> Invalid username and password please choose the new user</p>
        </cfif>
    </cfif>   
</cfoutput> 
<script>
    $("form").on('submit', function() {
        var username = $('#userName').val();
        var password = $('#password').val();
        
        if(username==""){
            alert("enter the user name");
            return false;
        }
        else if(!/^[a-zA-Z]*$/.test(username)){
            alert("enter your valid username");
            return false;
        }
        else if(password==""){
            alert("enter the user password");
            return false;
        }
        else{
            return true;
        }
    });
</script> 