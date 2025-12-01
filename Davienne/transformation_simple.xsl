<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
        Nombre de remarques : <xsl:value-of select="count(//tei:div3[@type='remark'])"/>
        
        <html>
            <head>
                <meta charset="UTF-8"/>
                    <title>Titre de l'œuvre</title>
            </head>
            <body>
                <h1><xsl:apply-templates select="//tei:sourceDesc/tei:bibl[1]/tei:title"/></h1>
                <xsl:apply-templates select="//tei:div3[@type='remark']/tei:p"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="//tei:div3[@type='remark']/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <span style="color:red"><xsl:apply-templates select="tei:rdg[@source='#ed3']"/></span>
    </xsl:template>
    
</xsl:stylesheet>


