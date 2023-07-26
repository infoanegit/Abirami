$(document).ready(function(){
    $('.textcolor').each(function() {
        if( $(this).text().includes("Sunday") ){
            $(this).css("color","red");
        }
        else if( $(this).text().includes("Monday") ){
            $(this).css("color","green");
        }
        else if( $(this).text().includes("Tuesday") ){
            $(this).css("color","orange");
        }
        else if( $(this).text().includes("Wednesday") ){
            $(this).css("color","yellow");
        }
        else if( $(this).text().includes("Thursday") ){
            $(this).css("color","bold black");
        } 
        else if( $(this).text().includes("Friday") ){
            $(this).css("color","blue");
        }      
        else if( $(this).text().includes("Saturday") ){
            $(this).css("color","bold red");
        }   
    });
});