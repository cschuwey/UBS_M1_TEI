<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:strip-space elements="*"/>

    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title><xsl:apply-templates select="//tei:titleStmt/tei:title"/></title>
            </head>
            <body>
                <h1>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </h1>
                <p><xsl:apply-templates select="//tei:div[@n='3'][@type='remark'][@source='#ed3_ex1']/tei:p"/></p>
                <h2>
                    <xsl:apply-templates select="//tei:div[@n='1']/tei:head[@type='main']"/>
                </h2>
                <xsl:apply-templates select="//tei:bibl"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:div[@n='3'][@type='remark'][@source='#ed3_ex1']/tei:p">
         <div><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="tei:app">
        <span style="color:red">
            <xsl:apply-templates select="tei:rdg[@source='#ed5_ex1']"/>
        </span>
        /
        <span style="color:green">
            <xsl:apply-templates select="tei:rdg[@source='#ed3_ex1']"/>
        </span>
    </xsl:template>
    <xsl:template match="tei:bibl">
        <p><xsl:apply-templates select="@xml:id"/> :
        <xsl:apply-templates select="tei:author"/>,
            <xsl:apply-templates select="tei:title"/>.</p>
            <p><xsl:apply-templates
                select="tei:publisher"/>.</p>
           <p> Cote : <xsl:apply-templates
                select="tei:idno"/></p>
    </xsl:template>
</xsl:stylesheet>
