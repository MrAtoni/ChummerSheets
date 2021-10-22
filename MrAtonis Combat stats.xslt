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
				font-size:300%;
				padding:10px;
				background-color:white;
				color:Maroon;
				border-bottom:5px solid Maroon;
			}
			#pageHead td  {
				font-size:200%;
				font-weight:bold;
				background-color:white;
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


			.location {font-size:70%; font-weight:lighter; font-style:italic;}
			
			
			@media print
			{
				table	{ page-break-after:auto }
				tr	{ page-break-inside:avoid; page-break-after:auto }
				td	{ page-break-inside:avoid; page-break-after:auto }
				thead	{ display:table-header-group }
				tfoot	{ display:table-footer-group }
				
				.subTableDiv  { page-break-inside:avoid; page-break-after:auto }
				
				.pageBreak {page-break-after: always;}
				
				.qDiv, .qDiv * {display: none !important;}
			}
        </style>


      </head>

		<body>
			<table id="pageHead">
				<tr>
					<th>Combat sheet</th>
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
		<!--	INITIATIVE & DEFENCE 		-->		
				<div class="divBlock50">
					<table style="margin-bottom:20px;"><!--Initiative -->
					
						<tr>
							<th colspan="2">Initiative Rolls</th>
						</tr>
						<tr>
							<td><xsl:value-of select="$lang.Initiative"/>:</td>
							<td><xsl:value-of select="init"/></td>
						</tr>
						<xsl:if test="magenabled = 'True'">
							<tr>
								<td><xsl:value-of select="$lang.AstralInitiative"/>:</td>
								<td><xsl:value-of select="astralinit"/></td>
							</tr>
						</xsl:if>
					</table>
					
					<table style="margin-bottom:20px;"><!--Defence-->
						<tr>
							<th colspan="2">Defend</th>
						</tr>
						<tr style="font-weight:bold;"> <!--Base defend-->
							<td>Base Defend</td>
							<td>
								<xsl:value-of select="attributes/attribute[name = 'REA' ]/base + attributes/attribute[name = 'INT']/base" />
								<xsl:if test="attributes/attribute[name = 'REA' ]/base != attributes/attribute[name = 'REA' ]/total or attributes/attribute[name = 'INT' ]/base != attributes/attribute[name = 'INT' ]/total">
									(<xsl:value-of select="attributes/attribute[name = 'REA' ]/total + attributes/attribute[name = 'INT']/total" />)
								</xsl:if>
							</td>
						</tr>
						
						<xsl:if test="skills/skill[name = 'Unarmed Combat' ]/rating != '0'"> 	<!--Block-->
							<tr>
								<td>Block in melee combat (+Unarmed Combat, -5 initiative)</td>
								<td>
									<xsl:value-of select="attributes/attribute[name = 'REA' ]/base + attributes/attribute[name = 'INT']/base + skills/skill[name = 'Unarmed Combat' ]/rating" />
									<xsl:if test="attributes/attribute[name = 'REA' ]/base != attributes/attribute[name = 'REA' ]/total or attributes/attribute[name = 'INT' ]/base != attributes/attribute[name = 'INT' ]/total">
										(<xsl:value-of select="attributes/attribute[name = 'REA' ]/total + attributes/attribute[name = 'INT']/total + skills/skill[name = 'Unarmed Combat' ]/rating" />)
									</xsl:if>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="skills/skill[name = 'Gymnastics' ]/rating != '0'">		<!--Dodge-->
							<tr>
								<td>Dodge in melee combat (+Gymnastics, -5 initiative)</td>
								<td>
									<xsl:value-of select="attributes/attribute[name = 'REA' ]/base + attributes/attribute[name = 'INT']/base + skills/skill[name = 'Gymnastics' ]/rating" />
									<xsl:if test="attributes/attribute[name = 'REA' ]/base != attributes/attribute[name = 'REA' ]/total or attributes/attribute[name = 'INT' ]/base != attributes/attribute[name = 'INT' ]/total">
										(<xsl:value-of select="attributes/attribute[name = 'REA' ]/total + attributes/attribute[name = 'INT']/total + skills/skill[name = 'Gymnastics' ]/rating" />)
									</xsl:if>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="skills/skill[name = 'Blades' ]/rating != '0'">		<!--Parry 1-->
							<tr>
								<td>Parry in melee combat (+Blades, -5 initiative)</td>
								<td>
									<xsl:value-of select="attributes/attribute[name = 'REA' ]/base + attributes/attribute[name = 'INT']/base + skills/skill[name = 'Blades' ]/rating" />
									<xsl:if test="attributes/attribute[name = 'REA' ]/base != attributes/attribute[name = 'REA' ]/total or attributes/attribute[name = 'INT' ]/base != attributes/attribute[name = 'INT' ]/total">
										(<xsl:value-of select="attributes/attribute[name = 'REA' ]/total + attributes/attribute[name = 'INT']/total + skills/skill[name = 'Blades' ]/rating" />)
									</xsl:if>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="skills/skill[name = 'Clubs' ]/rating != '0'">		<!--Parry 2-->
							<tr>
								<td>Parry in melee combat (+Clubs, -5 initiative)</td>
								<td>
									<xsl:value-of select="attributes/attribute[name = 'REA' ]/base + attributes/attribute[name = 'INT']/base + skills/skill[name = 'Clubs' ]/rating" />
									<xsl:if test="attributes/attribute[name = 'REA' ]/base != attributes/attribute[name = 'REA' ]/total or attributes/attribute[name = 'INT' ]/base != attributes/attribute[name = 'INT' ]/total">
										(<xsl:value-of select="attributes/attribute[name = 'REA' ]/total + attributes/attribute[name = 'INT']/total + skills/skill[name = 'Clubs' ]/rating" />)
									</xsl:if>
								</td>
							</tr>
						</xsl:if>
						
						<tr>																	<!--Full Defence-->
							<td>Full Defense (+WIL rest of turn, -10 initiative)</td>
							<td>
								<xsl:value-of select="attributes/attribute[name = 'REA' ]/base + attributes/attribute[name = 'INT']/base + attributes/attribute[name = 'WIL' ]/base" />
									<xsl:if test="attributes/attribute[name = 'REA' ]/base != attributes/attribute[name = 'REA' ]/total or attributes/attribute[name = 'INT' ]/base != attributes/attribute[name = 'INT' ]/total or attributes/attribute[name = 'WIL' ]/base != attributes/attribute[name = 'WIL' ]/total">
										(<xsl:value-of select="attributes/attribute[name = 'REA' ]/total + attributes/attribute[name = 'INT']/total + attributes/attribute[name = 'WIL' ]/total" />)
									</xsl:if>
							</td>
						</tr>
					</table>
					
					<table><!--Defence-->
						<tr>
							<th colspan="2">Damage resist </th>
						</tr>
						<tr> 
							<td>Soak roll</td>
							<td>
								<xsl:value-of select="attributes/attribute[name = 'BOD' ]/total" /> + Armor value - AP
							</td>
						</tr>
						
					</table>
				</div>
				
				<div class="divDevider">&#160;</div>
				
				
		<!--	Other interrupt actions 		-->	
				<div class="divBlock50">
					<table>
						
						<tr><th colspan="2">Interrupt AOE attacks</th></tr>
						<tr>
							<td>Dive on the Grenade (-5 initiative)</td>
							<td>Intercept AOE attack within movement range and absorp the blast (RG p.125)</td>
						</tr>
						<tr>
							<td>Run For Your Life! (-5 initiative)</td>
							<td>Move away from AOE attack (RG p.125)</td>
						</tr>
						<tr>
							<td>Right Back at Ya! (-10 initiative)</td>
							<td>Roll <xsl:value-of select="attributes/attribute[name = 'AGI' ]/total" />d6. If &gt;2 pick up/catch grenade within movement range and perform Throwing -2 attack (RG p.124)</td>
						</tr>
						<tr>
							<th colspan="2">Other interrupt actions</th>
						</tr>
						
						<tr>
							<td>Hit the Dirt (-5 initiative)</td>
							<td>Become prone, avoid supressive fire (Core p.168)</td>
						</tr>
						<tr>
							<td>Intercept (-5 initiative)</td>
							<td>Out of turn melee attack, when enemy moves past or breaks out of melee combat (Core p.168)</td>
						</tr>
						<tr>
							<td>Protecting the principle (-5 initiative, -1 edge)</td>
							<td>Move 2M to become target of attack. No defence test (RG p.125)</td>
						</tr>
						<tr>
							<td>Spell Defense (-5 initiative)</td>
							<td>Desegnate team spell defence out of turn (core p.294)</td>
						</tr>
					<!--REQUIRES MARTIAL ARTS-->
						<xsl:if test="martialarts/martialart/martialarttechniques/martialarttechnique[name_english = 'Counterstrike']">
							<tr>
								<td>Counterstrike in unarmed combat (-7 initiative)</td>
								<td>
									Roll <xsl:value-of select="attributes/attribute[name = 'REA' ]/total + skills/skill[name = 'Unarmed Combat' ]/rating" />d6 against attack roll. If successful you take no damage and deal <xsl:value-of select="weapons/weapon[name_english = 'Unarmed Attack' ]/damage_english" /> + nethits undefended damage. (RF p.124)
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="martialarts/martialart/martialarttechniques/martialarttechnique[name_english = 'Riposte']">
							<tr>
								<td>Riposte in melee combat(-7 initiative)</td>
								<td>
									Roll Melee Weapon Skill + <xsl:value-of select="attributes/attribute[name = 'REA' ]/total" />d6 against attack roll. If successful you take no damage and deal Weapon DV + nethits undefended damage. (RF p.125)
								</td>
							</tr>
						</xsl:if>
					<!--REQUIRES ADEPT POWER	<tr>
							<td>Counterstrike in melee combat (-5 initiative)</td>
							<td>
								Add <xsl:value-of select="skills/skill[name = 'Unarmed Combat' ]/rating" /> to defence. f successful next attack receives bonus equal to Level and Block Net Hits.
							</td>
						</tr>-->
						
					<!--REQUIRES ADEPT POWER	<tr>
							<td>Counterstrike in melee combat (-5 initiative)</td>
							<td>
								Add <xsl:value-of select="skills/skill[name = 'Unarmed Combat' ]/rating" /> to defence. f successful next attack receives bonus equal to Level and Block Net Hits.
							</td>
						</tr>-->
					</table>
				</div>
			</div>	
			
			
			
			<div class="divRow"> <!-- Defence & Armor -->
			
			
				
		<!--	ARMOR 		-->	
				<xsl:if test="armors/armor">
					<table>
						<thead>
							<tr>
								<th>Armor</th>
							</tr>
						</thead>
						
						<tr style="background:white; page-break-inside:auto;"><td style="background:white; page-break-inside:auto;">
						
						<xsl:for-each select="armors/armor">
							<xsl:sort select="location"/>
							<xsl:sort select="name"/>
							<xsl:if test="armor != 0">
								<div class="subTableDiv"  style="width:33%;">
									<table class="subTable">
										<xsl:call-template name="armorInfo"/>
																
										<xsl:if test="armormods/armormod or gears/gear">
											<xsl:call-template name="armorModsGearInfo"/>
										</xsl:if>
									</table>
								</div>
							</xsl:if>
						</xsl:for-each>
						
						<xsl:for-each select="powers/power">
							<xsl:sort select="location"/>
							<xsl:sort select="name"/>
							<xsl:if test="name = 'Mystic Armor'">
								<div class="subTableDiv"  style="width:33%;">
									<table class="subTable">
										<tr>
											<th style="border:1px solid black;">
												<xsl:value-of select="name"/>
											</th>
											<td style="border:1px solid black;">
												Rating:&#160;+<xsl:value-of select="rating"/><br/>
												<span class="location"><xsl:value-of select="location"/></span>
											</td>
										</tr>
									</table>
								</div>
							</xsl:if>
						</xsl:for-each>
						
						
						</td></tr>
						
					</table>
				</xsl:if>
			</div>
			
			
		<!--	ATTACK 		-->				
			<div class="divRow pageBreak">
				<table>
					<thead>
						<tr>
							<th>Attack Rolls</th>
						</tr>
					</thead>
					
					<tr style="background:white; page-break-inside:auto;"><td style="background:white; page-break-inside:auto;">
						<xsl:for-each select="weapons/weapon">
						<xsl:sort select="location" data-type="number"/>
						<xsl:sort select="name"/>
							<!--<xsl:if test="name != 'Unarmed Attack'">-->
								<xsl:call-template name="weapon"/>
							<!--</xsl:if>-->
						</xsl:for-each>
					</td></tr>
				</table>
			</div>
			
			<div class="qDiv pageBreak">
				<label for="toggle-1"><span>Print Combat Cheat Sheet</span></label>
			</div>
			
		<input type="checkbox" id="toggle-1" />
		<div>
			<div class="divRow">
					
		<!--	COMBAT CHEAT SHEET 		-->			
				<div class="divBlock50">
					<table> <!-- Weapon Fire Modes -->
						<tr><th colspan="4">Weapon Fire Modes</th></tr>
						<tr style="font-weight:bold;">
							<td>Mode</td>
							<td>Action</td>
							<td>Defense Modifier</td>
							<td>Rounds Used</td>
						</tr>
						<tr>
							<td>Single-Shot (SS)</td>
							<td>Simple</td>
							<td>0</td>
							<td>1</td>
						</tr>
						<tr>
							<td>Semi-Automatic (SA)</td>
							<td>Simple</td>
							<td>0</td>
							<td>1</td>
						</tr>
						<tr>
							<td>Semi-Automatic Burst (SB)</td>
							<td>Complex</td>
							<td>-2</td>
							<td>3</td>
						</tr>
						<tr>
							<td>Burst Fire (BF)</td>
							<td>Simple</td>
							<td>-2</td>
							<td>3</td>
						</tr>
						<tr>
							<td>Long Burst (LB)</td>
							<td>Complex</td>
							<td>-5</td>
							<td>6</td>
						</tr>
						<tr>
							<td>Full Auto Long Burst (FA)</td>
							<td>Simple</td>
							<td>-5</td>
							<td>6</td>
						</tr>
						<tr>
							<td>Full Auto Full Burst (FA FB)</td>
							<td>Complex</td>
							<td>-9</td>
							<td>10</td>
						</tr>
						<tr>
							<td>Suppressive Fire</td>
							<td>Complex</td>
							<td>Duck or Cover</td>
							<td>20</td>
						</tr>
					</table>
					
					
				
				</div>
					
				<div class="divDevider">&#160;</div>
				<div class="divBlock50"> <!-- Free actions -->
					<table>
						<tr><th colspan="2">Free Combat Actions</th></tr>
						<tr>
							<td>Call A Shot</td>
							<td>Declare Called Shot with Attack for -4 Modifier</td>
						</tr>
						<tr>
							<td>Change Linked Device Mode</td>
							<td>Change Device Mode via Direct Neural Interface</td>
						</tr>
						<tr>
							<td>Change Smartgun Mode</td>
							<td></td>
						</tr>
						<tr>
							<td>Fire Mode, Choke, etc.</td>
							<td></td>
						</tr>
						<tr>
							<td>Drop Object</td>
							<td>May damage object</td>
						</tr>
						<tr>
							<td>Drop Prone</td>
							<td>Avoids Suppressive Fire</td>
						</tr>
						<tr>
							<td>Eject Smartgun Clip</td>
							<td>Mental Command</td>
						</tr>
						<tr>
							<td>Gesture</td>
							<td>Intuition (2) to interpret unknown gesture</td>
						</tr>
						<tr>
							<td>Add Multiple Attacks</td>
							<td>Split Attack Dice Pool to attack Multiple Targets</td>
						</tr>
						<tr>
							<td>Speak/Text/Transmit Phrase</td>
							<td>&#160;</td>
						</tr>
						
					</table>
				</div>
			</div>
			
			<div class="divRow">
					
		<!--	COMBAT CHEAT SHEET 		-->			
				<div class="divBlock50"> <!-- Simple Actions -->
					<table>
						<tr><th colspan="2">Simple Combat Actions</th></tr>
						<tr>
							<td>Change Device Mode</td>
							<td>Fire Mode, Choke, Vision System, disable wireless, etc.</td>
						</tr>
						<tr>
							<td>Fire Weapon (SA, SS, BF, FA)</td>
							<td>Only one Attack per Action Phase</td>
						</tr>
						<tr>
							<td>Insert or Remove Clip</td>
							<td>(c)</td>
						</tr>
						<tr>
							<td>Observe in Detail</td>
							<td><xsl:value-of select="skills/skill[name = 'Perception' ]/total" />d6 [<xsl:value-of select="limitmental"/>]</td>
						</tr>
						<tr>
							<td>Pick Up/Put Down Object</td>
							<td>Without Damaging Object</td>
						</tr>
						<tr>
							<td>Quick Draw</td>
							<td>Weapon Skill + <xsl:value-of select="attributes/attribute[name = 'REA' ]/total" />d6 [<xsl:value-of select="limitphysical"/>] (3 or 1 with quick draw holster)</td>
						</tr>
						<tr>
							<td>Ready/Draw Weapon</td>
							<td>&#160;</td>
						</tr>
						<tr>
							<td>Nock Arrow</td>
							<td>&#160;</td>
						</tr>
						<tr>
							<td>Stand Up</td>
							<td>From prone, <xsl:value-of select="attributes/attribute[name = 'BOD' ]/total + attributes/attribute[name = 'WIL' ]/total" /> (2) if wounded</td>
						</tr>
						<tr>
							<td>Take Aim</td>
							<td>+1 Modifier or Accuracy up to half Willpower</td>
						</tr>
						<tr>
							<td>Take Cover</td>
							<td>Gain Cover Bonus</td>
						</tr>
						<tr>
							<td>Throw Weapon</td>
							<td>Only one Attack per Action Phase</td>
						</tr>
						<tr>
							<td>Use Simple Device</td>
							<td>Thumb Trigger, Single Key, Single Icon, Button, etc</td>
						</tr>
					
					</table>
				</div>
				<div class="divDevider">&#160;</div>
				<div class="divBlock50"> <!-- Complex actions -->
					<table style="margin-bottom:20px;">
						<tr><th colspan="2">Complex Combat Actions</th></tr>
						<tr>
							<td>Fire Weapon (SB, LB, FA FB)</td>
							<td>Refer to Fire Mode Table</td>
						</tr>
						<tr>
							<td>Fire Mounted or Vehicle Weapon</td>
							<td>Uses Gunnery</td>
						</tr>
						<tr>
							<td>Melee Attack</td>
							<td>Reach adds to Pool and/or Threat Range</td>
						</tr>
						<tr>
							<td>Reload Weapon</td>
							<td>(belt) (b) (cy) (d) (m) (muzzle loader) (speed loader)</td>
						</tr>
						<tr>
							<td>Sprint</td>
							<td>Running + Strength [Physical] add meters</td>
						</tr>
						<tr>
							<td>Use Skill</td>
							<td>&#160;</td>
						</tr>
					</table>
					
					
					
				
					<table> <!-- Attack Order -->
						<tr>
							<th colspan="2">Attack order</th>
						</tr>
						<tr>
							<td>1. Attack</td>
							<td>Roll AGI+ weapon skill</td>
						</tr>
						<tr>
							<td>2. Defend</td>
							<td>Roll REA + INT &#8195; (+/- reach if in melee)</td>
						</tr>
						<tr style="color:darkgray;">
							<td colspan="2">If Attack &lt; Defend: Miss<br/>If Attack = Defend: Gracing hit (No weapon damage but secondary effects may apply)</td>
							
						</tr>
						<tr>
							<td>3. Damage Value</td>
							<td>Weapon P/S (STR in unarmed combat) + Attack net hits</td>
						</tr>
						<tr>
							<td>4. Damage resist</td>
							<td>Roll BOD + Armor value - weapon AP</td>
						</tr>
					</table>
				</div>
			</div>
			
			
			</div>
		
		</body>
    </html>
