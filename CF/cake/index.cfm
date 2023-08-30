<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <title>Cake</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="./assets/css/bootstrap.css" rel="stylesheet">
            <link rel = "stylesheet" href="./assets/css/style.css">  
            <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>   
        </head>
        <body class="bg">
            <div class="text-center mx-auto text-success w-50 ">
                <h3><b>Order your CAKE!!!</b></h3>
            </div>
            <div class="text-center mx-auto mt-1 w-50  ">
                <div><img src="./assets/image/cake.png" width="20%" height="20%"></div>
                <input type="radio"id="cake1" value="20" name="cakesize">
                <label for="cake1" class="text-danger"><h6><b>Round Cake 6" - serves 8 people($20)</b></h6></label><br>
                <input type="radio"id="cake2" value="25" name="cakesize">
                <label for="cake2" class="text-danger"><h6><b>Round Cake 8" - serves 12 people($25)</b></h6></label><br>
                <input type="radio"id="cake3" value="35" name="cakesize">
                <label for="cake3" class="text-danger"><h6><b>Round Cake 10" - serves 16 people($35)</b></h6></label><br>
                <input type="radio"id="cake4" value="75" name="cakesize">
                <label for="cake4" class="text-danger"><h6><b>Round Cake 12" - serves 30 people($75)</b></h6></label><br>
            </div>
            <div class="text-center mx-auto  w-25 ">
                <label for="cakeflavour"><h3>Choose your cakeflavour</h3></label>
                <select name="cakeflavour" id="cakeflavour">
                    <option name="default" value="0">Default($0)</option>
                    <option name="lemon" value="10">Lemon($10)</option>
                    <option name="greengrap" value="15">Grap($15)</option>
                    <option name="blackcurrant" value="30">Blackcurrant($30)</option>
                    <option name="blackforest" value="30">Blackforest($30)</option>
                    <option name="cheesecake" value="20">Cheesecake($20)</option>
                    <option name="redvelvet" value="35">Redvelvet($35)</option>
                </select>
            </div>
            <div class="text-center mx-auto  y w-25 ">
                <div><img src="./assets/image/candle.png" width="20%" height="20%"></div>
                <input type="checkbox" id="candle" value="5" >
                <label for="candle"><h6><b>include candles($5)</b></h6></label>
            </div>
            <div class="text-center mx-auto p-3  w-25 ">
                <input type="checkbox" id="inscriptioncheckbox" value="20" >
                <label for="inscription" ><h6><b>include inscription($20)</b></h6></label><br>
                <div class="text-center">
                    <input type="text" id="inscription"class="text-center" name="inscription" placeholder="Enter your inscription" style="display:none;width: 100%";>
                </div>
            </div>
            <div class="container mt-2 mb-3 mx-auto w-25 text-center">
                <h5 class="text-secondary">Total amount for the order cake:</h5>
                <h3 id="display" class="text-warning">$0</h3>
            </div>
        </body>
    </html>
</cfoutput> 
<script>
    var cakesize = 0;
    var cakeflavor = 0;
    var candle = 0;
    var inscription = 0;
    var sum_value= 0;

    $('input[type=radio]').change(function () {
        sum_value +=+$(this).val();
    });
    $('#cakeflavour').change(function () {
        sum_value +=+$(this).val();
    });
    $('#candle').change(function () {
        if ($('#candle').is(":checked")) {
            sum_value +=+$(this).val();
        } else {
             candle = 0;
        }
    });
    $('#inscriptioncheckbox').change(function () {
        if ($('#inscriptioncheckbox').is(":checked")) {
            sum_value +=+$(this).val();
            $('#inscription').css("display","block");
        } else {
            $('#inscription').css("display","none")
             candle = 0;
        }
    });
    $(document).on('change', function () {
        $("#display").html('$' + sum_value);
    });
</script>
<style>
    .bg {
        background-image: url("./assets/image/cakeshop.jpg");
        height: 100%;
        background-position: center center;
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment: fixed;
    }
</style>
