<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
    </xsl:template>
    <xsl:template match="tei:head">
        <h1>
            <span style="color:red"><xsl:apply-templates select="tei:head"/></span>
        </h1>
    </xsl:template>
    
    <xsl:templates match="tei:p[@type='remark']"
        <xsl:apply-templates select="tei:p[@type='remark']">
        </xsl:apply-templates>
</xsl:stylesheet>
<!-- Je ne comprends pas l'erreur de la commande apply de remark, elle me semble identique à celle de head --!>
