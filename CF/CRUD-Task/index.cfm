<cfparam name="userInfo.firstName" default="">
<cfparam name="userInfo.lastname" default="">
<cfparam name="userInfo.mail" default="">
<cfparam name="userInfo.gender" default="">
<cfparam name="userInfo.age" default="">
<cfparam name="userInfo.current_location" default="">

<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <title>crud operation</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="./assets/css/bootstrap.css" rel="stylesheet">
            <link rel = "stylesheet" href="./assets/css/style.css">   
        </head>   
        <body>
            <cfset datObj = createObject( 'component', 'model') />

            <cfif structKeyExists(url, 'id')>
                <cfset Userinfo = datObj.getData("#url.id#")> 
            </cfif>

            <div class="container sborder form-group"> 
                <div class="container ">
                    <h1 align ="center"><b>Simple CRUD operation</b></h1>
                    <hr>
                    <form onSubmit="return validate();" method="post" action="#cgi.script_name#" id="form" name="form1" >
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label class="label" for="Frist Name">First Name*</label><br>
                                    <input type="text" class="form-control" name="fname" id="FirstName" placeholder="enter your First name" value="#userinfo.firstName#"> 
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label class="label" for="Last Name">Last Name</label><br>
                                    <input type="text" class="form-control" name="lname" id="LastName" placeholder="enter your Last name" value="#userInfo.lastname#"><br>
                                </div>
                            </div>
                        </div>    
                        <div class="container"> 
                            <div class="row">
                                <div class="col-sm-12  form-group">
                                    <label class="label" for="Mail">Mail*</label><br>
                                    <input type="text" class="form-control "name="mail" id="Mail"placeholder="enter your Mail" value="#userInfo.mail#"><br>
                                </div>
                            </div>       
                        </div> 
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-4 form-group">
                                    <label class="label" for="Gender">Gender</label><br>
                                    <input type="radio" id="Male" name="Gender" value="Male" <cfif userInfo.gender EQ 'Male'>checked</cfif>>Male
                                    <input type="radio" id="Female" name="Gender" value="Female" <cfif userInfo.gender EQ 'Female'>checked</cfif>>Female
                                </div>
                                <div class="col-sm-4 form-group">
                                    <label class="label" for="Age">Age</label><br>
                                    <input type="text" class="form-control "name="age"id="age" value="#userInfo.age#">
                                </div>
                                <div class="col-sm-4 form-group">
                                    <label class="label" for="Location">Location</label><br>
                                    <input type="text" class="form-control "name="current_location" id="location" value="#userInfo.current_location#">
                                </div>
                            </div>
                        </div>
                        <hr> 
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-4 form-group">
                                    <a href="list.cfm" class ="btn btn-primary" name="Back">View data</a>
                                </div>   
                                <div class="col-sm-4 form-group">
                                    <input type="reset" class ="btn btn-danger" value="reset">
                                </div>   
                                <div class="col-sm-4 form-group">
                                    <input type="submit" class ="btn btn-success" name="submit" value="Submit">
                                </div>     
                            </div>       
                        </div> 
                    </form>    
                </div>
            </div>
        </body>                
    </html>
        <script>
            function validate() {
               let FirstName = document.forms["form1"]["fname"].value;
               let LastName = document.forms["form1"]["lname"].value;
               let Mail = document.forms["form1"]["mail"].value;
               let gender = document.forms["form1"]["Gender"].value;
               let age = document.forms["form1"]["age"].value;
               let location = document.forms["form1"]["current_location"].value;
        
               if(FirstName==""){
                  alert("enter frist name");
                   return false;
                }
                else if(LastName==""){
                    alert("enter your last name");
                    return false;
                }
                else if(Mail==""){
                    alert("enter your mail id"); 
                    return false;
                }
                else if(!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(Mail)){
                    alert('please give Valid mail .');
                    return false;
                }
                else if(gender==""){
                    alert("please choose your gender"); 
                    return false;
                }
                else if(age==""){
                    alert("enter your age"); 
                    return false;
                }
                else if(/[^0-9]|^0+(?!$)/g.test(age)){
                    alert("enter your numeric age"); 
                    return false;
                }
                else if(location==""){
                    alert("enter your location"); 
                    return false;
                }
                else{
                    return true;
                }
                    
            }
        </script> 
        <cfif structKeyExists(form, 'submit')>  

            <cfset datObj.insertData( fname=form.fname, lname=form.lname, 
             email=form.mail,Gender=form.Gender,age=form.age,current_location=form.current_location)>
            <cflocation url="list.cfm" addtoken="false">  
            
            <cfif structKeyExists(url, 'id')>
                <cfset Userinfo = datObj.deleteData("#url.id#")> 
            </cfif>        
        </cfif>
</cfoutput>           
            

   