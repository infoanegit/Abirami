<cfoutput>
    <head>
        <title>toDo</title>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <link href="./assets/css/bootstrap.css" rel="stylesheet"> 
         <style>
            .footer button:focus{
                font-size:18px !important;
                box-shadow: rgb(227, 16, 16) 0 -2px 5px 1px;
            }
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-sm-6 offset-sm-3">
                <h1 class="text-danger text-center">todos</h1>
                <div class="row">
                    <div class="col-sm-8 offset-sm-2">
                        <input type="text" name="textbox" id="quest" class="form-control" placeholder="What needs to be done?">
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-8 offset-sm-2 TobeAppend">
                        <div class="addNotes">
                            <!--- <div class="row">
                                <div class="col-sm-1">
                                    <input type="checkbox"  name="textbox" class="form-check-input mt-2" />
                                </div>
                                <div class="col-sm-10">
                                    <!--- <input type="text" name="textbox" class="form-control" placeholder="What needs to be done?"> --->
                                    <div class="mt-1">Test</div>
                                </div>
                                <div class="col-sm-1">
                                    <button type="button" id="closeicon" class="btn-close mt-2" aria-label="Close"></button>
                                </div>
                            </div> --->
                        </div>
                    </div>
                </div>
                <div class="row footer" style="display:none;">
                    <div class="col-sm-8 offset-sm-2">
                        <div class="row">
                            <div class="col-sm-3">
                                <button type="button" class="btn btn-default" value=""><label class="activeCount">0</label> items left</button>
                            </div>
                            <div class="col-sm-1">
                                <button type="button" class="btn btn-default" id="allbtn">All</button>
                            </div>
                            <div class="col-sm-1">
                                <button type="button" class="btn btn-default" id="activebtn" onclick="checkActive()">Active</button>
                            </div>
                            <div class="col-sm-2 offset-sm-1">
                                <button type="button" class="btn btn-default" id="completebtn">Completed</button>
                            </div>
                            <div class="col-sm-4">
                                <button type="button" class="btn btn-default " id="clearbtn" style="display:none;">Clear completed</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <div>
