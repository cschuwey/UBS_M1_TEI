<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:strip-space elements="*"/>

    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Titre de l'œuvre</title>
            </head>
            <body>
                <h1><xsl:apply-templates select="//tei:head//div[@n='1']"/></h1>
                <h2>Titre de chapitre</h2> voici les remarques <p><xsl:apply-templates
                        select="//tei:div[@n='3']"/></p>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//tei:body//tei:div[@n='3']/tei:p/tei:app[@source='#ed1614']/tei:rdg">
        <p>
            <span style="color:red">
                <xsl:apply-templates/>
            </span>
        </p>
    </xsl:template>

    <!--je suis désolé malheuresment je n'arrive pas à mettre qu'une seule édition et ça ne veut pas se mettre en rouge, même après avoir essayer et demander de l'aide à différentes personnes....-->

</xsl:stylesheet>
