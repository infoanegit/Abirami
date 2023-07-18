<cfset imageobj = createObject( 'component', 'model') />

    <cfif structKeyExists(form, 'submit')>  
        <cfif NOT directoryExists("#expandPath('./assets/images')#")>
            <cfset directoryCreate("#expandPath('./assets/images')#")>
        </cfif>
        <cfif NOT directoryExists("#expandPath('./assets/thumbnail')#")>
            <cfset directoryCreate("#expandPath('./assets/thumbnail')#")>
        </cfif>
        <cffile action="upload" destination="#expandPath('./assets/images')#" result = "choosefile" filefield="form.upload" nameconflict="overwrite">
        <cfset imageobj.insertData(imagename=form.imagename, desc=form.desc, upload=choosefile.serverFile)>
    </cfif>

    <cfif structKeyExists(url, 'id')>
        <cfset imagefile = imageobj.createObject("#url.id#")> 
    </cfif> 

<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <title>Image upload</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="./assets/css/bootstrap.css" rel="stylesheet">
            <link rel = "stylesheet" href="./assets/css/style.css">  
            <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>   
        </head>
        <body class="style">
            <div class="container w-25 mx-auto p-4 mt-3 text-center colors">
                <form  method="post" id="form" name="formtest"  enctype="multipart/form-data">
                    <p ><h1>Image Function and upload</h1></p><hr>
                    <div class="row mt-3 form-group">
                            <label for="imagename" id="image"><b>Image name</b></label>
                            <input type="text" id="iname" name="imagename" class="form-control">
                    </div>   
                    <div class="row mt-3"> 
                            <label for = "bio" id="desc"><b>Description</b></label><br>
                            <textarea rows="3" id="bio" name="desc"></textarea>  
                    </div>
                    <div class="row  mt-3">
                            <label for = "uploadimage" ><b>Upload your file</b></label>
                            <input type="file" id="uploadimage"class="form-control" name="upload" value="upload">
                    </div>  
                    <div class="mt-3">
                        <a href="list.cfm" class ="btn btn-primary" name="list">List</a>
                        <button type="submit" class="btn btn-danger" name="submit" value="Upload" id="uploadimg">Upload</button>
                    </div>        
                </form>  
            </div>
        </body>
    </html>    
</cfoutput>  
<script>
    $(function(){   
        $("form").submit(function(){      
            var imageName = $("#iname").val();
            var Desc=$('#bio').val();
            var filename=$('#uploadimage').val(); 
            var extension = filename.substr(filename.lastIndexOf(".")); 
            var allowedExtensionsRegx = /(\.jpg|\.jpeg|\.png)$/i;
            var isAllowed = allowedExtensionsRegx.test(extension);

        
            if(imageName==""){
                alert("please enter your image name");
                return false;
            } 
            else if(!/^[a-zA-Z]*$/g.test(imageName)){
                alert('Valid image name is given.');
                return false;   
            }  
            else if(Desc==""){
                alert("please enter your description");
                return false;
            }
            else if(!/^[a-zA-Z ]*$/g.test(Desc)){
                alert('please give a valid describtion');
                return false;   
            } 
            else if(isAllowed==false){
                alert("please choose your valid image file");
                return false;
            }  
            else 
            {
                alert("Imagefile upload successfully");
                return true;
            }  
        });
    });
</script>          
     

