<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:strip-space elements="*"/>

    <xsl:template match="tei:TEI">

        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </title>
            </head>
            <body>
                <h1><xsl:apply-templates select="//tei:div1[@n='1']/tei:head"/></h1>
                <h2><xsl:apply-templates select="//tei:div1[@n='2']//tei:head"/></h2> Voici les
                remarques <p><xsl:apply-templates select="//tei:div3[@type='remarque']/tei:p[@n=1]"/> du texte en rouge</p>
                <p><xsl:apply-templates select="//tei:div3[@type='remarque']/tei:p[@n='2']"/></p>
                <p><xsl:apply-templates select="//tei:p[@n='3']"/></p>
                <span style="color:red"><xsl:apply-templates
                        select="//tei:app/tei:rdg[@source='#ed3_ex1']"/></span>
            </body>
        </html>
    </xsl:template>




</xsl:stylesheet>