</cfoutput>
<script>
// to begin load the notes and footer show button
    $( document ).ready(function() {
        $('.footer').css("display","block");
        $.ajax({
            type: "get",
            url: "model.cfc",
            data: {
                method:'getdata'
            },
            success:function(obj) {
                $('.addNotes').empty();
                let data = jQuery.parseJSON(obj);
                if (data.length == 0){
                    $('.footer').css("display","none");
                }
                for (let i = 0; i < data.length; ++i) {
                    var status_check = data[i].ISACTIVE;
                    var html = '<div class="row"><div class="col-sm-1"><input type="checkbox" name="textbox" data-isactive='+ data[i].isactive +' data-Ntid='+ data[i].ID +' class="form-check-input mt-2 chooseNotes" value="'+ data[i].ID +'" ' + (status_check == '0' ? 'checked' : '') + '/></div><div class="col-sm-10"><div data-Ntid='+ data[i].ID +'  class="mt-1 editEvents">'+ data[i].NOTES +'</div></div><div class="col-sm-1"><button type="button" id="closeicon" class="btn-close mt-2" aria-label="Close" value="'+ data[i].ID +'"></button></div></div>';
                    $('.addNotes').append(html);
                }
                $("#quest").val('');
                getOnlyActiveItems();
                setTimeout(function() {
                    var activeItems = sessionStorage.getItem("activeItems");
                    $('.activeCount').text(activeItems);
                    deleteItems();
                },1000 
                )
            }
        });
    });
    // footer button show/hide 
    function buttonshow(keycode) {
        if(keycode == '13') {
            $('.footer').css("display","block");
        }else{
            $('.footer').css("display","none");
        }
     }
    //  enter key press event
   $('#quest').keypress(function(event){
        var keycode = (event.keyCode ? event.keyCode : event.which);
        var Notetext = $("#quest").val();
        var activestate = "1";
        var date =new Date();
        var date1 =" ";
        if(keycode == '13'){
            if(Notetext !=""){
                $.ajax({
                    type: "POST",
                    url: "model.cfc",
                    data: {
                        method:'insertdata',
                        notes:Notetext ,
                        isactive:activestate,
                        created_date:date
                    },
                    success:function(obj) {
                        $('.addNotes').empty();
                        $.ajax({
                            type: "get",
                            url: "model.cfc",
                            data: {
                                method:'getdata'
                            },
                            success:function(obj) {
                                let data = jQuery.parseJSON(obj);
                                for (let i = 0; i < data.length; ++i) {
                                    var status_check = data[i].ISACTIVE;
                                    var html = '<div class="row"><div class="col-sm-1"><input type="checkbox" name="textbox" data-isactive='+ data[i].isactive +' data-Ntid='+ data[i].ID +' class="form-check-input mt-2 chooseNotes" value="'+ data[i].ID +'" ' + (status_check == '0' ? 'checked' : '') + '/></div><div class="col-sm-10"><div data-Ntid='+ data[i].ID +'  class="mt-1 editEvents">'+ data[i].NOTES +'</div></div><div class="col-sm-1"><button type="button" id="closeicon" class="btn-close mt-2" aria-label="Close" value="'+ data[i].ID +'"></button></div></div>';
                                    $('.addNotes').append(html);
                                }
                                $("#quest").val('');
                                buttonshow(keycode);
                                getOnlyActiveItems();
                                clearcmpltbtnshow()
                                setTimeout(function() {
                                    var activeItems = sessionStorage.getItem("activeItems");
                                    $('.activeCount').text(activeItems);
                            }, 1000)
                            }
                        });
                    }
                });
            }
        }
    });
    // checkAll
    $('#allbtn').on('click', function() {
        $.ajax({
            type: "get",
            url: "model.cfc",
            data: {
                method:'getdata'
            },
            success:function(obj) {
                $('.addNotes').empty();
                let data = jQuery.parseJSON(obj);
                for (let i = 0; i < data.length; ++i) {
                    var status_check = data[i].ISACTIVE;
                    var html = '<div class="row"><div class="col-sm-1"><input type="checkbox" name="textbox" data-isactive='+ data[i].isactive +' data-Ntid='+ data[i].ID +' class="form-check-input mt-2 chooseNotes" value="'+ data[i].ID +'" ' + (status_check == '0' ? 'checked' : '') + '/></div><div class="col-sm-10"><div data-Ntid='+ data[i].ID +'  class="mt-1 editEvents">'+ data[i].NOTES +'</div></div><div class="col-sm-1"><button type="button" id="closeicon" class="btn-close mt-2" aria-label="Close" value="'+ data[i].ID +'"></button></div></div>';
                    $('.addNotes').append(html);
                }
                $("#quest").val('');
                getOnlyActiveItems();
                setTimeout(function() {
                    var activeItems = sessionStorage.getItem("activeItems");
                    $('.activeCount').text(activeItems);
                }, 1000)
            }
        });
    });
    // Changed Isactive 0
    $('.addNotes').on("click",".chooseNotes",function() {
        clearcmpltbtnshow();
        var ntId = $(this).attr('data-Ntid');
        if(this.checked){
            ischecked = 0;
        }else{
            ischecked = 1;
        }
        $.ajax({
            type: "POST",
            url: "model.cfc",
            data: {
                method:'updateData',
                ID:ntId ,
                isactive:ischecked
            },
            success:function(obj1) {
                getOnlyActiveItems();
                setTimeout(function() {
                    var activeItems = sessionStorage.getItem("activeItems");
                    $('.activeCount').text(activeItems);
                }, 1000)
            }
        });
    });
    // checkIsActive 0
    $('#completebtn').on('click', function() {
        clearcmpltbtnshow()
        $.ajax({
            type: "get",
            url: "model.cfc",
            data: {
                method:'getdata',
                isactive:0
            },
            success:function(obj) {
                $('.addNotes').empty();
                let data = jQuery.parseJSON(obj);
                for (let i = 0; i < data.length; ++i) {
                    var html = '<div class="row"><div class="col-sm-1"><input type="checkbox" name="textbox" data-isactive='+ data[i].isactive +' data-Ntid='+ data[i].ID +' class="form-check-input mt-2 chooseNotes" value="'+ data[i].ID +'" checked/></div><div class="col-sm-10"><div data-Ntid='+ data[i].ID +'  class="mt-1 editEvents">'+ data[i].NOTES +'</div></div><div class="col-sm-1"><button type="button" id="closeicon" class="btn-close mt-2" aria-label="Close" value="'+ data[i].ID +'"></button></div></div>';
                    $('.addNotes').append(html);
                    clearcmpltbtnshow();
                }
                getOnlyActiveItems();
                setTimeout(function() {
                    var activeItems = sessionStorage.getItem("activeItems");
                    $('.activeCount').text(activeItems);
                    deleteItems();
                }, 1000)
            }
        });
    });
    // checkIsActive 1
    function checkActive() {
        $.ajax({
            type: "get",
            url: "model.cfc",
            data: {
                method:'getdata',
                isactive:1
            },
            success:function(obj) {
                $('.addNotes').empty();
                let data = jQuery.parseJSON(obj);
                for (let i = 0; i < data.length; ++i) {
                    var html = '<div class="row"><div class="col-sm-1"><input type="checkbox" name="textbox"  data-isactive='+ data[i].isactive +' data-Ntid='+ data[i].ID +' class="form-check-input mt-2 chooseNotes" value="'+ data[i].ID +'"/></div><div class="col-sm-10"><div data-Ntid='+ data[i].ID +'  class="mt-1 editEvents">'+ data[i].NOTES +'</div></div><div class="col-sm-1"><button type="button" id="closeicon" class="btn-close mt-2" aria-label="Close" value="'+ data[i].ID +'"></button></div></div>';
                    $('.addNotes').append(html);
                }
                getOnlyActiveItems();
                setTimeout(function() {
                    var activeItems = sessionStorage.getItem("activeItems");
                    $('.activeCount').text(activeItems);
                    deleteItems();
                }, 1000)
            }
        });
    }
    // clear complete button click event
    $('#clearbtn').on('click', function() {
        $.ajax({
            type: "get",
            url: "model.cfc",
            data: {
                method:'deleteData'
            },
            success:function(obj) {
                $('#clearbtn').css("display","none");
                checkActive();
                clearbuttonDatas();
            }
        });
    });
    // close icon click event
    $('.addNotes').on("click","#closeicon",function() {
        var ntId = $(this).val();
        $.ajax({
            type: "get",
            url: "model.cfc",
            data: {
                method:'deleteNotes',
                id:ntId 
            },
            success:function(obj) {
                checkActive();
                getOnlyActiveItems();
                clearbuttonDatas();
            }
        });
    });
    // insertdata
    function getOnlyActiveItems() {
        $.ajax({
            type: "get",
            url: "model.cfc",
            data: {
                method:'getActiveCount',
                isactive:1
            },
            success:function(obj) {
                let data = jQuery.parseJSON(obj);
                sessionStorage.setItem("activeItems", data.length);
            }
        });
    }
    // clearbutton
    function clearbuttonDatas() {
        $.ajax({
            type: "get",
            url: "model.cfc",
            data: {
                method:'getActiveCount',
                isactive:1
            },
            success:function(obj) {
                let data = jQuery.parseJSON(obj);
                if (data.length == 0) {
                    var keycode = 0;
                    buttonshow(keycode);
                }else{
                    sessionStorage.setItem("activeItems", data.length);
                }
            }
        });
    }
    function deleteItems() {
        sessionStorage.clear();
    }
    // clear complete button show/hide
    function clearcmpltbtnshow() {
            if ($('input[type="checkbox"]:checked').length > 0) {
                $('#clearbtn').css("display","block");
            }
            else{
                $('#clearbtn').css("display","none");
            }
    };
    // doubleclick event /update the notes
        $(function () {
            $(".addNotes").on("dblclick", ".editEvents", function(e){
                var ntId = $(this).attr('data-Ntid');
                e.stopPropagation();      //<-------stop the bubbling of the event here
                var currentEle = $(this);
                var value = $(this).html();
                updateVal(currentEle, value,ntId);
            });
        });
        function updateVal(currentEle, value,ntId) {
            $(currentEle).html('<input class="thVal" type="text" value="' + value + '" />');
            $(currentEle).focus();
            $(currentEle).keyup(function (event) {
                if (event.keyCode == 13) {
                    var changetxt = $(".thVal").val();
                    $(currentEle).html($(".thVal").val().trim());
                    // Do Update Data with correct data
                    $.ajax({
                        type: "POST",
                        url: "model.cfc",
                        data: {
                            method:'updateData',
                            ID:ntId,
                            notes:changetxt
                        },
                        success:function(obj1) {
                            checkActive();
                        }
                    });
                }
            });
        }
</script>    
