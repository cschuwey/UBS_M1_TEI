<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>

    <xsl:template match="tei:TEI">
        <html lang="fr">
            <head>
                <meta charset="utf-8"/>
                <title>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </title>
            </head>

            <body>
                <h1>
                    <xsl:apply-templates select="//tei:div[@type='book'] [@n='2']/tei:div[@type='chapter'] [@n='0']//tei:head[1]"/>
                </h1>
                <xsl:apply-templates select="//tei:div[@type='remark']"/>

                <p> Bonus : Nombre de remarques dans mon fichier TEI :<br/>
                    <xsl:value-of select="count(//tei:div[@type='remark'])"/>
                </p>
            </body>
        </html>
    </xsl:template>

    <!-- <xsl:template match="//tei:div[@type='book'] [@n='2']//tei:div[@type='chapter']">
        <p>
            <xsl:apply-templates select="//tei:p"/> pour afficher tous les paragraphes, pas fini
        </p>
    </xsl:template> -->

    <xsl:template match="tei:div[@type='remark']">
        <p> Une remarque : <br/>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:app">
        <span style="color:red">
            <xsl:apply-templates select="tei:rdg[@corresp='#ed3-88']"/>
        </span>
    </xsl:template>

</xsl:stylesheet>
