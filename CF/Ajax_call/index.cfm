<cfoutput>
    <title>Ajax call</title>
    <head>
    <link href="./assets/css/bootstrap.css" rel="stylesheet"> 
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script> 
    </head>
    <body>
    <div class="container bg-primary w-25 mx-auto text-center p-5">
        <form  method="post" id="formtest" enctype="multipart/form-data">
            <div class="text-danger"><h1>Ajax call</h1><hr></div>
            <div class="row mt-3 text-dark">
                <label for="username"><b>Enter the username</b></label>
                <input type="text" id="username" class="form-control mx-auto" placeholder="Enter your username">
            </div>    
            <div class="row mt-3 text-dark">
                <label for="umail"><b>Enter the user Mailid</b></label>
                <input type="text" id="umail" class="form-control mx-auto" placeholder="Enter your user mail id">
            </div>  
            <div class="row text-center mt-2 p-3">
                <input type="button" value="Subscribe" id="submit" class=" btn btn-warning text-dark " />
            </div>
            <div class="mx-auto text-center">
                <h3 id="display" class="text-info" ></h3>
            </div>
        </from>
    </div>  
    </body> 
    <script>
        $("##submit").on('click', function () {
        var Name = $("##username").val();
        var email = $("##umail").val();
            if($('input[type="text"]').val() == ""){
            $('##display').text('Fill the all above details');
            return false;
            }
                else {
                    $.ajax({
                    type: "POST",
                    url: "model.cfc",
                    data: {
                        method:'insertdata',
                        UserName: Name,
                        Useremail:email
                    },
                    success:function() {
                    alert('successfully inert the from data');
                    }
                });
            }    
        });  
    </script>
</cfoutput>
        
   