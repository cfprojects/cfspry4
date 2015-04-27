<cfsetting enablecfoutputonly="true">

<cfif not thisTag.hasEndTag>
	<cfthrow message="page.cfm must contain an end tag">
</cfif>

<cfif not structKeyExists(attributes, "title")>
	<cfset attributes.title = "">
</cfif>

<!--- 
The page tag can be used with a set of parents. Here is the
list of valid parents. As CFSpry is updated, I'll update this.
--->
<cfset validParents = "cf_tab,cf_accordion">
<cfset myparents = getBaseTagList()>

<!--- Loop from immidiate parent till I find a valid one. --->
<cfloop index="myparent" list="#myparents#">
	<cfif listFindNoCase(validParents, myparent)>
		<cfset parent = myparent>
		<cfbreak>
	</cfif>
</cfloop>

<cfif not structKeyExists(variables, "parent")>
	<cfthrow message="cf_page may ony be used within the following tags: #validParents#">
</cfif>

<!---
<!--- I'm on the list as item 1, so remove it. --->
<cfset myparents = listRest(myparents)>
<!--- now test to get item 1 --->
<cfif myparents is "" or not listFindNoCase(validParents, listFirst(myparents))>
	<cfthrow message="cf_page may ony be used within the following tags: #validParents#">
<cfelse>
	<cfset myparent = listFirst(myparents)>
</cfif>
--->


<cfif thisTag.executionMode is "end">
	<cfassociate baseTag="#parent#" dataCollection="pages">

	<cfif not structKeyExists(attributes, "content")>
		<cfset attributes.content = thisTag.generatedContent>
		<cfset thisTag.generatedContent = "">
	</cfif>
	
</cfif>

<cfsetting enablecfoutputonly="false">
