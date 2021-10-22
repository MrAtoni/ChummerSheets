<?xml version="1.0" encoding="utf-8" ?>
<!-- Character sheet with fancy blocks for the modularity-->
<!-- Created by AngelForest -->
<!-- Prototype by Adam Schmidt -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
  <xsl:include href="xt.PreserveLineBreaks.xslt"/>
  <xsl:include href="xs.TitleName.xslt"/>
  <xsl:include href="xs.fnx.xslt"/>

  <xsl:output method="html" indent="yes" version="4.0"/>

  <xsl:template match="/characters/character">
    <xsl:variable name="TitleName">
      <xsl:call-template name="TitleName">
        <xsl:with-param name="name" select="name"/>
        <xsl:with-param name="alias" select="alias"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">]]></xsl:text>
    <html>
      <head>
        <meta http-equiv="x-ua-compatible" content="IE=Edge"/>
        <meta charset="UTF-8" />
        <title><xsl:value-of select="$TitleName" /></title>
        <style type="text/css">
		
		/* As hex codes 

			.color-primary-0 { color: #800000 }	<!-- Main Primary color  Colorname: Maroon -->
			.color-primary-1 { color: #C53333 } <!-- Light -->
			.color-primary-2 { color: #A21616 }
			.color-primary-3 { color: #5A0000 }
			.color-primary-4 { color: #330000 } <!-- Dark -->

			.color-secondary-1-0 { color: #803A00 }	<!-- Main Secondary color (Orange) -->
			.color-secondary-1-1 { color: #C57633 } <!-- Light -->
			.color-secondary-1-2 { color: #A25616 }
			.color-secondary-1-3 { color: #5A2900 }
			.color-secondary-1-4 { color: #331700 } <!-- Dark -->

			.color-secondary-2-0 { color: #004D4D }	<!-- Main Secondary color (Blue / Teal) -->
			.color-secondary-2-1 { color: #1F7676 } <!-- Light -->
			.color-secondary-2-2 { color: #0D6161 }
			.color-secondary-2-3 { color: #003636 }
			.color-secondary-2-4 { color: #001E1E } <!-- Dark -->

			.color-complement-0 { color: #006600 }	<!-- Main Complement color (Green) -->
			.color-complement-1 { color: #299E29 }  <!-- Light -->
			.color-complement-2 { color: #128112 }
			.color-complement-3 { color: #004800 }
			.color-complement-4 { color: #002800 }  <!-- Dark -->
		*/
		
			* {
				font-family: "open sans" , Arial, Helvetica, sans-serif;
				font-size: 12px;
				vertical-align: top;
			}
			
			table {
				border-collapse:collapse;
				border:1px solid Maroon;
				width:100%;
			}
			th {
				background-color:Maroon;
				color:white;
				font-size:110%;
			}
			td {
				padding:1px 7px;
			}
			tr:nth-child(odd) {
				background-color:lightgray;
			}
			table,tr,td,td {vertical-align:top;}
			
			
			
			i {
				font-size:100%;
			}
			
			
			
			#pageHead {
				text-align:center;
				border:0;
				margin-bottom:25px;
			}
			#pageHead th {
				font-weight:bold;
				font-size:150%;
				padding:2px;
				background-color:white;
				color:Maroon;
				border-bottom:2px solid Maroon;
			}
			#pageHead td  {
				font-size:90%;
				font-weight:bold;
				background-color:white;
			}
			
			
			.deckTable {
				border-color:black;
				margin:3px 0px;
			}
			.deckTable th {
				background-color:black;
				vertical-align:middle;
				max-width:20%;
			}
			.deckTable td {
				border-right:1px dotted gray;
				text-align:center;
				vertical-align:bottom;
			}
			.deckTable .added {color:black;}
			.deckTable .included {color:gray;}
			
			
			.deckAttributes, .deckCondition 
			{
				background-color:gray;
				vertical-align:top;
			}
			.deckAttributes table, .deckCondition table
			{
				background-color:white;
				border:1px solid black;
			}
			
			.deckAttributes table td
			{
				background-color:white;
				border:1px solid black;
				width:25%;
				vertical-align:bottom;
			}
			.deckAttributes .deckAttHead
			{
				background-color:lightgray;
				border:0px;
				padding:0px;
			}
			
			.deckCondition 
			{
			
			}
			
			
			
			.divBlock50 {
				display:inline-block;
				width: calc(50% - 10px);
			/*	border:1px dashed red;*/
				margin:auto;
			}
			
			.divBlock40 {
				display:inline-block;
				width: calc(40% - 20px);
				margin:auto;
			}
			
			.divDevider
			{
				display:inline-block;
				width:20px;
			/*	border:1px dashed yellow;*/
			}
			
			.divRow {
				margin-bottom:20px;
			}
			
			
			.fontWebding {font-family:Webdings;}
			
			
			
			
			
			
			
			
			.subTable {
				border:1px solid black;
				border-collapse:collapse;
				margin:5px;
				width: calc(100% - 10px);
			}
			.subTable th {
				background-color:black; /*#0D6161;*/
				
			}
			.subTable .subTh {
				background-color:white;
				font-weight:bold;
				font-size:105%;
				color:Maroon;
				border:1px solid white;
				border-bottom:2px solid Maroon;
			}
			.subTable td {
				width:50%;
			}
			
			.subTableDiv {
				display:inline-block; 
			}
			.subTableDiv td {
				width:32%;
				text-align:center;
			}
			
			.modnGearList {
				font-size:80%; 
				background:white; 
				text-align:left;
			}
			
			
			input[type=checkbox] {
			/*	opacity: 0;*/
				display: none;
			}
			.qDiv {
				margin-bottom:20px;
			}
			.qDiv label {
				background-color:yellow;
			}
			label span{
				padding:3px;
				border:4px outset lightgray;
				background-color:lightgray;
				border-radius:5px;
				font-size:110%;
				font-weight:bold;
			}
			label span:hover{
				
				background-color:white;
				border-color:Maroon;
			}
			
			input[type=checkbox]:checked ~ div {
				display: none;
			}
			
			
			
			.cheatSheetTable td {
				border:1px dotted black;
				vertical-align:middle;
			}
			
			.cheatSheetTable td div {
				vertical-align:middle;
			}
			
			
			.cheatSheetTable tr td:first-child {
				font-weight:bold; 
				width:100px;
			}
			.cheatSheetTable tr td:nth-child(2) , .cheatSheetTable tr td:nth-child(3)  {
				text-align:center;
			}
			
			.cheatSheetTable tr td:nth-child(2) {
				width:50px;
			}
			
			.cheatSheetTable tr td:nth-last-child(3) {
				width:120px;
				text-align:center;
				font-weight:bold;
			}
			.cheatSheetTable tr td:nth-last-child(3) div {
				display:inline-block;
			}
			.cheatSheetTable tr td:nth-last-child(3) .roll {
				font-size:0.7em;
				font-weight:normal;
				margin-left:5px;
				line-height: 100%;
			}
			
			.cheatSheetTable tr td:last-child {
				width:35px;
				text-align:center;
			}
			
			
			
			
			.tableFoot {
				background-color:Maroon;
				color:white;
				font-size:0.6em; 
				font-weight:normal;
				text-align:center;
			}
			
			.tableMiniHeader {
				font-size:0.8em;
			}
			
			
			
			@media print
			{
				table	{ page-break-inside:avoid;		page-break-before: auto;}
				tr		{ page-break-inside:avoid; 		page-break-after:avoid; }
				td		{ page-break-inside:avoid; 		page-break-after:avoid; }
				th		{ page-break-inside:avoid; 		page-break-after:avoid; }
				thead	{ display:table-header-group; 	page-break-after:avoid; }
				
				.subTableDiv  { page-break-inside:avoid; page-break-after:auto }
				
				.pageBreak {page-break-after: always;}
				
				.qDiv, .qDiv * {display: none !important;}
			}
        </style>


      </head>

		<body>
			<table id="pageHead">
				<tr>
					<th>Decking Sheet</th>
				</tr>
				<tr>
					<td>
						<xsl:value-of select="$TitleName" />
						
						<xsl:if test="playername != ''">
							- <i><xsl:value-of select="playername"/></i>
						</xsl:if>
					</td>
				</tr>
			</table>
			
			<div class="divRow">
			
			
				
		<!--	CYBERDECKS 		-->	
				<xsl:if test="gears/gear[category_english = 'Cyberdecks']">
				<table>
					<thead>
						<tr>
							<th>Cyberdeck</th>
						</tr>
					</thead>
					
					<tr style="background:white; page-break-inside:auto;"><td style="background:white; page-break-inside:auto;">
					<xsl:for-each select="gears/gear[category_english = 'Cyberdecks']">
						<table class="deckTable">
							<tr>
								<th rowspan="3"><xsl:value-of select="name"/></th>
								<td style="width:40px;">Device Rating</td>
								<td style="width:40px;">A&#x00A0;S&#x00A0;D&#x00A0;F</td>
								<td rowspan="2" class="deckAttributes" style="width:210px;">
									<table>
										<tr>
											<td class="deckAttHead">Attack</td>
											<td class="deckAttHead">Sleaze</td>
											<td class="deckAttHead">Data Proc</td>
											<td class="deckAttHead">Firewall</td>
										</tr>
										<tr>
											<td>&#160;</td>
											<td>&#160;</td>
											<td>&#160;</td>
											<td>&#160;</td>
										</tr>
									</table>
								</td>
								<td rowspan="2" class="deckCondition">
									<table>
										<tr>
											<td>Condition Monitor</td>
										</tr>
										<tr>
											<xsl:variable name="condMoni">
												<xsl:value-of select="conditionmonitor"/>
											</xsl:variable>
											<td class="fontWebding">
												<xsl:for-each select="(//node())[$condMoni >= position()]">
													c
												</xsl:for-each>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><xsl:value-of select="devicerating"/></td>
								<td>
									<xsl:value-of select="attack"/>&#x00A0;<xsl:value-of select="sleaze"/>&#x00A0;<xsl:value-of select="dataprocessing"/>&#x00A0;<xsl:value-of select="firewall"/>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="font-size:0.8em;">
									<xsl:for-each select="children/gear">
										
										<xsl:if test="contains(category_english, 'Programs')">{</xsl:if>
										<xsl:if test="not(contains(category_english, 'Programs'))">[</xsl:if>
										<xsl:if test="contains(category_english, 'Software')"><span style="color:red;">Ꙫ </span></xsl:if>
										<xsl:value-of select="name"/>
											<xsl:if test="rating &gt; 0">&#x00A0;<i>(Rating <xsl:value-of select="rating"/></i>)</xsl:if>
											<xsl:if test="name_english = 'Virtual Machine'">
												<xsl:for-each select="children/gear">
													(<xsl:value-of select="name"/> <xsl:if test="rating &gt; 0">&#x00A0;<i>Rating <xsl:value-of select="rating"/></i></xsl:if>)
												</xsl:for-each>
											</xsl:if>
										<xsl:if test="contains(category_english, 'Programs')">}</xsl:if>
										<xsl:if test="not(contains(category_english, 'Programs'))">]</xsl:if>
										&#8195;
									</xsl:for-each>
									
								</td>
							</tr>
						</table>
					</xsl:for-each>
					</td></tr>
				</table>
				</xsl:if>
			</div>
			
			
			
			
			<div class="divRow" id="divTableAttrSort">
				<table class="cheatSheetTable">
					<thead>
						<tr><th colspan="5">Attack Limit</th><td style="background-color:white;">&#x00A0;</td></tr>
						<tr class="tableMiniHeader">
							<th>Name</th><th>Type</th><th style="width:50px;">Marks</th><th>Test</th><th>Description</th><th>&#x00A0;</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Brute Force</td><td>Complex</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Cybercombat' ]/rating" /></div><div class="roll">Cybercombat&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Willpower&#x00A0;+&#x00A0;Firewall</div></td><td>Place a mark on target, may cause 1 DV per 2 net hits to target. Failure causes damage. Or change grid illegally (see CRB p. 238)</td><td>CRB <br/>p. 238</td>
						</tr>
						<tr>
							<td>Crack File</td><td>Complex</td><td>1</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Hacking' ]/rating" /></div><div class="roll">Hacking&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>(Protection Rating&#x00A0;x2)</div></td><td>Attempt to remove protection from a file if present</td><td>CRB <br/>p. 238</td>
						</tr>
						<tr>
							<td>Crash Program</td><td>Complex</td><td>1</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Cybercombat' ]/rating" /></div><div class="roll">Cybercombat&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Intuition&#x00A0;+&#x00A0;Firewall</div></td><td>Attempt to crash specific program or IC</td><td>CRB <br/>p. 238</td>
						</tr>
						<tr>
							<td>Data Spike</td><td>Complex</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Cybercombat' ]/rating" /></div><div class="roll">Cybercombat&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Intuition&#x00A0;+&#x00A0;Firewall</div></td><td>Deal Matrix Damage equal to (Attack + net hits + marks x2)</td><td>CRB <br/>p. 239</td>
						</tr>
						<tr>
							<td>Denial of Service</td><td>Simple</td><td>Special</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Cybercombat' ]/rating" /></div><div class="roll">Cybercombat&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Willpower&#x00A0;+&#x00A0;Firewall</div></td><td>Target device suffer penalties equal to (net hitsx2). Two devices per mark on PAN</td><td>KC <br/>p. 37</td>
						</tr>
						<tr>
							<td>Erase Mark</td><td>Complex</td><td>Special</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Cybercombat' ]/rating" /></div><div class="roll">Cybercombat&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Willpower&#x00A0;+&#x00A0;Firewall</div></td><td>Attempt to Erase marks either on a target or self</td><td>CRB <br/>p. 239</td>
						</tr>
						<tr>
							<td>Haywire</td><td>Complex</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Cybercombat' ]/rating" /></div><div class="roll">Cybercombat&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Willpower&#x00A0;+&#x00A0;Firewall</div></td><td>Disable all wireless or PAN related functions on PAN</td><td>KC <br/>p. 38</td>
						</tr>
						<tr>
							<td>Jam Signals</td><td>Complex</td><td>Owner</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Electronic Warfare' ]/rating" /></div><div class="roll">Electronic&#x00A0;Warfare&#x00A0;+&#x00A0;Logic</div></td><td>Increases Noise within 100 meters of device.</td><td>CRB <br/>p. 240</td>
						</tr>
						<tr>
							<td>Popup</td><td>Simple</td><td>1</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Cybercombat' ]/rating" /></div><div class="roll">Cybercombat&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Willpower&#x00A0;+&#x00A0;Firewall</div></td><td>Deals (net hits) matrix damage. Target suffers (net hits) penalties</td><td>KC <br/>p. 39</td>
						</tr>
						<tr>
							<td>Squelch</td><td>Simple</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Electronic Warfare' ]/rating" /></div>&#x00A0;<div class="roll">Electronic&#x00A0;Warfare&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Sleaze&#x00A0;+&#x00A0;Intuition</div></td><td>Prevent target from calling or sending message for (net hits) minutes</td><td>KC <br/>p. 39</td>
						</tr>
						<tr>
							<td colspan="6" class="tableFoot">
								CRB: Core Rulebook, DT: Data Trails, R5: Rigger 5, KC: Kill Code
							</td>
						</tr>
					</tbody>
				</table>
				&#x00A0;
				<table class="cheatSheetTable">
					<thead>
						<tr><th colspan="5">Firewall Limit</th><td style="background-color:white;">&#x00A0;</td></tr>
						<tr class="tableMiniHeader">
							<th>Name</th><th>Type</th><th style="width:50px;">Marks</th><th>Test</th><th>Description</th><th>&#x00A0;</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Disarm Data Bomb</td><td>Complex</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'INT' ]/base + skills/skill[name = 'Software' ]/rating" /></div>&#x00A0;<div class="roll">Software&#x00A0;+&#x00A0;Intuition&#x00A0;vs <br/>(Data&#x00A0;Bomb&#x00A0;Rating&#x00A0;x2)</div></td><td>Attempt to disarm Data Bomb. If test is failed bomb deals (Rating)d6</td><td>CRB <br/>p. 239</td>
						</tr>
						<tr>
							<td>Full Matrix Defense</td><td>Interrupt</td><td>Owner</td><td>None</td><td>Add Willpower to Matrix Defense Tests (Ini -10)</td><td>CRB <br/>p. 239</td>
						</tr>
						<tr>
							<td>Jack Out</td><td>Simple</td><td>Owner</td><td><div><xsl:value-of select="attributes/attribute[name = 'WIL' ]/base + skills/skill[name = 'Hardware' ]/rating" /></div>&#x00A0;<div class="roll">Hardware&#x00A0;+&#x00A0;Willpower&#x00A0;vs <br/>Logic&#x00A0;+&#x00A0;Attack</div></td><td>Logoff the Matrix. Test only needed if Linklocked . Suffer Dumpshock if running in VR.</td><td>CRB <br/>p. 240</td>
						</tr>
						<tr>
							<td colspan="6" class="tableFoot">
								CRB: Core Rulebook, DT: Data Trails, R5: Rigger 5, KC: Kill Code
							</td>
						</tr>
					</tbody>
				</table>
				&#x00A0;
				<table class="cheatSheetTable">
					<thead>
						<tr><th colspan="5">Sleaze Limit</th><td style="background-color:white;">&#x00A0;</td></tr>
						<tr class="tableMiniHeader">
							<th>Name</th><th>Type</th><th style="width:50px;">Marks</th><th>Test</th><th>Description</th><th>&#x00A0;</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Check Overwatch Score</td><td>Simple</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Electronic Warfare' ]/rating" /></div>&#x00A0;<div class="roll">Electronic&#x00A0;Warfare&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>6&#x00A0;dice</div></td><td>Gain knowledge of Overwatch Score from before test</td><td>CRB <br/>p. 238</td>
						</tr>
						<tr>
							<td>Control Device</td><td>Variable</td><td>Varies</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Electronic Warfare' ]/rating" /></div>&#x00A0;<div class="roll">Electronic&#x00A0;Warfare&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Intuition&#x00A0;+&#x00A0;Firewall</div></td><td>Perform action on Target Device(s)</td><td>CRB <br/>p. 238</td>
						</tr>
						<tr>
							<td>Format Device</td><td>Complex</td><td>3</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Computer' ]/rating" /></div>&#x00A0;<div class="roll">Computer&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Willpower&#x00A0;+&#x00A0;Firewall</div></td><td>Removes all programming from Target Device from next reboot</td><td>CRB <br/>p. 239</td>
						</tr>
						<tr>
							<td>Garbage In Garbage Out</td><td>Complex</td><td>3</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Software' ]/rating" /></div>&#x00A0;<div class="roll">Software&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Logic&#x00A0;+&#x00A0;Firewall</div></td><td>Change a single command into something else, such as “fire weapon” to “turn safety on”</td><td>DT <br/>p. 179</td>
						</tr>
						<tr>
							<td>Hack on the Fly</td><td>Complex</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Hacking' ]/rating" /></div>&#x00A0;<div class="roll">Hacking&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Intuition&#x00A0;+&#x00A0;Firewall</div></td><td>Stealthily place mark on target. Failure alerts target and marks you. Or change grid illegally (see CRB p. 240)</td><td>CRB <br/>p. 240</td>
						</tr>
						<tr>
							<td>Hide</td><td>Complex</td><td>Owner</td><td><div><xsl:value-of select="attributes/attribute[name = 'INT' ]/base + skills/skill[name = 'Electronic Warfare' ]/rating" /></div>&#x00A0;<div class="roll">Electronic&#x00A0;Warfare&#x00A0;+&#x00A0;Intuition&#x00A0;vs <br/>Intuition&#x00A0;+&#x00A0;Data Processing</div></td><td>Hide oneself. Cannot hide if marked</td><td>CRB <br/>p. 240</td>
						</tr>
						<tr>
							<td>Masquerade</td><td>Complex</td><td>2/2</td><td><div><xsl:value-of select="attributes/attribute[name = 'INT' ]/base + skills/skill[name = 'Hacking' ]/rating" /></div>&#x00A0;<div class="roll">Hacking&#x00A0;+&#x00A0;Intuition&#x00A0;vs <br/>Logic&#x00A0;+&#x00A0;Firewall</div></td><td>Masquerade persona for one minute</td><td>KC <br/>p. 39</td>
						</tr>
						<tr>
							<td>Popup</td><td>Simple</td><td>1</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Hacking' ]/rating" /></div>&#x00A0;<div class="roll">Hacking&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Willpower&#x00A0;+&#x00A0;Firewall</div></td><td>Target suffers (net hits) penalties. Gain information like Matrix Perception test</td><td>KC <br/>p. 39</td>
						</tr>
						<tr>
							<td>Set Data Bomb</td><td>Complex</td><td>1</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Software' ]/rating" /></div>&#x00A0;<div class="roll">Software&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>(Device&#x00A0;Rating&#x00A0;x2)</div></td><td>Trapped file possibly to destroy. Tripped Bomb cause (Rating)d6 Matrix Damage</td><td>CRB <br/>p. 242</td>
						</tr>
						<tr>
							<td>Snoop</td><td>Complex</td><td>1</td><td><div><xsl:value-of select="attributes/attribute[name = 'INT' ]/base + skills/skill[name = 'Electronic Warfare' ]/rating" /></div>&#x00A0;<div class="roll">Electronic&#x00A0;Warfare&#x00A0;+&#x00A0;Intuition&#x00A0;vs <br/>Logic&#x00A0;+&#x00A0;Firewall</div></td><td>Intercept and read data stream from target device.</td><td>CRB <br/>p. 242</td>
						</tr>
						<tr>
							<td>Spoof Command</td><td>Complex</td><td>1</td><td><div><xsl:value-of select="attributes/attribute[name = 'INT' ]/base + skills/skill[name = 'Hacking' ]/rating" /></div>&#x00A0;<div class="roll">Hacking&#x00A0;+&#x00A0;Intuition&#x00A0;vs <br/>Logic&#x00A0;+&#x00A0;Firewall</div></td><td>Send a command to target device. Note: Mark needed on Command Issuer not target device.</td><td>CRB <br/>p. 242</td>
						</tr>
						<tr>
							<td>Subvert Infrastructure</td><td>Complex</td><td>1</td><td><div><xsl:value-of select="attributes/attribute[name = 'INT' ]/base + skills/skill[name = 'Electronic Warfare' ]/rating" /></div>&#x00A0;<div class="roll">Electronic&#x00A0;Warfare&#x00A0;+&#x00A0;Intuition&#x00A0;vs <br/>Intuition&#x00A0;+&#x00A0;Firewall</div></td><td>Control (net hits) similar devices connect to host</td><td>KC <br/>p. 40</td>
						</tr>
						<tr>
							<td>Watchdog</td><td>Complex</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Electronic Warfare' ]/rating" /></div>&#x00A0;<div class="roll">Electronic&#x00A0;Warfare&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Logic&#x00A0;+&#x00A0;Sleaze</div></td><td>Marks target and allows for Haywire(-5), Popup(-5), or Squelch(-10) as Interupt actions</td><td>KC <br/>p. 40</td>
						</tr>
						<tr>
							<td colspan="6" class="tableFoot">
								CRB: Core Rulebook, DT: Data Trails, R5: Rigger 5, KC: Kill Code
							</td>
						</tr>
					</tbody>
				</table>
				&#x00A0;				
				<table class="cheatSheetTable">
					<thead>
						<tr><th colspan="5">Data Processing Limit</th><td style="background-color:white;">&#x00A0;</td></tr>
						<tr class="tableMiniHeader">
							<th>Name</th><th>Type</th><th style="width:50px;">Marks</th><th>Test</th><th>Description</th><th>&#x00A0;</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Break Target Lock</td><td>Simple</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'INT' ]/base + skills/skill[name = 'Electronic Warfare' ]/rating" /></div>&#x00A0;<div class="roll">Electronic&#x00A0;Warfare&#x00A0;+&#x00A0;Intuition&#x00A0;vs <br/>Logic&#x00A0;+&#x00A0;Sensors</div></td><td>Attempt to remove Target Lock from a single opponent</td><td>R5 <br/>p. 30</td>
						</tr>
						<tr>
							<td>Calibration</td><td>Simple</td><td>1</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Electronic Warfare' ]/rating" /></div>&#x00A0;<div class="roll">Electronic&#x00A0;Warfare&#x00A0;+&#x00A0;Logic</div></td><td>Increase Initiative of target by 1 per 2 hits</td><td>KC <br/>p. 37</td>
						</tr>
						<tr>
							<td>Change Icon</td><td>Simple</td><td>0</td><td>None</td><td>Change own or target’s icon.</td><td>CRB <br/>p. 238</td>
						</tr>
						<tr>
							<td>Confuse Pilot</td><td>Complex</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Electronic Warfare' ]/rating" /></div>&#x00A0;<div class="roll">Electronic&#x00A0;Warfare&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Pilot&#x00A0;+&#x00A0;Firewall</div></td><td>Confuse pilot program. Pilot must take (Pilot x2) + RCC&#x00A0;Noise&#x00A0;Reduction test&#x00A0;vs threshold (half net hits) to act</td><td>R5 <br/>p. 30</td>
						</tr>
						<tr>
							<td>Control Device</td><td>Variable</td><td>Varies</td><td>(As action)</td><td>Perform action on Target Device(s)</td><td>CRB <br/>p. 238</td>
						</tr>
						<xsl:if test="gears/gear[category_english = 'Rigger Command Consoles']">
						<tr class="riggerInfo">
							<td>Detect Target Lock</td><td>Free</td><td>Owner</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Computer' ]/rating" /> + RCC</div>&#x00A0;<div class="roll">Computer&#x00A0;+&#x00A0;Logic&#x00A0;+<br/>RCC&#x00A0;Noise&#x00A0;Reduction&#x00A0;(2)</div></td><td>Attempt to Detect Active Target Locks</td><td>R5 <br/>p. 30</td>
						</tr>
						</xsl:if>
						<tr>
							<td>Edit File</td><td>Complex</td><td>1</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Computer' ]/rating" /></div>&#x00A0;<div class="roll">Computer&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Intuition&#x00A0;+&#x00A0;Firewall</div></td><td>Either attempt to edit contents of a file or set protection (protection equals to hits)</td><td>CRB <br/>p. 239</td>
						</tr>
						<tr>
							<td>Enter/Exit Host</td><td>Complex</td><td>1</td><td>None</td><td>Enter a marked host</td><td>CRB <br/>p. 239</td>
						</tr>
						<tr>
							<td>Grid Hop</td><td>Complex</td><td>0</td><td>None</td><td>Change Grid legally</td><td>CRB <br/>p. 239</td>
						</tr>
						<tr>
							<td>I am the Firewall</td><td>Complex Interupt</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'INT' ]/base + skills/skill[name = 'Computer' ]/rating" /></div>&#x00A0;<div class="roll">Computer&#x00A0;+&#x00A0;Intuition</div></td><td>Increase Defense test of allies by hits</td><td>KC <br/>p. 38</td>
						</tr>
						<tr>
							<td>Intervene</td><td>Interupt</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'INT' ]/base + skills/skill[name = 'Computer' ]/rating" /></div>&#x00A0;<div class="roll">Computer&#x00A0;+&#x00A0;Intuition</div></td><td>Allow Defense test with bonus equal to hits</td><td>KC <br/>p. 39</td>
						</tr>
						<tr>
							<td>Invite Mark</td><td>Complex</td><td>Owner</td><td>None</td><td>Allow uncontested marking of oneself.</td><td>CRB <br/>p. 240</td>
						</tr>
						<tr>
							<td>Jump Into Rigged Device</td><td>Complex</td><td>3</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Electronic Warfare' ]/rating" /></div>&#x00A0;<div class="roll">Electronic&#x00A0;Warfare&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Willpower&#x00A0;+&#x00A0;Firewall</div></td><td>Jump into device if requirements met. Marks nor test needed if owner or invited</td><td>CRB <br/>p. 241</td>
						</tr>
						<tr>
							<td>Matrix Perception</td><td>Complex</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'INT' ]/base + skills/skill[name = 'Computer' ]/rating" /></div>&#x00A0;<div class="roll">Computer&#x00A0;+&#x00A0;Intuition <br/>(vs Logic&#x00A0;+&#x00A0;Sleaze)</div></td><td>Assence the Matrix. Defense test only needed against Silent Running devices.</td><td>CRB <br/>p. 241</td>
						</tr>
						<tr>
							<td>Matrix Search</td><td>Special</td><td>N/A</td><td><div><xsl:value-of select="attributes/attribute[name = 'INT' ]/base + skills/skill[name = 'Computer' ]/rating" /></div>&#x00A0;<div class="roll">Computer&#x00A0;+&#x00A0;Intuition</div></td><td>Search the Matrix or host for information or files</td><td>CRB <br/>p. 241</td>
						</tr>
						<tr>
							<td>Reboot Device</td><td>Complex</td><td>3</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Computer' ]/rating" /></div>&#x00A0;<div class="roll">Computer&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Willpower&#x00A0;+&#x00A0;Firewall</div></td><td>Force target device to reboot</td><td>CRB <br/>p. 242</td>
						</tr>
						<tr>
							<td>Send Message</td><td>Complex</td><td>N/A (or 1)</td><td>None</td><td>Send short message, audio or video. Mark needed if device is not owned</td><td>CRB <br/>p. 242</td>
						</tr>
						<xsl:if test="gears/gear[category_english = 'Rigger Command Consoles']">
						<tr class="riggerInfo">
							<td>Suppress Noise</td><td>Complex</td><td>Owner</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Electronic Warfare' ]/rating" />+RCC</div>&#x00A0;<div class="roll">Electronic&#x00A0;Warfare&#x00A0;+&#x00A0;Logic&#x00A0;+<br/>RCC&#x00A0;Noise&#x00A0;Reduction</div></td><td>Reduce noise by hits for device on RCC’s PAN</td><td>R5 p, 30</td>
						</tr>
						</xsl:if>
						<tr>
							<td>Switch Interface</td><td>Complex</td><td>Owner</td><td>None</td><td>Change user mode between AR and VR</td><td>CRB <br/>p. 243</td>
						</tr>
						<tr>
							<td>Tag</td><td>Simple</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Computer' ]/rating" /></div>&#x00A0;<div class="roll">Computer&#x00A0;+&#x00A0;Logic&#x00A0;vs <br/>Sleaze&#x00A0;+&#x00A0;Intuition</div></td><td>Negate 2 dice Visual or Light/Glare ranged attack penalties of allies. Allows additional Take Aim action</td><td>KC <br/>p. 40</td>
						</tr>
						<xsl:if test="gears/gear[category_english = 'Rigger Command Consoles']">
						<tr class="riggerInfo">
							<td>Target Device</td><td>Complex</td><td>0</td><td><div><xsl:value-of select="attributes/attribute[name = 'LOG' ]/base + skills/skill[name = 'Electronic Warfare' ]/rating" />+RCC</div>&#x00A0;<div class="roll">Electronic&#x00A0;Warfare&#x00A0;+&#x00A0;Logic&#x00A0;+<br/>RCC&#x00A0;Noise&#x00A0;Reduction&#x00A0;vs <br/>Willpower&#x00A0;+&#x00A0;Firewall</div></td><td>Adds (hits) dice to Pilot or Smart weapon attacks made against Matrix Targeted Device</td><td>R5 <br/>p. 30</td>
						</tr>
						</xsl:if>
						<tr>
							<td>Trace Icon</td><td>Complex</td><td>2</td><td><div><xsl:value-of select="attributes/attribute[name = 'INT' ]/base + skills/skill[name = 'Computer' ]/rating" /></div>&#x00A0;<div class="roll">Computer&#x00A0;+&#x00A0;Intuition&#x00A0;vs <br/>Willpower&#x00A0;+&#x00A0;Sleaze</div></td><td>Attempt to obtain physical location of device</td><td>CRB <br/>p. 243</td>
						</tr>
						<tr>
							<td>Trackback</td><td>Special</td><td>Owner</td><td><div><xsl:value-of select="attributes/attribute[name = 'INT' ]/base + skills/skill[name = 'Computer' ]/rating" /></div>&#x00A0;<div class="roll">Computer&#x00A0;+&#x00A0;Intuition<br/>(Special,&#x00A0;30&#x00A0;min)</div></td><td>Trace a mark back to the original device. Grids only</td><td>DT <br/>p. 179</td>
						</tr>
						<tr>
							<td colspan="6" class="tableFoot">
								CRB: Core Rulebook, DT: Data Trails, R5: Rigger 5, KC: Kill Code
							</td>
						</tr>
					</tbody>
				</table>
				&#x00A0;
				<xsl:if test="skills/skill[name = 'Compiling' ]">
				<table class="ResonanceInfo cheatSheetTable">
					<tbody class="tableMiniHeader">
						<tr><th colspan="5">Resonance</th></tr>
						<tr>
							<th>Name</th><th>Type</th><th>Test</th><th>Description</th><th>&#x00A0;</th>
						</tr>
						<tr>
							<td>Call/Dismiss Sprite</td><td>Simple</td><td>None</td><td>Call or Dismiss a previously Compiled Sprite.</td><td>CRB <br/>p. 250</td>
						</tr>
						<tr>
							<td>Command Sprite</td><td>Simple</td><td>None</td><td>Give Sprite a command in exchange for a task</td><td>CRB <br/>p. 250</td>
						</tr>
						<tr>
							<td>Compile Sprite</td><td>Complex</td><td><div><xsl:value-of select="attributes/attribute[name = 'RES' ]/base + skills/skill[name = 'Compiling' ]/rating" /></div>&#x00A0;<div class="roll">Compiling&#x00A0;+&#x00A0;Resonance [Level]&#x00A0;vs <br/>Sprite Level</div></td><td>Compile a Sprite into existence and suffer Fading equal to (Sprite hits x2)</td><td>CRB <br/>p. 250</td>
						</tr>
						<tr>
							<td>Decompile Sprite</td><td>Complex</td><td><div><xsl:value-of select="attributes/attribute[name = 'RES' ]/base + skills/skill[name = 'Decompiling' ]/rating" /></div>&#x00A0;<div class="roll">Decompiling&#x00A0;+&#x00A0;Resonance [Level]&#x00A0;vs <br/>Sprite Level (+ compiler’s Resonance)</div></td><td>Attempt to decompile Sprite and suffer Fading equal to (Sprite hits x2)</td><td>CRB <br/>p. 250</td>
						</tr>
						<tr>
							<td>Erase Matrix Signature</td><td>Complex</td><td><div><xsl:value-of select="attributes/attribute[name = 'RES' ]/base + skills/skill[name = 'Computer' ]/rating" /></div>&#x00A0;<div class="roll">Computer&#x00A0;+&#x00A0;Resonance [Attack]&#x00A0;vs <br/>(Signature Rating x2)</div></td><td>Attempt to Erase a Matrix Signature. Increases Overwatch</td><td>CRB <br/>p. 239</td>
						</tr>
						<tr>
							<td>Kill Complex Form</td><td>Complex</td><td><div><xsl:value-of select="attributes/attribute[name = 'RES' ]/base + skills/skill[name = 'Software' ]/rating" /></div>&#x00A0;<div class="roll">Software&#x00A0;+&#x00A0;Resonance [Level]&#x00A0;vs <br/>Complex Form Level&#x00A0;+&#x00A0;Resonance</div></td><td>Attempt to destroy a Complex Form and suffer Fading as if having Threaded the Form</td><td>CRB <br/>p. 250</td>
						</tr>
						<tr>
							<td>Register Sprite</td><td>Complex</td><td><div><xsl:value-of select="attributes/attribute[name = 'RES' ]/base + skills/skill[name = 'Registering' ]/rating" /></div>&#x00A0;<div class="roll">Registering&#x00A0;+&#x00A0;Resonance [Level]&#x00A0;vs <br/>(Sprite Level x 2)</div></td><td>Increases lifespan of Sprite. Fading (Sprite hits x2)</td><td>CRB <br/>p. 250</td>
						</tr>
						<tr>
							<td>Thread Complex Form</td><td>Complex</td><td><div><xsl:value-of select="attributes/attribute[name = 'RES' ]/base + skills/skill[name = 'Software' ]/rating" /></div>&#x00A0;<div class="roll">Software&#x00A0;+&#x00A0;Resonance [Level]&#x00A0;vs <br/>(as per Complex Form)</div></td><td>Thread a Complex Form</td><td>CRB <br/>p. 250</td>
						</tr>
						<tr>
							<td colspan="5" class="tableFoot">
								CRB: Core Rulebook, DT: Data Trails, R5: Rigger 5, KC: Kill Code
							</td>
						</tr>
					</tbody>
				</table>
				</xsl:if>
			</div>
			
<!--
Reference:</td><td>CRB: Core Rulebook,</td><td>DT: Data Trails,</td><td>R5: Rigger 5,</td><td>KC: Kill Code	
-->
		</body>
    </html>
</xsl:template>
</xsl:stylesheet>
