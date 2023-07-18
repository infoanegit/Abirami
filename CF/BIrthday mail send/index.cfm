<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Birthday wishes mail</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="./assets/css/bootstrap.css" rel="stylesheet"> 
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script> 
    </head>
    <body class="colors">
        <div class="container bg-secondary w-25 mx-auto text-center p-5">
            <form  method="post" id="form" name="formtest" enctype="multipart/form-data">
                <div class="text-danger"><h4>Birthday mail send</h4></div><hr>
                <div class="row mt-3 form-group text-info">
                    <label for="bdname" id="name"><b>Birthday Baby Name</b></label>
                    <input type="text" id="bdname" name="bdname" class="form-control">
                </div>  
                <div class="row mt-3 form-group text-info">
                    <label for="bdmail" id="mail"><b>Birthday guy Mailid</b>
                    <input type="text" id="bdmail" name="bdmail" class="form-control">
                </div> 
                <div class="row mt-3 text-info">
                    <label for="wish" id="bio"><b>Birthday Wishes</b>
                    <textarea rows="3" id="wish" name="bdbio"></textarea>         
                </div>
                <div class="row mt-3 text-info">
                    <label for = "uploadimage" ><b>Greeting image</b></label>
                    <input type="file" id="uploadimage" class="form-control" name="upload" value="upload">
                    </div>  
                <div class="mt-3">
                    <button type="submit" class="btn btn-primary" name="submit" value="submit" id="uploadimg">Submit</button>
                </div>        
            </form>
        </div>    
    </body>
    <style>
    .colors{
        background-color: rgb(73, 33, 92);
     }
    </style>
</html> 
 
<script>
    $(function(){   
        $("form").submit(function(){      
            var BirthguyName = $("#bdname").val();
            var Birthdaymailid=$('#bdmail').val();
            var Bdwishes=$('#wish').val();
            var filename=$('#uploadimage').val(); 
            var extension = filename.substr(filename.lastIndexOf(".")); 
            var allowedExtensionsRegx = /(\.jpg|\.jpeg|\.png)$/i;
            var isAllowed = allowedExtensionsRegx.test(extension);

        
            if(BirthguyName==""){
                alert("please enter birthday baby name");
                return false;
            } 
            else if(!/^[a-zA-Z ]*$/g.test(BirthguyName)){
                alert('Valid name is given.');
                return false;   
            } 
            else if(Birthdaymailid==""){
                alert("plese enter your mail id");
                return false;
            }
            else if(!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(Birthdaymailid)){
            alert('please give Valid mail ');
            return false;
            } 
            else if(Bdwishes==""){
                alert("please enter your wishes on birthday wishes");
                return false;
            }
            else if(isAllowed==false){
                alert("please choose your valid greeting file");
                return false;
            }  
            else 
            {
                alert("Mail send successfully");
                return true;
            }  
        });
    });
</script>   

<cfoutput>  
    
        <cfif NOT directoryExists("#expandPath('./assets/images')#")>
            <cfset directoryCreate("#expandPath('./assets/images')#")> 
        </cfif> 
           
        <cfif structKeyExists(form,"submit") >  
            <cfset name=form.bdname>
            <cfset mail=form.bdmail>
        <cffile action="upload" destination="#expandPath('./assets/images')#" result="bdwishes" filefield="form.upload" nameconflict="overwrite">
        <cfmail from="asivakumar@infoane.com" to="#mail#" subject="Happy birthday to #name#" server="localhost">
                <cfimage action="writeToBrowser" source="#expandPath('./assets/images/#bdwishes.serverfile#')#" height="200" width="200">        
        </cfmail>
    </cfif>     
</cfoutput>          
            