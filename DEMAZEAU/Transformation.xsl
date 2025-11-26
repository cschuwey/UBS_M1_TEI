<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
    <html>
        <head>
        <meta charset="UTF-8">
            <title>titre de l'oeuvre</title>
       </meta>
       </head>
    </html>
        </xsl:template>
    <xsl:template match="tei:TEI">
        <html>
    <body>
       
        <h1><xsl:apply-templates select="//tei:front"/></h1>

        <p><span style="color:red"><xsl:apply-templates select="//tei:div2[@source='#ed6_NUMM-8712342']"/></span></p>
       
       Nombre de remarques du fichier :
        <xsl:value-of select="count[//tei:div2[@type='remark']]"/>
    </body>
</html>
</xsl:template>
</xsl:stylesheet>
<!--Impossible de transformer alors ques tous les fichiers sont bien formés et valides--!>
