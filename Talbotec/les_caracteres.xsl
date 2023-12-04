<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="tei:TEI">
        <html>
            <head/> 
                <body> 
        <head> Les caractères de La Bruyère </head> 
          <xsl:apply-templates select="tei:text/tei:body"/> 
                </body> 
        </html> 
    </xsl:template> 
    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:div1/tei:head">
        <h2>
            <span class="title">
                <xsl:apply-templates/>
            </span>
        </h2>
    </xsl:template>
    <xsl:template match="tei:div2/tei:head">
        <h3>
            <span class="title">
                <xsl:apply-templates/>
            </span>
        </h3>
    </xsl:template>
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:note"> </xsl:template>
    <xsl:template match="tei:app/tei:lem">
        <span> <xsl:apply-templates/> </span>
    </xsl:template>
    <xsl:template match="tei:rdg"> </xsl:template>
</xsl:stylesheet>
