<cfset accountSID="AC5325d2f9a2df92ca9f66c80f09cd164e">
<cfset authToken="3f6a267aa8beed92887f9d26d8f792de">
<cfset message="Hi Dhana ">

<cfhttp method="post" url="https://api.twilio.com/2010-04-01/Accounts/#accountSID#/Messages.json" result="whatsappresult">
    <cfhttpparam  name="Authorization" type="header" value="Basic #toBase64(accountSID & ':' & authToken)#" >
    <cfhttpparam name="From" type="formfield" value="whatsapp:+14155238886">
    <cfhttpparam name="To" type="formfield" value="whatsapp:+919080017386">
    <cfhttpparam  name="Body"type="formfield" value="#message#">
</cfhttp> 

<p align="center">Your message send successfully!!!</p>
<!--- Acess key value-"join happy-chosen" --->






















