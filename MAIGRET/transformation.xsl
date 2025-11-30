<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
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
            <p>Je vous avoue ne pas DU TOUT avoir compris ;-;. 
                Pour faire preuve d'honnêteté, la TEI a été mise carrément au second plan cette semaine, et je m'en excuse.
            </p>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
