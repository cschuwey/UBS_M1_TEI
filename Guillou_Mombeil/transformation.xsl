<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="tei:TEI">
        <html>
            <head></head>
            <body>
                <h1><xsl:apply-templates select="//tei:title"/></h1>
                
                <xsl:template match="//tei:div4/tei:p">
                    <xsl:apply-templates select="//tei:app/tei:rdg"/>
                    <span style="color:red"></span>
            </body>
        </html>
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>
