<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title><xsl:apply-templates select="//tei:titleStmt/tei:title"/></title>
            </head>
            <body>
                <h1><xsl:apply-templates select="//tei:div1[@n='1']/tei:head"/></h1>
                <xsl:apply-templates select="//tei:div3[@type='remark']//tei:p"/>
                <h2>Bibliogaphie</h2>
            </body> 
            </html>
               </xsl:template>
      
    <xsl:template match="//tei:div3[@type='remark']">
        <p><xsl:apply-templates/></p> 
    </xsl:template>
 
<xsl:template match="tei:p">
    <p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="tei:app">
    <xsl:apply-templates select="//tei:app/tei:rdg[@source='#ed3_ex1']/>
        /
<xsl:apply-templates select="//tei:app/tei:rdg[@source='#ed5_ex1']/>
</xsl:stylesheet>
