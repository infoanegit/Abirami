<cfcomponent>
    <cffunction name="getData" access="public" returnType="query">

        <cfquery name="usersignindata" datasource="abi_dsn">
             SELECT * FROM user
        </cfquery>
        <cfreturn usersignindata.recordcount />
    </cffunction>

    <cffunction name="insertData" access="public" returnType="void">
        <cfargument name="userName" type="string" required="true" default="">
        <cfargument name="password" type="string" required="true" default="">
      
        <cfquery name="insertQry" datasource="abi_dsn">
            INSERT INTO [user] ( user_name,user_password)
            VALUES ( 
                <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>    
    </cffunction>

    <cffunction name="checkLogin" access="public" returnType="query">
        <cfargument name="userName" type="string" required="true" default="">
        <cfargument name="password" type="string" required="true" default="">
    
        <cfquery name="checklogin" datasource="abi_dsn">
            SELECT user_name, user_password 
            FROM [user]
            WHERE user_name = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
            AND  user_password  = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
        </cfquery>  
        <cfreturn checklogin />
    </cffunction>  
</cfcomponent>