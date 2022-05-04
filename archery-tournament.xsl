<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/archery-tournament">
		<html>
			<head>
				<title><xsl:value-of select="description"/></title>
			</head>
			<body>
				<h1><xsl:value-of select="description"/></h1>
				<h2>Scorecards Overview</h2>
				<ol>
					<xsl:for-each select="scorecard">
						<li><a href="#{generate-id()}"><xsl:value-of select="id(@athlete-id)/lastname/text()"/><xsl:value-of select="id(@athlete-id)/firstname/text()"/></a></li>
					</xsl:for-each>
				</ol>

				<hr/>
				<h2>List of Athletes</h2>
				<ul>
					<xsl:apply-templates select="athlete"/>
				</ul>

				<hr/>
				<h2>Scorecards</h2>
				<xsl:apply-templates select="scorecard"/>

				
			</body>
		</html>

	</xsl:template>

	<!-- athletes auflisten -->
	<xsl:template match="athlete">
		<li><tt><xsl:value-of select="nationality"/></tt>: <xsl:value-of select="lastname"/>, <xsl:value-of select="firstname"/></li>
	</xsl:template>

	<!-- Scorecard template -->
	<xsl:template match="scorecard">
		<p id="{generate-id()}"><xsl:value-of select="id(@athlete-id)/lastname"/>, <xsl:value-of select="id(@athlete-id)/firstname"/></p>
		<table bgcolor="000000">
			<xsl:for-each select="target">
				<tr bgcolor="ffffff">
					<td bgcolor="ffffff"><xsl:value-of select="@name"/></td>
					<xsl:for-each select="score">
						<td bgcolor="ffffff"><xsl:value-of select="./text()"/></td>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>

	<!-- Score template -->
	<xsl:template match="score">
		<td><xsl:value-of select="score"/></td>
	</xsl:template>

</xsl:stylesheet>
