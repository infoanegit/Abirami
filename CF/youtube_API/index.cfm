<cfoutput>
    <cfset apiKey="AIzaSyDMtfFb2nplSxcxM2BumF799fK172OLHcg">
    <cfset channelid="UCnZyxD7FbXaknqXh7OPwSEw">
    <cfhttp url="https://www.googleapis.com/youtube/v3/search?key=#apiKey#&channelId=#channelid#" method="get" result="result">
        <!--- <cfhttpparam name="Accept" type="header" value='application/json'>
        <cfhttpparam type="url" name="part" value="snippet"> --->
    </cfhttp>
    <!--- <cfdump var="#result#"> --->
    <cfset youtubedata=deserializeJSON(result.Filecontent)>
    <!--- <cfdump var="#youtubedata#"> --->
    <cfloop collection ="#youtubedata#" item="video">
        <cfif video eq 'items'>
            <cfset count=1>
            <cfloop array="#youtubedata['items']#" index="i">
                <cfif structKeyExists(i["id"], "videoId")>
                    <cfif count EQ 1>
                        <cfset videoid=i["id"].videoid> 
                    </cfif>
                </cfif>   
            </cfloop>
        </cfif>
    </cfloop> 
    <!--- <cfdump var="#videoid#"> --->
    <cfif len(videoid)>
        <iframe width="500" height="300" src="https://www.youtube.com/embed/#videoid#" title="YouTube video player" frameborder="0" ></iframe>
    </cfif>
</cfoutput>
