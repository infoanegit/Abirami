<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Email captcha valitation</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="./assets/css/bootstrap.css" rel="stylesheet"> 
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script> 
    </head>
    <body class="colors">
        <cfoutput>
            <div class="container bg-primary w-25 mx-auto text-center p-5">
                <form onSubmit="return validate();" method="post" id="formtest" name="captchatest" enctype="multipart/form-data">
                    <cfset randomCaptcha = createUUID() />
                    <cfset newCaptcha = listFirst(randomCaptcha ,"-") />
                    <input type="hidden" name="checkcaptcha" id="checkcaptcha" value="#newCaptcha#">
                    <div class="text-danger"><h3>Captcha validation</div></h3><hr>
                    <div class="row mt-3 text-info">
                        <label for="username"><b>Enter the username</b></label>
                        <input type="text" id="username" name="uname" class="form-control mx-auto" placeholder="Enter your username">
                    </div>    
                    <div class="row mt-3 text-info">
                        <label for="umail"><b>Enter the user Mailid</b></label>
                        <input type="text" id="umail" name="umail" class="form-control mx-auto" placeholder="Enter your user mail id">
                    </div>  
                    <div class="row p-2 mt-3">
                        <div><cfimage action="captcha" width="200" height="30" text="#newCaptcha#" difficulty="medium" fontSize="18" fonts="Comic Sans MS,Times New Roman"></cfimage></div>
                        <input type="text" id="captchatype" name="captchatype" class="form-control mx-auto" placeholder="Enter your captcha">  
                    </div>
                    <div class="row text-center mt-2 p-3">
                        <input type="submit" value="Subscribe" name="submit" id="submit" class=" btn btn-warning text-dark " />
                    </div>
                </form>         
            </div>
        </cfoutput>   
        <cfif structKeyExists(form,"submit") >  
            <cfset captcha=form.captchatype> 
            <cfset newcaptcha=form.checkcaptcha>
            <cfset mail=form.umail>

            <cfif(captcha EQ newcaptcha)>    
                <cfmail from="asivakumar@infoane.com" to="#mail#" subject="Subscription Mail"server="localhost">
                    <p>"Hi #uname#" Thank you for Subscribe the newsletter</p>
                </cfmail>
                <div class="text-success text-center"><h3>Thank you for Subscribing the newsletter</h3></div> 
            <cfelse>  
                <div class="text-danger text-center"><h3>Invalid captcha</h3></div>       
            </cfif>
        </cfif>            
    </body>
</html> 
<script>
    function validate(){
    let username = document.forms["captchatest"]["uname"].value;
    let usermailid = document.forms["captchatest"]["umail"].value;
    let captcha= document.forms["captchatest"]["captchatype"].value;
    let newcaptcha= document.forms["captchatest"]["checkcaptcha"].value;
        if(username==""){
            alert("Please enter the username");
            return false;
        }
        else if((!/^[a-zA-Z]*$/g.test(username))){
            alert("Give your valid username");
            return false;
        }
        else if(usermailid==""){
            alert("please give your mail id");
            return false;
        }
        else if((!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(usermailid))){
            alert("Give only valid mailid");
            return false;
        }
        else if(captcha==""){
            alert("please enter the captcha");
            return false;
        }
        else if((captcha==newcaptcha)==false){
            alert("Not match your captcha");
            return false;
        }
        else{
            alert("Subscribe Successfully");
            return true;
        }
    }
</script>
<style>
.colors{
    background-color: rgba(209, 157, 111, 0.83);
 }
</style>

