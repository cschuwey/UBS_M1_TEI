<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <body>
                <h1>Les Caractères de La Bruyère</h1>
                <xsl:apply-templates select="//tei:div2[@type='chapitre' and @n='7']"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:body">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:app/tei:lem">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:app/tei:rdg | tei:teiHeader | tei:note"/>
</xsl:stylesheet>
