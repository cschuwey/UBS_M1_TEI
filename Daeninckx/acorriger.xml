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
                <title><xsl:apply-templates select="//tei:teiHeader//tei:titleStmt/tei:title"/></title>
            </head>
            <body style="padding:0; margin:0; border-box:border">
                <h1 style="margin:30px 0 0 30px"><xsl:apply-templates select="//tei:teiHeader//tei:titleStmt/tei:title"/></h1>
                <xsl:apply-templates select="//tei:div3[@type='remark']"/>
                <p style="margin-left:15px"><xsl:apply-templates select="//tei:persName"/></p>
                <br/>
                <h2 style="margin-left:30px">Bibliographie</h2>
                <p><xsl:apply-templates select="//tei:bibl[@xml:id='ed3_ex1']"/></p>
                <p><xsl:apply-templates select="//tei:bibl[@xml:id='ed6_ex1']"/></p>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:persName">
        <span class='personne'><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:div3[@type='remark']">
        <div style="margin-left:15px"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:div3[@type='remark']/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <xsl:apply-templates select="tei:rdg[@source='#ed3_ex1']"/> / <xsl:apply-templates select="tei:rdg[@source='#ed6_ex1']"/>
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        <div style="padding:15px; margin-left:15px;border:1px solid black;display:inline-block">
            <p style="font-size:1.2rem; font-weight:600"><xsl:apply-templates select="tei:title"/></p>
            <p style="text-transform: uppercase"><xsl:apply-templates select="tei:author"/></p>
            <p><xsl:apply-templates select="tei:edition"/></p>
            <p><xsl:apply-templates select="tei:publisher"/></p>
            <p><xsl:apply-templates select="tei:pubPlace"/></p>
            <p><xsl:apply-templates select="tei:date"/></p>
            <p><xsl:apply-templates select="tei:idno"/></p>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
