<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="Votre texte de paragraphe"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
<xsl:template match="//TEI:title">
<head><apply-templates select="//tei:title"[@corresp='#ed07']/></head>
<body><apply-templates select="tei:title"[@corresp='#ed07']/></body>
</xsl:template>
<xsl:template match="//TEI:tei">
    <span class="personne"><apply templates="//tei:persName"/></span>
</xsl:template>
<xsl:template match="//TEI:p">
<p><apply-templates select="//tei:p"/></p>
<div><apply-templates select ="//tei:p/tei:div3[type='remark']"/></div>
<div><apply-templates select="//tei:p/tei:div3[correspo='remark']"/></div>
</xsl:template>

<xsl:template march="TEI:tei">
<app>
<apply-template select="//tei:p/tei:app/tei:rdg[1]"/>/
<apply-templates select="//tei:p/tei:app/tei:rdg[2]"/>
</app>
</xsl:template>
<xsl:template match="TEI:sourceDesc/tei:bibl">
<h2>Bibliographie</h2>
<apply-templates select="//tei:author"/>
<apply-templates select="//tei:title"/>
<apply-templates select="//tei:publisher"/>
</xsl:template>
</xsl:stylesheet>
