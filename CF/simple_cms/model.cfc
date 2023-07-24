<cfcomponent>
    <!--- checklogin --->
    <cffunction name="checkLogin" access="public" returnType="query">
        <cfargument name="userName" type="string" required="true" >
        <cfargument name="password" type="string" required="true" >
    
        <cfquery name="checklogin" datasource="abi_dsn">
            SELECT * FROM simplecms
            WHERE username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
            AND  userpwd  = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
        </cfquery>  
        <cfreturn checklogin /> 
    </cffunction>
    <!--- insertData --->
    <cffunction name="insertData" access="public" returnType="void">
        <cfargument name="pagename" type="string" required="true">
        <cfargument name="pagedesc" type="string" required="true">
    
        <cfquery name="insertQry" datasource="abi_dsn">
            INSERT INTO pagetable(pagename,pagedesc)
            VALUES ( 
                <cfqueryparam value="#arguments.pagename#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.pagedesc#" cfsqltype="cf_sql_varchar">
            )
        </cfquery> 
    </cffunction>
    <!--- getdata pagetable --->
    <cffunction name="getData" access="public" returnType="query">
        <cfargument name="id" type="string" required="false" default="" >
        
        <cfquery name="newpagetable" datasource="abi_dsn">
                SELECT * FROM pagetable
                <cfif len(arguments.id)>
                where pageid=<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
                </cfif>
        </cfquery>
        <cfreturn newpagetable />
    </cffunction>
    <!--- deletedata--->
    <cffunction name="deleteData" access="public" returnType="void">
        <cfargument name="id" type="string" required="true">

        <cfquery name="newpagetable" datasource="abi_dsn">
            DELETE from pagetable 
            where pageid=<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction> 
    <!--- updateUserInfo --->
    <cffunction name="updateData" access="public" returnType="void">
        <cfargument name="pagename" type="string" required="true">
        <cfargument name="pagedesc" type="string" required="true">
        <cfargument name="id" type="string" required="true">
            
        <cfquery name="updateTable" datasource="abi_dsn">
            UPDATE pagetable SET 
            pagename =  <cfqueryparam value="#arguments.pagename#" cfsqltype="cf_sql_varchar">,
            pagedesc =  <cfqueryparam value="#arguments.pagedesc#" cfsqltype="cf_sql_varchar">
            WHERE pageid = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>
</cfcomponent>    


