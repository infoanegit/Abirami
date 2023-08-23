<cfoutput>
    <cfhttp method="get" charset="utf-8"  url="http://api.ipstack.com/#form.usr#" result="result">
        <cfhttpparam name="access_key" type="url" value="eedd091431d61ba1fd0533ff765aab24">
    </cfhttp>
     <!--- <cfdump var="#result#">  --->
    <cfset systemipabout=deserializeJSON(result.Filecontent)>
    <cfset systemipabout1="#systemipabout.location#">
    <!--- <cfdump var="#systemabout1#"> --->
    <table class="table table-bordered w-50 table-fixed mx-auto text-center mt-2">
        <thead class="table-secondary">
            <tr>
                <th>list of ip</th>
                <th>values</th>
            </tr>
        </thead>
        <tbody> 
            <cfloop collection ="#systemipabout#" item="value">
                <cfif value NEQ "location">
                    <tr class="table-primary bg-info text-secondary"> 
                        <td>#value#</td>
                        <td>#systemipabout[value]#</td>
                    </tr>
                <cfelseif value NEQ "languages">
                    <cfloop collection ="#systemipabout.location#" item="value1">
                        <cfif value1 NEQ "languages">
                            <tr class="table-primary bg-info text-secondary">
                                <td>#value1#</td>
                                <td>#systemipabout.location[value1]#</td>
                            </tr> 
                        </cfif> 
                    </cfloop>  
                <cfelseif value EQ "languages">
                    <cfloop collection ="#systemipabout.location#" item="value2">
                        <cfif value1 EQ "languages">
                            <tr class="table-primary bg-info text-secondary">
                                <td>#value2#</td>
                                <td>#systemipabout.location[value2]#</td>
                            </tr> 
                        </cfif> 
                    </cfloop>            
                </cfif>    
            </cfloop>
        </tbody>  
    </table>   
    <!--- <cfdump var="#systemabout1#">        --->
</cfoutput>





