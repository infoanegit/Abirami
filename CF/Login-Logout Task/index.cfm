<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login/Logout</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="./assets/css/bootstrap.css" rel="stylesheet"> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>  
    </head>   
    <body>
        <div class="container form-group bg-info w-50 p-5 mt-5">
            <div class="container ">
                <h1 align ="center"><b>USER LOGIN</b></h1>
            </div>
            <form  method="post" id="form" name="test" >
                <div class="container form-group text-center w-50 mt-3">
                    <label for="userName" class="text-warning"><h4>UserName</h4></label><br>
                    <input type="text" id="userName" name="userName" class="form-control mt-2">
                </div> 
                <div class="container form-group text-center w-50 mt-3">
                    <label for="password" class="text-warning" ><h4>Password</h4></label><br>
                    <input type="password" id="password" name="password" class="form-control mt-2">
                </div>  
                <div class="container form-group text-center mt-3">
                    <input type="submit" class ="btn btn-warning" name="Login" value="Login">
                </div>
                <div class="container text-center mt-3"> 
                    <p><a href="Signup.cfm">New User? Sign Up</p></a>
                </div>    
            </form>     
        </div>
    </body>      
</html>
<cfoutput>
    <cfset userObj = createObject( 'component', 'model' ) />
        <cfif structKeyExists(form, 'Login')>
            <cfset checkloginObj = userObj.checklogin(userName=form.userName, 
            password=form.password) /> 

            <cfif checkloginObj.recordcount gt 0>
                <cfset session.username = checkloginObj.user_name />
                <cflocation url="welcome.cfm" addtoken="false">
            <cfelse>
                <cfset checkloginObj = userObj.checklogin(userName=form.userName, password=form.password)> 
                <p class="text-center text-danger"> Invalid username and password please choose the new user</p>
            </cfif>
        </cfif>  

</cfoutput>    
    