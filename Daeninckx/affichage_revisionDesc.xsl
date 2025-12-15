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
        <div style="width:80%;border:1px solid black;margin:0 auto 10px;padding:20px;display:flex;justify-content:space-around">
            <div style="width:10%;display:flex;justify-content:center;align-items:center">
                <xsl:if test="@who='#mdaeninckx'"><img style="width:100%" src="logo_ubs.png"/></xsl:if>
            </div>
            <div style="width:80%">
                <p><xsl:apply-templates select="@when"/></p>
                <p style="font-size:1.2rem">Contenu : <xsl:apply-templates/></p>
            </div>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
