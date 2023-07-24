component {
    this.name="gtfdcghhhg";
    this.sessionManagement = true ;
    
    function onRequestStart(){
         if (not isDefined("session.userrole") && listlast(cgi.SCRIPT_NAME,"/") == "list.cfm" )
         {
            location("index.cfm", "false");
         }
         else if(not isdefined("session.userrole") && listlast(cgi.SCRIPT_NAME,"/") == "add.cfm" ) 
         {
             location("index.cfm", "false");
         }
        else if(isdefined("session.userrole") && (session.userrole =="editor" || session.userrole =="admin" ) && listlast(cgi.SCRIPT_NAME,"/") == "index.cfm")
         {
            location("list.cfm", "false");
         }
         else if(isdefined("session.userrole") && (session.userrole =="user" ) && listlast(cgi.SCRIPT_NAME,"/") == "add.cfm")
         {
            location("list.cfm", "false");
         }
         else if(isdefined("session.userrole") && (session.userrole =="user" ) && listlast(cgi.SCRIPT_NAME,"/") == "index.cfm")
         {
            location("list.cfm", "false");
         }

    }
 }  
