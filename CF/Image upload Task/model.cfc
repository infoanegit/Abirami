<cfcomponent>
    <cffunction name="getData" access="public" returnType="query">
        <cfargument name="id" type="string" required="true" default="">
        
        <cfquery name="imageupload" datasource="abi_dsn">
             SELECT * FROM imagefile
             <cfif len(arguments.id)>
                where id=<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
             </cfif>
        </cfquery>
        <cfreturn imageupload />
    </cffunction>
    <cffunction name="insertData" access="public" returnType="void">
        <cfargument name="imagename" type="string" required="true" default="">
        <cfargument name="desc" type="string" required="true" default="">
        <cfargument name="upload" type="string" required="true" default="">
        
        <cfquery name="insertQry" datasource="abi_dsn">
            INSERT INTO imagefile (imagename,description,image)
            VALUES ( 
                <cfqueryparam value="#arguments.imagename#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.desc#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.upload#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
    </cffunction>       
</cfcomponent>        