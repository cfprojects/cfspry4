<cfsetting enablecfoutputonly="true">

<cfif not thisTag.hasEndTag>
	<cfthrow message="panel.cfm must contain an end tag">
</cfif>

<cfparam name="attributes.id" type="variableName">

<cfparam name="attributes.title" type="string" default="">
<cfparam name="attributes.opened" type="boolean" default="true">
<cfparam name="attributes.animate" type="boolean" default="true">
<cfparam name="attributes.scriptSrc" type="string" default="js/SpryCollapsiblePanel.js">
	
<cfif not fileExists(expandPath(attributes.scriptSrc))>
	<cfthrow message="scriptSrc file does not exist">
</cfif>
	
<cfif thisTag.executionMode is "end">

	<cfif not structKeyExists(request, "cfspry")>
		<cfset request.cfspry = structNew()>
	</cfif>
	
	<cfif not structKeyExists(request.cfspry, "panelloaded")>
		<cfhtmlhead text="<script src=""#attributes.scriptSrc#""></script>">
		<cfset request.cfspry.panelloaded = 1>
	</cfif>

	<cfoutput>
<style>
.#attributes.id#_CollapsiblePanel {
	margin: 0px;
	padding: 0px;
	width: 300px;
	font-size: 12px;
	border-left: solid 1px ##CCC;
	border-right: solid 1px ##999;
}

.#attributes.id#_CollapsiblePanelTab {
	background-color: ##DDD;
	border-top: solid 1px ##999;
	border-bottom: solid 1px ##CCC;
	margin: 0px;
	padding: 2px;
	cursor: pointer;
	-moz-user-select: none;
	-khtml-user-select: none;
	font-family: sans-serif;
	font-size: 12px;
	font-weight: bold;
}

.#attributes.id#_CollapsiblePanelContent {
	margin: 0px;
	padding: 0px;
	
	border-bottom: solid 1px ##CCC;
}

.#attributes.id#_CollapsiblePanelTab a {
	color: black;
	text-decoration: none;
}

.#attributes.id#_CollapsiblePanelOpen .#attributes.id#_CollapsiblePanelTab {
	background-color: ##EEE;
}

.#attributes.id#_CollapsiblePanelTabHover,  .#attributes.id#_CollapsiblePanelOpen .#attributes.id#_CollapsiblePanelTabHover {
	background-color: ##CCC;
}

.#attributes.id#_CollapsiblePanelFocused .#attributes.id#_CollapsiblePanelTab {
	background-color: ##3399FF;
}

</style>

<div id="#attributes.id#" class="#attributes.id#_CollapsiblePanel">
  <div class="#attributes.id#_CollapsiblePanelTab">#attributes.title#</div>
  <div class="#attributes.id#_CollapsiblePanelContent">#thisTag.generatedContent#</div>
</div>

<script language="JavaScript" type="text/javascript">
var #attributes.id# = new Spry.Widget.CollapsiblePanel("#attributes.id#", {contentIsOpen:#attributes.opened#, enableAnimation:#attributes.animate#});</script>
	</cfoutput>

	<cfset thisTag.generatedContent = "">
</cfif>


<cfsetting enablecfoutputonly="false">

