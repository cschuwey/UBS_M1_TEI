<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <title><xsl:apply-templates select="tei:teiHeader/tei:FileDesc/tei:title[@type='main']"/></title>
            </head>
            
            <body>
                <head><xsl:value-of select="head"/> <xsl:apply-templates/></head>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="tei:teiHeader"/>
    
    
    <xsl:template match="tei:note"/>
    
    
    <xsl:template match="tei:rdg"/>
    
    
    <xsl:template match="tei:div3"> 
        <p><xsl:value-of select="@n"/> <xsl:apply-templates/></p>
        <!--corriger avec doc prof, le mettre au début de body ?--></xsl:template>
        
    
    <xsl:template match="tei:p">     
        <p><xsl:value-of select="count(//tei:app)"/><xsl:apply-templates/></p>
    </xsl:template>
    
    
    <xsl:template match="tei:app">     
       <span class="changer"><xsl:apply-templates/></span>
    </xsl:template>
    
    
    <xsl:template match="tei:lem">     
        <span class="changer"><xsl:apply-templates/></span>
    </xsl:template>
    
    
    <xsl:template match="tei:rdg">     
        <span class="changer"><xsl:apply-templates/></span>
    </xsl:template>
        
    
    
    
</xsl:stylesheet>









