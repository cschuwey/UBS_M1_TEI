<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:tei="http://www.tei-Org/ns/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8"></meta>
                <title><xsl:apply-templates select="tei:teiheader//tei:titlestmt/tei:title"/></title>
            </head>
            <body>
                <h1>
                    <xsl:apply-templates select="//tei:bibl/tei:title"/>
                </h1>
                <h2>
                    <xsl:apply-templates select="//tei:div1[@n='1']/tei:head"/>
                </h2>
                <h3>
                    <xsl:apply-templates select="//tei:div1[@N='2']/tei:head"/>
                </h3>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:p">
        <p> <xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:div1/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:div2/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:div3/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="//tei:div1[@n='2']/tei:head">
        <span style="color:red"><xsl:apply-templates select="tei:div1[@n='2']/tei:head"/></span>
    </xsl:template>
</xsl:stylesheet>