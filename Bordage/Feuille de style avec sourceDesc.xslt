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
               
            </head>
  
            <body>
                <h1><xsl:apply-templates select="//tei:front/tei:div1/tei:div2[@type='partie1']/tei:head"></xsl:apply-templates></h1>
                <h1><xsl:apply-templates select="//tei:front/tei:div1/tei:div2[@type='partie2']/tei:head"></xsl:apply-templates></h1>
                
                <h2><xsl:apply-templates select="//tei:body/tei:div1[@type='partie1']/tei:head"></xsl:apply-templates></h2>
                <h2><xsl:apply-templates select="//tei:body/tei:div1[@type='partie2']/tei:head"></xsl:apply-templates></h2>
              
                <p><xsl:apply-templates select="//tei:body//tei:div5[@type='remark']/tei:p"></xsl:apply-templates></p>
                
                <p><xsl:apply-templates select="//tei:sourceDesc/tei:bibl[@xml:id='ed3_1688']"></xsl:apply-templates></p>
                <p><xsl:apply-templates select="//tei:sourceDesc/tei:bibl[@xml:id='ed6_1691']"></xsl:apply-templates></p>
                
                Nombre de remark dans le ficher : <xsl:value-of select="count(//tei:div5[@type='remark'])"/> 
            </body>
        </html>
    
       
    </xsl:template>
    <xsl:template match="tei:div5[@type='remark']/tei:p">
        <p><xsl:apply-templates></xsl:apply-templates></p>
    </xsl:template>
    <xsl:template match="tei:div5[@type='remark']/tei:p/tei:app/tei:rdg">
        <p><span style="color:red"><xsl:apply-templates/></span></p>
    </xsl:template>
    
    <xsl:template match="tei:div2/tei:head">
        <p><xsl:apply-templates></xsl:apply-templates></p>
    </xsl:template>
    <xsl:template match="tei:div2/tei:head">
        <span style="color:blue"><xsl:apply-templates/></span>
    </xsl:template>
    
</xsl:stylesheet>


