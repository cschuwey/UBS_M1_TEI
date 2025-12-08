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
                    <xsl:apply-templates select="//tei:header//tei:bibl [@xml:id='3ed']/tei:title"/>
                </title>
            </head>
            <body>
                <h1>
                    <xsl:apply-templates
                        select="//tei:div[@n='1'][@corresp='ark:/12148/cb11942641d']/tei:head"/>
                </h1>
                <xsl:apply-templates select="//tei:div[@n='3']/tei:p"/>
                <p>
                    <xsl:apply-templates select="//tei:persname"/>
                </p>
                <section>
                    <xsl:apply-templates select="//tei:div [@n='3'][@type='remark']"/>
                </section>
                <xsl:apply-templates select="//tei:div[@type='remark'][@n='3']"/>
                                                           <h2>Bibliographie</h2>
                <xsl:apply-templates select="//sourceDesc/tei:bibl"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="//tei:div[@type='remark'][@n='3']/tei:p/tei:app"/>

    <xsl:template match="tei:app/tei:rdg [@source='#ed3']">
        <xsl:apply-templates select="tei:rdg[1]"/>
        /
        <xsl:apply-templates select="tei:rdg[2]"/>
        <span style="color:red"/>
    </xsl:template>
    <xsl:template match="//tei:persName">
        <xsl:apply-templates/>
        <span class="personne"/>
    </xsl:template>
    <xsl:template match="p"><p><xsl:apply-templates/></p></xsl:template>
    <xsl:template match="tei:bibl">
        <xsl:apply-templates select="tei:author"/>
        <xsl:apply-templates select="@xml:id"/>
        <xsl:apply-templates select="tei:edition"/>
    </xsl:template>
</xsl:stylesheet>
