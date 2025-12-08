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
                <title><xsl:apply-templates select="//tei:titleStmt/tei:title"/></title>
                <h1><xsl:apply-templates select="//tei:div1/tei:head[@type='main']"/></h1>
                <xsl:apply-templates select="//tei:persName"/>
                <xsl:apply-templates select="//tei:div3[@type='remark']/tei:p"/>
                <h2>Bibliographie</h2>
                <xsl:apply-templates select="//tei:sourceDesc/tei:bibl"></xsl:apply-templates> 
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:head[@type='main']">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    
    <xsl:template match="tei:div3[@type='remark']/tei:p">
        <div><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <xsl:apply-templates select="tei:rdg[@wit='#ed3']"/>
        <xsl:apply-templates select="tei:rdg[@wit='#reprod']"/>
    </xsl:template>
    
    <xsl:template match="tei:persName">
        <span class="personne">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:sourceDesc/tei:bibl">
        <div><xsl:apply-templates/></div>
    </xsl:template>
    
</xsl:stylesheet>