</xsl:template>

<xsl:template name="armorModsGearInfo">
<tr class="modsAndGearBox"><td><b>Mods &#38; Gear:</b></td>
	<td style="text-align:left; font-size:80%; background:white; text-align:left;" class="modnGearList" >
		<xsl:if test="armormods/armormod">
			<xsl:for-each select="armormods/armormod">
				<xsl:sort select="name"/>
				&#8226;&#160;
					<xsl:value-of select="name"/>&#160;<xsl:if test="rating != 0"><i><xsl:text>Rating:&#160;</xsl:text><xsl:value-of select="rating"/></i></xsl:if>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="gears/gear">
			<xsl:for-each select="gears/gear">
				<xsl:sort select="name"/>
				
				&#8226;&#160;
					<xsl:value-of select="name"/>
					<xsl:if test="extra != ''"> (<xsl:value-of select="extra"/>)</xsl:if>
					<xsl:if test="rating != 0"><i><xsl:value-of select="$lang.Rating"/>&#160;<xsl:value-of select="rating"/></i></xsl:if>
					<xsl:if test="qty &gt; 1"> ×<xsl:value-of select="qty"/></xsl:if>
					<xsl:if test="children/gear">&#160;
						<span style="font-size:80%;">(
							<xsl:for-each select="children/gear">
								<xsl:value-of select="name"/>
								<xsl:if test="extra != ''"> (<xsl:value-of select="extra"/>)</xsl:if>
								<xsl:if test="rating != 0"> <xsl:value-of select="$lang.Rating"/>&#160;<xsl:value-of select="rating"/></xsl:if>
								<xsl:if test="qty > 1"> ×<xsl:value-of select="qty"/></xsl:if>
							</xsl:for-each>
						)</span>
					</xsl:if>
				<br/>	
			</xsl:for-each>
		</xsl:if>
	</td></tr>
