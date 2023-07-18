$(function(){
    <script src = "./assets/js/index.js"></script>
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
        else if(!/^[a-zA-Z]*$/g.test(Desc)){
            alert('please give a valid describtion');
            return false;   
        } 
        else if(isAllowed==false){
            alert("please choose your valid image file");
            return false;
        }  
        else 
        {
            return true;
        }  
    });
});