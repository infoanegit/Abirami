<cfcomponent>
    <cfset this.name=createUUID()>
    <cfset this.ormenabled="true">
    <cfset this.ormsettings={dbcreate="update",datasource="ormframework"}>
</cfcomponent>

