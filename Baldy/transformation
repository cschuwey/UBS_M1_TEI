<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0" xmlns:tei="http://www.tei-c.org/ns/1.0">
    
    <xsl:template match="tei:TEI">
        <html>
            <head><h1>Les Caractères de Théophraste</h1></head>
            
            <body><p><xsl:apply-templates select="//tei:div3[@type='remark']/tei:p"/></p></body>
        </html>
        
    </xsl:template>
    <xsl:template match="tei:p"><xsl:apply-templates/><br/></xsl:template>
    <xsl:template match="tei:app"><span style="color:red"><xsl:apply-templates select="tei:rdg[@source='#ed3_1688']"/></span></xsl:template>
</xsl:stylesheet>
