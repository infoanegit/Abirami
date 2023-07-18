<cfcomponent>
    <cffunction name="getData" access="public" returnType="query">
        <cfargument name="id" type="string" required="true" default="">

        <cfquery name="cruduserdata" datasource="abi_dsn">
             SELECT * FROM userdata
             <cfif len(arguments.id)>
                where id=<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
             </cfif>
        </cfquery>

        <cfreturn cruduserdata />
    </cffunction>

    <cffunction name="insertData" access="public" returnType="void">
            <cfargument name="fname" type="string" required="true" default="">
            <cfargument name="lname" type="string" required="true" default="">
            <cfargument name="email" type="string" required="true" default="">
            <cfargument name="gender" type="string" required="true" default="">
            <cfargument name="age" type="string" required="true" default="">
            <cfargument name="current_location" type="string" required="true" default="">

            <cfquery name="insertQry" datasource="abi_dsn">
                INSERT INTO userdata (firstname, lastname, mail, gender, age, current_location)
                VALUES ( 
                    <cfqueryparam value="#arguments.fname#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.lname#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.age#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.current_location#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
    </cffunction>

    <cffunction name="deleteData" access="public" returnType="void">
        <cfargument name="id" type="string" required="true" default="">

        <cfquery name="cruduserdata" datasource="abi_dsn">
            DELETE from userdata where id=<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>
</cfcomponent>





