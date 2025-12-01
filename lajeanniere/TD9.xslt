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
                <h1><xsl:apply-templates select="//tei:div2[@type='part']/tei:head"></xsl:apply-templates></h1>
                <xsl:apply-templates select="//tei:div4[@type='remarque']/tei:p"></xsl:apply-templates>
                <xsl:apply-templates select="//tei:div4[@type='remarque']/tei:p/tei:app"></xsl:apply-templates>
                <h2>Bibliographie</h2>
                <xsl:apply-templates select="//tei:sourceDesc"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//tei:div4[@type='remarque']/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <span style="color:red"><xsl:apply-templates select="tei:rdg[@source='#P-03']"></xsl:apply-templates></span>
    </xsl:template>
</xsl:stylesheet>
