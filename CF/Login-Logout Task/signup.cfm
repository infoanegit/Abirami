<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Signin page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="./assets/css/bootstrap.css" rel="stylesheet"> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>  
    </head>   
    <body>
        <div class="container form-group bg-info w-50 p-5 mt-5">
            <div class="container ">
                <h1 align ="center"><b>New User-Sign in</b></h1>
            </div>
            <form  method="post" id="form" name="test" >
                <div class="container form-group text-center w-50 mt-3">
                    <label for="userName" class="text-primary"><h4>Give Your UserName</h4></label><br>
                    <input type="text" id="userName" name="userName" class="form-control mt-2" placeholder="enter the username">
                </div> 
                <div class="container form-group text-center w-50 mt-3">
                    <label for="password" class="text-primary"><h4>Give Your Password</h4></label><br>
                    <input type="password" id="password" name="password" class="form-control mt-2 " placeholder="enter the password">
                </div> 
                <div class="container form-group text-center mt-3">
                    <input type="submit" class ="btn btn-warning " name="Sign Up" value="Sign Up"><a href="logout.cfm"></a>
                </div>  
                <div class="container text-center mt-3 "> 
                    <p ><a href="index.cfm">Back to Login</p></a>
                </div>    
            </form>     
        </div>
    </body>      
</html>
<script>
    $(document).ready(function() {
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
        });
</script> 
<cfoutput>
   <cfset userObj = createObject( 'component', 'model' ) />

        <cfif structKeyExists(form, 'Sign Up')>
            <cfset checkloginObj = userObj.checklogin(userName=form.userName, 
                password=form.password)> 
             
                <cfif checkloginObj.recordcount gt 0>
                    <p class="text-center text-danger">Already the user is excise  please go to login page</p>
                <cfelse>    
                    <cfset userObj.insertData(userName=form.username, 
                    password=form.password)> 
                    <p class="text-center text-success">Sucessfully sign in the username and password..Please!! go to login page</p>
                </cfif>   
        </cfif>
</cfoutput>    
      

              
   