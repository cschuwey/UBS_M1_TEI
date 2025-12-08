<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>
                    <xsl:apply-templates select="//tei:teiHeader//tei:titleStmt/tei:title"/>
                </title>
            </head>
            <body>
                <h1>
                    <xsl:apply-templates select="//tei:teiHeader//tei:titleStmt/tei:title"/>
                </h1>
                <p>
                    <xsl:apply-templates select="tei:persName"/>
                </p>
                <xsl:apply-templates select="//tei:div3[@type='remark']"/>
                
                <h2>Bibliographie</h2>
                <xsl:apply-templates select="//tei:bibl"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:persName">
        <span class="personne">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:div3[@type='remark']">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei/app"> 
        ( <xsl:apply-templates select="//tei:rgd[@n='1']"/> /
        <xsl:apply-templates select="//tei:rgd[@n='2']"/> ) 
    </xsl:template>
    <xsl:template match="tei:bibl">
        <xsl:apply-templates select="//tei:title"/>
        <br/>
        <xsl:apply-templates select="//tei:author"/>
        <br/>
        <xsl:apply-templates select="//tei:date"/>
        <br/>
        <xsl:apply-templates select="//tei:edition"/>
        <br/>
        <xsl:apply-templates select="//tei:publisher"/>
        <br/>
        <xsl:apply-templates select="//tei:pubPlace"/>
        <br/>
        <xsl:apply-templates select="//tei:idno"/>
        <br/>
    </xsl:template>
</xsl:stylesheet>
