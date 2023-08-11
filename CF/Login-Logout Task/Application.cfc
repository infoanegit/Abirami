component {
    this.name="test11gh12";
    this.sessionManagement = true ;
    this.datasource = "abi_dsn";
    
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

         