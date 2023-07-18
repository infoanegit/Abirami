component {
    this.name="test11gh1";
    this.sessionManagement = true ;
    
    function onRequestStart(){
         if (not isDefined("session.username") && listlast(cgi.SCRIPT_NAME,"/") == "welcome.cfm" )
         {
            location("index.cfm", "false");
         }
        else if(isdefined("session.username") && listlast(cgi.SCRIPT_NAME,"/") == "index.cfm" ) 
        {
            location("welcome.cfm", "false");
        }
        else if(isdefined("session.username") && listlast(cgi.SCRIPT_NAME,"/") == "signup.cfm" ) 
        {
            location("welcome.cfm", "false");
        }

    }
}  

         