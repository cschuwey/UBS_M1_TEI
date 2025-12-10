<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <title><xsl:apply-templates select="//tei:titleStmt/tei:title"/></title>
            </head>
            <body>
                <h1 style="text-align:center;margin:50px 0"><xsl:apply-templates select="//tei:titleStmt/tei:title"/></h1>
                <xsl:apply-templates select="//tei:revisionDesc"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:listChange">
        <div style="width:100%">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:change">
        <div style="height:100px; width:80%;border:1px solid black;margin:0 auto 10px;padding:20px">
            <p><xsl:value-of select="@when"/></p>
            <p><xsl:if test="@who='#mdaeninckx'">Par Mickaël Daeninckx</xsl:if></p>
            <p>Contenu : <xsl:apply-templates/></p>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
