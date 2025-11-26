<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:template match="tei/TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                    <title>Titre de l'œuvre</title>
            </head>
            <body>
                <h1><xsl:apply-templates select="//tei:body//div3"></xsl:apply-templates>Grand titre</h1>
                <h2>Titre de chapitre</h2>
                <p>Premier paragraphe, avec <span style="color:red">du texte en rouge</span></p>
                <p>Deuxième paragraphe</p>
            </body>
        </html>
    </xsl:template>
  
</xsl:stylesheet>
