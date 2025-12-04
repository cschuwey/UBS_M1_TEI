<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- Contrôle de la sortie HTML en UTF-8 -->
    <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    
    <!-- Supprimer les espaces inutiles -->
    <xsl:strip-space elements="*"/>
    
    <!-- Template principal -->
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </title>
            </head>
            <body>
                <!-- Affichage du titre -->
                <h1><xsl:apply-templates select="//tei:teiHeader/filesDesc/tei:titleStmt/tei:title"/></h1>
                
                <p><xsl:apply-templates select="//tei:persName"/></p>
                
                
                
                <p><xsl:apply-templates select="//tei:body//tei:div3[@type='remark']"/></p>
            </body>
        </html>
    </xsl:template>
    
    
    
</xsl:stylesheet>
