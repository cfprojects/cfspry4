
<html>

<head>
<title>Accordion Demo</title>
</head>

<body>

<cf_accordion id="demo1">

	<cf_page title="Page One">
	This is the content for the first accordion panel.
	</cf_page>
	
	<cf_page title="Page Two">
	This is the second page with some dynamic content, <cfoutput>#timeFormat(now())#</cfoutput>
	</cf_page>
	
</cf_accordion>

<p>
<hr>
<p>

<cf_accordion id="demo2" width="500px" panelheight="600px">

	<cf_page title="Page One Demo Two">
	This is the content for the first accordion panel. Second Demo.
	</cf_page>
	
	<cf_page title="Page Two Demo 2">
	This is the second page with some dynamic content, <cfoutput>#dateFormat(now())#</cfoutput>
	</cf_page>
	
</cf_accordion>

</body>
</html>