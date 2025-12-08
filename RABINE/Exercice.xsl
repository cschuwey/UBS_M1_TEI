<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8">
                    <title><xsl:apply-templates select="tei:titleStmt/tei:title"></xsl:apply-templates></title>
                </meta>
            </head>
            <body>
                <h1><xsl:apply-templates select="tei:titleStmt/tei:title"/></h1>
                <p><xsl:apply-templates select="//tei:persName"/></p>
                <div><xsl:apply-templates select="//tei:div[@type='remark']/tei:p"/></div>
                <h2>Bilbiographie</h2>
                <xsl:apply-templates select="//tei:sourceDesc//tei:bibl[@xml:id='ed3']"/>
                <xsl:apply-templates select="//tei:sourceDesc//tei:bibl[@xml:id='ed5']"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:persName">
        <span class="personne"></span>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='remark']">
    </xsl:template>
    
    <xsl:template match="tei:app">(<xsl:apply-templates select="tei:rdg[@source='@ed3']"/>/<xsl:apply-templates select="tei:rdg[@source='@ed5']"/>)</xsl:template>
    
    <xsl:template match="tei:bibl">
        <xsl:apply-templates select="@xml:id"/>
        <xsl:apply-templates select="tei:author"/>
        <xsl:apply-templates select="tei:date"/>
        <xsl:apply-templates select="tei:edition"/>
        <xsl:apply-templates select="tei:publisher"/>
        <xsl:apply-templates select="tei:pubPlace"/>
        <xsl:apply-templates select="tei:idno"/>
        
    </xsl:template>
    
    
        


        
        


        
        
    </xsl:template>
</xsl:stylesheet>
