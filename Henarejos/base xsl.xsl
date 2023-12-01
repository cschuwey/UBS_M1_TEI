<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="tei:TEI">
        <html>
            <head/>
            <body>
                <h1>Les caractères de la Bruyère</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:teiHeader"/>


    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:app/lem">
        <!-- Je ne sais pas s'il faut mettre une balise html pour remplacer le lem. S'il en faut une je ne la connait pas. Mais d'un autre côté comme on sélectionne juste une version du texte, il ne me semble pas nécessaire d'en mettre une. -->
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:rdg"/>
    <xsl:template match="tei:note"/>

</xsl:stylesheet>
