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
                    <title>Titre de l'œuvre</title>
            </head>
            <body>
                <h1><xsl:apply-templates select="//tei:head[ancestor::tei:div1]"/></h1>
                <h2>Titre de chapitre</h2>
                <p>Premier paragraphe, avec <span style="color:red">du texte en rouge</span></p>
                <p>Deuxième paragraphe</p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
