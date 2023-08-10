<cfcomponent>
    <cffunction name="insertdata" access="remote" >
        <cfargument name="UserName" type="string" required="true" >
        <cfargument name="useremail" type="string" required="true" >
    
        <cfquery name="ajaxcalltable" datasource="abi_dsn">
            insert into ajaxcall (username,email)values(
                <cfqueryparam value="#arguments.UserName#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.useremail#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
    </cffunction>
</cfcomponent>
