<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="tei:TEI">
        <html>
            <head/>
            <body>
                <h1>Les Caractères de La Bruyère</h1>
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
    
    <xsl:template match="tei:note"/>
    
    <!-- Selon moi, pour seulement afficher les lem, il suffit de dire de ne pas afficher les rdg (dans le cadre de mon document de travail -->
    
    <xsl:template match="tei:rdg"/>
    
   <!-- Test pour colorer les notes différemment

    <xsl:template match="tei:note[@type='cle']">
        <note style="color:purple;">
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    
    <xsl:template match="tei:note">
        <note style="color:red;">
            <xsl:apply-templates/>
        </note>
    </xsl:template>
-->

</xsl:stylesheet>
