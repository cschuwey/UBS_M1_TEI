<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
        <head>
            <meta charset="UTF-8"></meta>
            <title><xsl:apply-templates select="//tei:teiHeader//tei:titleStmt/tei:title"/></title>
        </head>
        <body>
            <h1><xsl:apply-templates select="//tei:div1[@type='Caracteres']/tei:head[@type='main']"/></h1>
            <h2><xsl:apply-templates select="//tei:div1[@type='Caracteres']/tei:head[@type='sub']"/></h2>
            <h3><xsl:apply-templates select="//tei:div2[@type='Chapter'][@n='42']/tei:head"/></h3>
            <xsl:apply-templates select="//tei:div2[@n='42']/tei:div3[@type='remark']/tei:p"/>
            <xsl:apply-templates select="//tei:div2[@n='42']/tei:div3[@type='remark']/tei:note[@source='#car1688']"/>
            <xsl:apply-templates select="//tei:div2[@n='42']/tei:div3[@type='remark']/tei:app/tei:rdg/tei:note[@source='#car1688']"/>
        </body>
    </xsl:template>
    
    <xsl:template match="tei:div2[@n='42']/tei:div3[@type='remark']/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
   
    <xsl:template match="tei:div2[@n='42']/tei:div3[@type='remark']/tei:note[@source='#car1688']">
        <p><xsl:apply-templates/></p>
    </xsl:template>
   
    <xsl:template match="tei:div2[@n='42']/tei:div3[@type='remark']/tei:app/tei:rdg/tei:note[@source='#car1688']">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <span style="color:red">
            <xsl:apply-templates select="tei:rdg[@source='#car1688']"/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>
