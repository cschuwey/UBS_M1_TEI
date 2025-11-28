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
            <body>
                <h1><xsl:apply-templates select="//tei:div1[@type='book'][@n='1']/tei:head"/></h1>
                <h2><xsl:apply-templates select="//tei:div2[@type='chapter'][@n='21']/tei:head"/></h2>
                <p><xsl:apply-templates select="//tei:div2[@type='chapter'][@n='21']/tei:div3[@type='remark']/tei:p"/></p>
                <span style="color:blue"><p>Bonus: il y a <xsl:value-of select="count(//tei:div2[@type='chapter'][@n='21']/tei:div3[@type='remark'])"/> remarque rédigée ci-dessus.</p></span>
            </body>
        </html>
    </xsl:template> 
    
    <xsl:template match="tei:app">
        <span style="color:red">
            <xsl:apply-templates select="//tei:rdg[@corresp='#ed5']"/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>
