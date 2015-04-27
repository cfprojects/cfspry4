<cfsetting enablecfoutputonly="true">

<cfif not thisTag.hasEndTag>
	<cfthrow message="tab.cfm must contain an end tag">
</cfif>

<cfparam name="attributes.id" type="variableName">

<cfparam name="attributes.vertical" type="boolean" default="false">
<cfparam name="attributes.selected" type="numeric" default="1">
<cfparam name="attributes.width" type="string" default="500px">
<cfparam name="attributes.verticaltabwidth" type="string" default="10em">
<cfparam name="attributes.scriptSrc" type="string" default="js/SpryTabbedPanels.js">

<cfif not fileExists(expandPath(attributes.scriptSrc))>
	<cfthrow message="scriptSrc file does not exist">
</cfif>	

<cfif thisTag.executionMode is "end">

	<!--- If no pages, do nothing. --->
	<cfif not structKeyExists(thisTag, "pages") or not arrayLen(thisTag.pages)>
		<cfexit method="exitTag">
	</cfif>
	<cfif not structKeyExists(request, "cfspry")>
		<cfset request.cfspry = structNew()>
	</cfif>
	
	<cfif not structKeyExists(request.cfspry, "tabloaded")>
		<cfhtmlhead text="<script src=""#attributes.scriptSrc#""></script>">
		<cfset request.cfspry.tabloaded = 1>
	</cfif>

	<cfoutput>
<style>
.#attributes.id#_TabbedPanels {
	margin: 0px;
	padding: 0px;
	clear: both;
	width: #attributes.width#; /* IE Hack to force proper layout when preceded by a paragraph. (hasLayout Bug)*/
}

.#attributes.id#_TabbedPanelsTabGroup {
	margin: 0px;
	padding: 0px;
}

.#attributes.id#_TabbedPanelTab {
	position: relative;
	top: 1px;
	float: left;
	padding: 4px 10px;
	margin: 0px 1px 0px 0px;
	background-color: ##DDD;
	list-style: none;
	border-left: solid 1px ##CCC;
	border-bottom: solid 1px ##999;
	border-top: solid 1px ##999;
	border-right: solid 1px ##999;
	-moz-user-select: none;
	-khtml-user-select: none;
	cursor: pointer;
	font-family: sans-serif;
	font-size: 12px;
	font-weight: bold;
}

.#attributes.id#_TabbedPanelTabHover {
	background-color: ##CCC;
}


.#attributes.id#_TabbedPanelTabSelected {
	background-color: ##EEE;
	border-bottom: 1px solid ##EEE;
}

.#attributes.id#_TabbedPanelsContentGroup {
	clear: both;
	border-left: solid 1px ##CCC;
	border-bottom: solid 1px ##CCC;
	border-top: solid 1px ##999;
	border-right: solid 1px ##999;
	background-color: ##EEE;
}

.#attributes.id#_TabbedPanelContent {
	padding: 4px;
}


.#attributes.id#_TabbedPanelTab a {
	color: black;
	text-decoration: none;
}

/* Vertical Tabbed Panels */

.#attributes.id#_VTabbedPanels .#attributes.id#_TabbedPanelsTabGroup {
	float: left;
	width: #attributes.verticaltabwidth#;
	height: 20em;
	background-color: ##EEE;
	position: relative;
	border-top: solid 1px ##999;
	border-right: solid 1px ##999;
	border-left: solid 1px ##CCC;
	border-bottom: solid 1px ##CCC;
}

.#attributes.id#_VTabbedPanels .#attributes.id#_TabbedPanelTab {
	float: none;
	margin: 0px;
	border-top: none;
	border-left: none;
	border-right: none;
}

.#attributes.id#_VTabbedPanels .#attributes.id#_TabbedPanelTabSelected {
	background-color: ##EEE;
	border-bottom: solid 1px ##999;
}

.#attributes.id#_VTabbedPanels .#attributes.id#_TabbedPanelsContentGroup {
	clear: none;
	float: left;
	padding: 0px;
	width: #attributes.width#;
	height: 20em;
}
</style>

<div class="#attributes.id#_<cfif attributes.vertical>V</cfif>TabbedPanels" id="#attributes.id#">
<ul class="#attributes.id#_TabbedPanelsTabGroup">
	</cfoutput>
	
	<cfloop index="x" from="1" to="#arrayLen(thisTag.pages)#">
		<cfoutput>
<li class="#attributes.id#_TabbedPanelTab" tabindex="0">#thisTag.pages[x].title#</li>
		</cfoutput>
	</cfloop>
	<cfoutput>
</ul>

<div class="#attributes.id#_TabbedPanelsContentGroup">
	</cfoutput>
		<cfloop index="x" from="1" to="#arrayLen(thisTag.pages)#">
		<cfoutput>
	<div class="#attributes.id#_TabbedPanelContent">#thisTag.pages[x].content#</div>
		</cfoutput>
	</cfloop>	
	<cfoutput>
</div>
</div>
<script language="JavaScript" type="text/javascript">
var #attributes.id# = new Spry.Widget.TabbedPanels("#attributes.id#", { defaultTab: #attributes.selected-1#, 
	tabHoverClass:"#attributes.id#_TabbedPanelTabHover", 
	tabSelectedClass:"#attributes.id#_TabbedPanelTabSelected",
	tabFocusedClass:"#attributes.id#_TabbedPanelTabFocused",
	panelVisibleClass:"#attributes.id#_TabbedPanelContentVisible"	
	 });
</script>
	</cfoutput>

</cfif>

<cfsetting enablecfoutputonly="false">

