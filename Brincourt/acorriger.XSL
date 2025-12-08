<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
    <html>
        <head>
           
        </head>
        <body>
            <!-- Séléctionner les div2 -->  
            <span style="color: red;"><xsl:apply-templates select="//tei:div2"/></span>            <!-- Il me met tout ce qu'il y a dans les div2.-->
                    
            <!-- Séléctionner les p des div3 -->
            <p><span style="color: red;"><xsl:apply-templates select="//p"/></span></p>
        </body>
    </html>
    </xsl:template>   
    <xsl:template match="sourceDesc">
        <p><xsl:apply-templates select="//tei:bibl/author"/></p> 
    </xsl:template>
    
    <xsl:template match="bibl">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <!-- poser des questions au prof -->
        
        <xsl:template match="tei:persName">
            <span class='personne'><xsl:apply-templates/></span>
        </xsl:template>
        
        <xsl:template match="tei:div3[@type='remark']">
            <div style="margin-left:5px"><xsl:apply-templates/></div>
        </xsl:template>
        
        <xsl:template match="tei:div3[@type='remark']/tei:p">
            <p><xsl:apply-templates/></p>
        </xsl:template>
</xsl:stylesheet>
