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
                
                <!-- place the table of contents into region-body -->
                <fo:flow flow-name="xsl-region-body" font-family="Times" font-size="9pt">
                    <fo:block font-weight="bold" margin-top="40mm">Table of Contents</fo:block>
					<fo:table>
						<fo:table-column column-width="5mm"/>
						<fo:table-column column-width="7mm"/>
						<fo:table-column column-width="160mm"/>

						<fo:table-body>
							<xsl:apply-templates select="athlete" mode="toc"/>
						</fo:table-body>
					</fo:table>
                </fo:flow>
            </fo:page-sequence>
            
        </fo:root>
    </xsl:template>


    <xsl:template match="athlete" mode="toc">
		<fo:table-row>
			<fo:table-cell>
				<fo:block text-align="right">
					<xsl:value-of select="position()"/>&#160;
				</fo:block>
			</fo:table-cell>

			<fo:table-cell>
				<fo:block font-family="monospace">
					<xsl:value-of select="nationality"/>
				</fo:block>
			</fo:table-cell>

			<fo:table-cell>
				<fo:block>
					<xsl:value-of select="lastname"/>&#160;
					<xsl:value-of select="firstname"/>
					<fo:inline>
						<fo:leader width="100%" leader-pattern="dots"/>
					</fo:inline>
					<!-- <fo:page-number-citation ref-id="{generate-id()}"/> -->
					test
				</fo:block>
			</fo:table-cell>

		</fo:table-row>
	</xsl:template>

</xsl:stylesheet>
