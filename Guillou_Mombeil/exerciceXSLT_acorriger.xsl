<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="tei:TEI">
        <html>
            <head>
            <title><xsl:apply-templates select="//tei:titleStmt/tei:title"></xsl:apply-templates></title>
                </head>
            <body>
                <h1><xsl:apply-templates select="//tei:titleStmt/tei:title"></xsl:apply-templates></h1>
                <div><xsl:apply-templates select="//tei:div4/tei:p"></xsl:apply-templates></div>
                <p><xsl:apply-templates select="//tei:persName"></xsl:apply-templates></p>
                <xsl:apply-templates select="//tei:app/tei:rdg"></xsl:apply-templates>
                <h2>Bibliographie</h2>
                <xsl:apply-templates select="//tei:bibl"></xsl:apply-templates>
            </body>
    
            </html>
    </xsl:template>
    
    <xsl:template match="tei:persName">
        <span class="personne"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:div4">
        <div><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>    
    
    <xsl:template match="tei:rdg[1]">
         <xsl:apply-templates/> /
    </xsl:template>
    <xsl:template match="tei:rdg[2]">
        <xsl:apply-templates/>
    </xsl:template>
    
    
</xsl:stylesheet>
