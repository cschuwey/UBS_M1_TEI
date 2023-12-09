<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="/">
        <html>
            <body>
            <h1>Les Caractères de la Bruyère</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:body"> 
    <xsl:apply-templates/>
    </xsl:template>
 
    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:app/rdgGrp/lem">
        <xsl:apply-templates/>
    </xsl:template>
       <xsl:template match="tei:div3/tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:note[@type='cle']"/>
</xsl:stylesheet>
