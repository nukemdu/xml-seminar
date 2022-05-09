<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    
    <!-- ............................ ROOT TEMPLATE .......................... -->
    <xsl:template match="/archery-tournament">
        <fo:root>
            
            <!-- define the layout of the document -->
            <fo:layout-master-set>
                <!-- here we define the layout of pages. There might be differrent page masters with e.g. different margin settings -->
                <fo:simple-page-master master-name="tournament-page"
                    page-height="297.0mm" page-width="209.9mm"
                    margin-bottom="8mm" margin-left="25mm" margin-right="10mm" margin-top="10mm">
                    
                    <!-- the content will be placed into the region-body -->
                    <fo:region-body margin-bottom="28mm" margin-left="0mm" margin-right="44mm" margin-top="60mm"/>
                    
                </fo:simple-page-master>
            </fo:layout-master-set>


            
            
            <!-- Here comes the content.
                 Printed content consists of one or more page-sequences. Each page-sequence starts on a new page. -->
            
            <!-- front page -->
            <fo:page-sequence master-reference="tournament-page">
                <fo:flow flow-name="xsl-region-body" font-family="serif" font-size="28pt">
                    <fo:block>
                        <xsl:value-of select="description/text()"/>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>

            <fo:page-sequence master-reference="tournament-page">
                <!-- place a page description into the page header -->
                <xsl:call-template name="header">
                    <xsl:with-param name="right" select="'Table of Contents'"/>
                </xsl:call-template>
                
                <!-- place the table of contents into region-body -->
                <fo:flow flow-name="xsl-region-body" font-family="Times" font-size="9pt">
                    <fo:block font-weight="bold" margin-top="40mm">Table of Contents</fo:block>
                    <fo:list-block space-before="24pt">
                        <xsl:apply-templates select="athlete" mode="toc"/>
                    </fo:list-block>
                </fo:flow>
            </fo:page-sequence>
            
        </fo:root>
    </xsl:template>

	<!-- Header template -->
	<xsl:template name="header">
		<fo:static-content flow-name="xsl-region-body">
			<fo:block font-size="7pt" text-align-last="justify">
				<xsl:value-of select="description/text()"/>
				<fo:leader/>
			</fo:block>
		</fo:static-content>
	</xsl:template>

	<!-- Footer template -->
	<xsl:template name="footer">
    	<fo:static-content flow-name="page-footer">
			<fo:block font-size="7pt" text-align="end">
				page <fo:page-number/>
			</fo:block>
		</fo:static-content>
	</xsl:template>

    <xsl:template match="athletes" mode="toc">
		<fo:list-item>
			<fo:list-item-label>
				<fo:block><xsl:value-of select="position()"/>.</fo:block>
			</fo:list-item-label>
			<fo:list-item-body start-indent="4mm">
				<fo:block text-align-last="justify">
					<xsl:value-of select="title"/>
					<fo:leader leader-pattern="dots"></fo:leader>
					<fo:page-number-citation ref-id="{generate-id()}"/>
				</fo:block>
			</fo:list-item-body>
		</fo:list-item>
	</xsl:template>

</xsl:stylesheet>