</xsl:template>

<xsl:template name="armorInfo">
	<tr>
		<th style="border:1px solid black;">
			<xsl:value-of select="name"/><xsl:if test="armorname != ''">&#160;<i>("<xsl:value-of select="armorname"/>")</i></xsl:if>
		</th>
		<td style="border:1px solid black;">
			Rating:&#160;<xsl:value-of select="armor"/><br/>
			<span class="location"><xsl:value-of select="location"/></span>
		</td>
	</tr>
</xsl:template>

<xsl:template name="weapon">
	<div class="subTableDiv" style="width:50%;">
		<table class="subTable">
			<tr>
				<th class="subTh" colspan="3">
					<xsl:value-of select="name"/>
					<xsl:if test="weaponname != ''">
						&#8195; <i>("<xsl:value-of select="weaponname"/>")</i>
					</xsl:if><br/>
					<span style="font-size:80%;">
						<xsl:value-of select="category"/>
						<xsl:if test="location != ''">
							&#8195; <i style="font-weight:normal;">("<xsl:value-of select="location"/>")</i>
						</xsl:if>
					</span>
				</th>
			</tr>
			<tr>
				<td colspan="3" style="font-weight:bold; text-align:center;">Attack:&#160;<xsl:value-of select="dicepool"/>d6</td>
			</tr>
			<tr>
				<td>DV:&#160;<xsl:value-of select="damage"/></td>
				<td>AP:&#160;<xsl:value-of select="ap"/></td>
												
				<xsl:if test="type = 'Ranged'">
					<td>Ammo:&#160;<xsl:value-of select="ammo"/></td>
				</xsl:if>
			</tr>
			<tr>
				<td>Accuracy:&#160;<xsl:value-of select="accuracy"/></td>
				<td>RC:&#160;<xsl:value-of select="rc"/></td>
				<xsl:if test="type = 'Ranged'">
					<td>Modes:&#160;<xsl:value-of select="mode"/></td>
				</xsl:if>
			</tr>
			
			<xsl:if test="accessories/accessory or mods/weaponmod">
			<tr>
				<td colspan="3">
					<table class="subTable" style="width:80%; margin:2px auto; border:1px solid lightgray;">
						<tr><th style="background-color:white; color:black; border:0; width:50%;">Accessories &#38;&#160;Mods:</th><!--</tr>
						<tr style="background:white;">--><td style="font-size:80%; background:white; text-align:left;">
							<xsl:for-each select="accessories/accessory">
								<xsl:sort select="name"/>
								&#8226;&#160;<xsl:value-of select="name"/><br/>
							</xsl:for-each>
						</td></tr>
					</table>
				</td>
			</tr>
			</xsl:if>
		</table>
	</div>
</xsl:template>

</xsl:stylesheet>
