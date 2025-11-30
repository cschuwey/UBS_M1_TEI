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
                    <title><xsl:apply-templates select="//tei:teiHeader//tei:titleStmt/tei:title"/></title>
            </head>
            <body>
                <h1><xsl:apply-templates select="//tei:body//tei:div3//tei:p"></xsl:apply-templates>Grand titre</h1>
                <--! Mon travail n'est pas clair et mal abouti, je m'en excuse, c'est dû à une mauvaise gestion de mon temps dernièrement,
                    je ferai mieux la prochaine fois.>
                <h2>Titre de chapitre</h2>
                <p><xsl:apply-templates select="//tei:div3[@type='remark' @source='ed7']//tei:p"/> <span style="color:red"></span></p>
                <p>Deuxième paragraphe</p>
            </body>
        </html>
    </xsl:template>
  
</xsl:stylesheet>
