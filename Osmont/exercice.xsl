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
                    <title><xsl:apply-templates select="//tei:titleStmt"/></title>
            </head>
            <body>
                <xsl:apply-templates select="//tei:titleStmt"/>
                <p><xsl:apply-templates select="//tei:persName"/></p>
                <xsl:apply-templates select="//tei:div3[@type='remark']"/>
                <xsl:apply-templates select="//tei:app"/>
                <h2>Bibliographie</h2>
                <xsl:apply-templates select="//tei:bibl"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <xsl:apply-templates select="//tei:rdg[1]"/> / <xsl:apply-templates select="//tei:rdg[2]"/>
    </xsl:template>
    
    <xsl:template match="//tei:persName">
        <span class="personne"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="//tei:titleStmt">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    
    <xsl:template match="//tei:div3[@type='remark']">
        <div><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="//tei:bibl">
        <xsl:apply-templates select="//tei:title"/><br/>
        <xsl:apply-templates select="//tei:author"/> <br/>
        <xsl:apply-templates select="//tei:edition"/><br/>
        <xsl:apply-templates select="//tei:publisher"/> <br/>
        <xsl:apply-templates select="//tei:pubPlace"/><br/>
        <xsl:apply-templates select="//tei:date"/> <br/>
        <xsl:apply-templates select="//tei:ref"/> <br/>
        <xsl:apply-templates select="//tei:idno"/> <br/>
        </xsl:template>
   
</xsl:stylesheet>


