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
                <title>Titre de l'oeuvre</title>
            </head>
            <body>
                <h1><xsl:apply-templates select="//tei:div1[@type='part'] [@n='1']/tei:head[1]"/></h1>
                <h2>Titre de chapitre</h2>
                </p><xsl:apply-templates select="//tei:body//tei:div3[@type='remark']/tei:p"/>
            </body>
        </html>
        
       
        
        
    </xsl:template>
 <xsl:template match ="tei:div3[@type='remark']/tei:p">
        <p><xsl:apply-templates/></p>
    <xsl:template match="//tei:body//tei:div3[@type='remark']/tei:p/tei:app/tei:rdg[@source='#ed3']">
        <span style="color:red"><xsl:apply-templates/></span>
    </xsl:template>
    
</xsl:stylesheet>
