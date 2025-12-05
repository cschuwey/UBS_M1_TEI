<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title><xsl:apply-templates select="//tei:titleStmt/tei:title"></xsl:apply-templates></title>
            </head>
            <body>
                <h1><xsl:apply-templates select="//tei:titleStmt/tei:title"></xsl:apply-templates></h1>
                <p><xsl:apply-templates select="//tei:parsName"></xsl:apply-templates></p>
                <div><xsl:apply-templates select="//tei:div[@type='remark']/tei:p"></xsl:apply-templates></div> 
                <h2> Bibliographie</h2>
                <xsl:apply-templates select="//tei:bibl[@xml:id='ed3']"></xsl:apply-templates>
                <xsl:apply-templates select="//tei:bibl[@xml:id='ed5']"></xsl:apply-templates>
            </body>
        </html>
        
        <p><xsl:apply-templates select="/tei:p"></xsl:apply-templates></p>
       
        
        
    </xsl:template>
    <xsl:template match ="tei:persName">
        <span class="personne"/>
    </xsl:template>
    <xsl:template match="tei:div[@type='remark']">
    </xsl:template>
     <xsl:template match="tei:app">(<xsl:apply-templates select="tei:rdg[@source='#ed3']"/>/<xsl:apply-templates select="tei:rdg[@source='#ed5']"/>)</xsl:template>
<xsl:template match="tei:bibl">
    <p><xsl:apply-templates select="tei:title"></xsl:apply-templates></p>
    <p><xsl:apply-templates select="tei:author"></xsl:apply-templates></p>
    <p> <xsl:apply-templates select="tei:date"></xsl:apply-templates></p>
    <p><xsl:apply-templates select="tei:edition"></xsl:apply-templates></p>
    <p><xsl:apply-templates select="tei:publisher"></xsl:apply-templates></p>
        <p><xsl:apply-templates select="tei:pubPlace"></xsl:apply-templates></p>
        <p><xsl:apply-templates select="tei:idno"></xsl:apply-templates></p>

</xsl:template>
</xsl:stylesheet>
