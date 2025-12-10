<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:template match="tei:TEI">
        <html>
            <body>
                <h1><span style="color:blue"><xsl:apply-templates select="//tei:titleStmt/tei:title"></xsl:apply-templates></span></h1>
                <p><xsl:value-of select="count(//tei:div3[@type='remark'])"></xsl:value-of></p>
                <p><xsl:value-of select="count(//tei:app/tei:rdg)"></xsl:value-of></p>
                <xsl:apply-templates select="//tei:div3[@type='remark']/tei:p"></xsl:apply-templates>
            </body>
        </html>
        
        
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:app">
        [<xsl:apply-templates select="tei:rdg[@source='#ed3']"/> /
        <xsl:apply-templates select="tei:rdg[@source='#ed5']"></xsl:apply-templates>]
    </xsl:template>
    
    
        
</xsl:stylesheet>
