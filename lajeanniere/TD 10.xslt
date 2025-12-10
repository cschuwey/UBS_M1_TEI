<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="tei:TEI">
    <html>
        <body>
            <h1><xsl:apply-templates select="//tei:titleStmt/tei:title"/></h1>
                <xsl:apply-templates select="//tei:div4/tei:p"/>
            Nombre de remarques: <xsl:value-of select="count(//tei:div4/tei:p)"></xsl:value-of>
        </body>
    
    </html>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
        
    <xsl:template match="tei:app">
        <span style="color:purple">
        <xsl:apply-templates select="tei:rdg[@source='#P-03']"/>
        /<xsl:apply-templates select="tei:rdg[@source='#P-06']"/>
        </span>
    </xsl:template>
    
    
</xsl:stylesheet>
