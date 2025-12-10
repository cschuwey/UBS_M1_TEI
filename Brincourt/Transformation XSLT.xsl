<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="tei:TEI">
        <html>
            <head>
                <h1>
                    <xsl:apply-templates
                        select="//tei:div1[@type='part'][@n='2']/tei:head[@type='title']"/>
                </h1>
            </head>
            <body>
                <p>
                    <xsl:value-of select="count(//tei:div3[@type='remark'])"/>
                </p>
                <p>
                    <xsl:value-of select="count(//tei:app)"/>
                </p>
                <xsl:apply-templates select="//tei:div3[@type='remark']"/>
                <xsl:apply-templates select="//tei:list[@type='chapter']"/>
            </body>
        </html>

    </xsl:template>

    <xsl:template match="tei:div3[@type='remark']">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:app"> [<xsl:apply-templates select="tei:rdg[@source='#ed7']"
            />/<xsl:apply-templates select="tei:rdg[@source='#ed3_ex1']"/>] </xsl:template>

    <xsl:template match="tei:list[ancestor::tei:div2(@type='table_of_contents')]">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>


</xsl:stylesheet>
