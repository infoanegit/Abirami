<cfoutput>
    <head>
        <title>Date and time function</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="./assets/css/bootstrap.css" rel="stylesheet"> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script> 
        <script src="./assets/js/style.js" ></script>
     </head>   
    <div class="text-warning text-center mx-auto w-50 ">
        <div class=" bg-secondary"><h1>Date and time function</h1></div><hr>
        <cfset today = now()>
        <!--- get the date format used to the code from now() --->
        <cfset todayDate = createDate(year(today), month(today), day(today))>
        <cfset month= month(today)>
        <!--- Month numeric to convert string --->
        <cfset monthinnumeric=monthAsString(month(today))>
        <!--- first and last day of this month calculation --->
        <cfset firstOfThisMonth = createDate(year(today), month(today), 1)>
        <cfset lastOfNextMonth = dateAdd("d", -1, dateAdd("m", 1, firstOfThisMonth))>
        <!--- last wednesday to this week in date format --->
        <cfset todaydayOfWeek = dayOfWeek(today)>
        <cfset wedOffset = (4-todaydayOfWeek)-7>
        <cfset mostRecentwed = dateAdd("d", wedOffset, today)>
        <cfset lastdayofmonthdaycode = dayOfWeek(lastOfNextMonth)>
        <!--- daysofweek numeric convert to string use the dayOfWeekAsString --->
        <cfset lastdayofmonth=dayOfWeekAsString(lastdayofmonthdaycode)>
    </div>       
        <div class="text-center mx-auto bg-success text-light w-50 p-3">
            <p>Today date=#dateFormat(today,'dd/mm/yyyy')#</p>
            <p>Curtrent Month in numeric=#month#</p>
            <p>Curtrent Month in string=#monthinnumeric#</p>
            <p>Last wednesday in this week=#dateFormat(mostRecentwed,'dd/mm/yyyy')#</p>
            <p>Last day of month= #lastdayofmonth#</p>
        </div>
        <div class="bg-dark text-light text-center mx-auto w-50 p-3"> 
            <h4>Last five date-days in current date</h4>
            <div class="textcolor"><p>#DateFormat(DateAdd('d',-1,Now()), 'dd/mmmm/yyyy-eeee')#</p></div>
            <div class="textcolor"><p>#DateFormat(DateAdd('d',-2,Now()), 'dd/mmmm/yyyy-eeee')#</p></div>
            <div class="textcolor"><p>#DateFormat(DateAdd('d',-3,Now()), 'dd/mmmm/yyyy-eeee')#</p></div>
            <div class="textcolor"><p>#DateFormat(DateAdd('d',-4,Now()), 'dd/mmmm/yyyy-eeee')#</p></div>
            <div class="textcolor"><p>#DateFormat(DateAdd('d',-5,Now()), 'dd/mmmm/yyyy-eeee')#</p></div>
        </div>
</cfoutput>

