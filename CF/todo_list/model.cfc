<cfcomponent>
    <cffunction name="insertdata" access="remote" returnformat="json">
        <cfargument name="notes" type="string" required="true" >
        <cfargument name="isactive" type="string" required="true" >
        <cfargument name="created_date" type="Date" required="true" >
        
        <cfquery name="todosTable" datasource="abi_dsn">
            insert into todos (notes,isactive,created_date)
            values(
                <cfqueryparam value="#arguments.notes#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.isactive#" cfsqltype="cf_sql_bit">,
                <cfqueryparam value="#arguments.created_date#" cfsqltype="cf_sql_timestamp">
            ) 
        </cfquery>
    </cffunction>

    <cffunction name="getData" access="remote" returnformat="json">
        <cfargument name="notes" type="string" required="false" >
        <cfargument name="isactive" type="boolean" required="false" >
        <cfargument name="created_date" type="Date" required="false" >
      
        <cfquery name="todosTable" datasource="abi_dsn" >
            select * from todos
            where 1 = 1
            <cfif structKeyExists(arguments,"isactive")>
                and isactive = <cfqueryparam value="#arguments.isactive#" cfsqltype="cf_sql_bit">
            </cfif>
        </cfquery>
        <cfset data = QueryToArray(todosTable)>
        <cfreturn data>
    </cffunction>

    <cffunction name="getActiveCount" access="remote" returnformat="json">
        <cfargument name="isactive" type="boolean" required="false" >
        <cfquery name="todosTable" datasource="abi_dsn" >
            select * from todos
            where 1 = 1
            and isactive = 1
        </cfquery>
        <cfset data = QueryToArray(todosTable)>
        <cfreturn data>
    </cffunction>

    <cffunction name="QueryToArray" access="public" returntype="array" output="false" hint="This turns a query into an array of structures.">
        <!--- Define arguments. --->
        <cfargument name="Data" type="query" required="yes" />
        <cfscript>
            // Define the local scope.
            var LOCAL = StructNew();
            // Get the column names as an array.
            LOCAL.Columns = ListToArray( ARGUMENTS.Data.ColumnList );
            // Create an array that will hold the query equivalent.
            LOCAL.QueryArray = ArrayNew( 1 );
            // Loop over the query.
            for (LOCAL.RowIndex = 1 ; LOCAL.RowIndex LTE ARGUMENTS.Data.RecordCount ; LOCAL.RowIndex = (LOCAL.RowIndex + 1)){
                // Create a row structure.
                LOCAL.Row = StructNew();
                // Loop over the columns in this row.
                for (LOCAL.ColumnIndex = 1 ; LOCAL.ColumnIndex LTE ArrayLen( LOCAL.Columns ) ; LOCAL.ColumnIndex = (LOCAL.ColumnIndex + 1)){
                    // Get a reference to the query column.
                    LOCAL.ColumnName = LOCAL.Columns[ LOCAL.ColumnIndex ];
                    // Store the query cell value into the struct by key.
                    LOCAL.Row[ LOCAL.ColumnName ] = ARGUMENTS.Data[ LOCAL.ColumnName ][ LOCAL.RowIndex ];
                }
                // Add the structure to the query array.
                ArrayAppend( LOCAL.QueryArray, LOCAL.Row );
            }
            // Return the array equivalent.
            return( LOCAL.QueryArray );
        </cfscript>
    </cffunction>

    <cffunction name="deleteData" access="remote" returnType="void">
        <!--- <cfargument name="id" type="string" required="true"> --->
        <cfquery name="getIsActive" datasource="abi_dsn">
            select* from todos 
            where isactive = 0
        </cfquery>
        <cfset var="#getIsActive#">
        <cfif getIsActive.RecordCount>
            <cfset findIsactive = valueList(getIsActive.id)>
            <cfdump var="#findIsactive#">
            <cfquery name="todosTable" datasource="abi_dsn">
                DELETE FROM todos
                WHERE Id IN (<cfqueryparam value="#findIsactive#" cfsqltype="cf_sql_integer" list="true">)
            </cfquery>
        </cfif>
    </cffunction> 
 
    <cffunction name="deleteNotes" access="remote" returnType="void">
        <cfargument name="id" type="string" required="true">
        <cfquery name="closeicondelete" datasource="abi_dsn">
            DELETE from todos 
            where ID=<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction> 
    
    <cffunction name="updateData" access="remote" returnType="void">
        <cfargument name="ID" required="true" type="numeric">
        <cfargument name="isactive" required="false" type="boolean">
        <cfargument name="notes" required="false" default="" type="string">
        <cfquery name="updateTbl" datasource = "abi_dsn">
            <cfif structKeyExists(arguments,"isactive")>
                UPDATE todos SET  
                isactive        = <cfqueryparam value="#arguments.isactive#" cfsqltype="cf_sql_bit">,
                updated_date    = <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
                WHERE Id        = <cfqueryparam value="#arguments.ID#" cfsqltype="cf_sql_integer">
            <cfelseif structKeyExists(arguments,"notes")>
                UPDATE todos SET  
                notes           = <cfqueryparam value="#arguments.NOTES#" cfsqltype="cf_sql_varchar">,
                updated_date    = <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
                WHERE Id        = <cfqueryparam value="#arguments.ID#" cfsqltype="cf_sql_integer">
            </cfif> 
        </cfquery>
    </cffunction>
</cfcomponent>    














































































































































    

    