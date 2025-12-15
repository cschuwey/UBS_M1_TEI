<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
   
   <xsl:template match="tei:TEI">
    <html>
        <head>
            <meta charset="UTF-8"/>
                <title> <xsl:apply-templates select="/tei:sourceDesc/tei:bibl/tei:title"/> </title>
        </head>
        <body>
            <h1><xsl:apply-templates select="//tei:body/tei:div1[@n='2']/tei:head"/></h1>
            <h2><xsl:apply-templates select="//tei:body/tei:div1[@n='3']/tei:div2[@n='3'][@type='chapter']/tei:head"/></h2>
           Nombres de remarques : <xsl:value-of select="count(//tei:div1[@n='3']/tei:div2[@n='3']/tei:div3[@n='2'][@type='remark']/tei:p)"/> 
           Nombres de variantes : <xsl:value-of select="count(//tei:app)"/>
            <p> <xsl:apply-templates select="//tei:div1[@n='3']/tei:div2[@n='3']/tei:div3[@n='2'][@type='remark']/tei:p"/> </p>
        </body>
    </html>
   
   </xsl:template>
    
    <xsl:template match="tei:div3/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:div3/tei:p/tei:app">
        <xsl:apply-templates select="tei:rdg[@source='#ed3']"/>/ <xsl:apply-templates select="tei:rdg[@source='#ed1694']"/>
    
    </xsl:template>
<xsl:template match="tei:rdg[@source='#ed3']">
    [<span style="color:green"><xsl:apply-templates/></span>
</xsl:template>
    
<xsl:template match="tei:rdg[@source='#ed1694']"> 
    <span style="color:deeppink"><xsl:apply-templates></xsl:apply-templates></span>]
    </xsl:template>

    <xsl:template match="tei:head">
        <span style="color:hotpink"><xsl:apply-templates/></span>
    </xsl:template>
</xsl:stylesheet>

