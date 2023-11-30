<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="tei:TEI">
        <html>
            <head></head>
            <body>
                <h1>Les Caractères de La Bruyère</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader"/>
    
    <xsl:template match="tei:p">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match=" tei:app/tei:lem">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:rdg"/>
    
</xsl:stylesheet>