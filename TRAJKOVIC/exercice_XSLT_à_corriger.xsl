<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <title>
                    <xsl:apply-templates select="//tei:teiHeader//tei:titleStmt/tei:title"/>
                </title>
            </head>
            <body>
                <h1>
                    <xsl:apply-templates select="//tei:teiHeader//tei:titleStmt/tei:title"/>
                </h1>
                <p>
                    <xsl:apply-templates select="//tei:fileDesc//tei:author"/>
                    <!-- n'ayant pas de persName dans mon document, je l'ai remplacé par le tei:author. -->
                </p>
                
                <xsl:apply-templates select="//tei:body//tei:div3[@type='remark']"/>
                
                <h2>Bibliographie</h2>
                <xsl:apply-templates select="//tei:sourceDesc//tei:bibl"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:fileDesc">
        <span class="Personne"><xsl:apply-templates select="//tei:author"/></span>
    </xsl:template>
    
    <xsl:template match="tei:div3[@type='remark']">
        <div><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <!-- étant donné que certaines de mes variantes ne sont que des espaces, j'ai préféré discerner les deux variantes par une couleur: rouge pour l'édition 3 et verte pour l'édition 5-->
        <span style="color:red"><xsl:apply-templates select="tei:rdg[@corresp='#ed3']"/></span>
        /
        <span style="color:green"><xsl:apply-templates select="tei:rdg[@corresp='#ed5']"/></span>
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        <p>
            <xsl:apply-templates select="//tei:title"/><xsl:apply-templates select="@xml:id"/> par <xsl:apply-templates select="//tei:author"/>, publié par <xsl:apply-templates select="//tei:publisher"/>.
            Cote : <xsl:apply-templates select="//tei:idno"/>
        </p>
    </xsl:template>
    
</xsl:stylesheet>
