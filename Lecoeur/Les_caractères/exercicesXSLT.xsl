<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <!-- <xsl:strip-space elements="*"/> -->

    <xsl:template match="tei:TEI">
        <html lang="fr">
            <head>
                <meta charset="utf-8"/>
                <title>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </title>
            </head>

            <body>
                <h1>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </h1>
                <p>
                    <xsl:apply-templates select="//tei:persName"/>
                </p>

                <div>
                    <xsl:apply-templates select="//tei:div[@type='remark']"/>
                </div>

                <h2>Bibliographie</h2>
                <xsl:apply-templates select="//tei:bibl[@xml:id='ed3-88']"/>
                <br/>
                <xsl:apply-templates select="//tei:bibl[@xml:id='ed5-90']"/>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:persName">
        <span class="personne">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:div[@type='remark']">
        <p>
            <xsl:apply-templates select="tei:p"/>
        </p>
        Test : <xsl:value-of select="//tei:item[@xml:id=preceding-sibling::tei:head/@corresp]/@n"/>
    </xsl:template>
    
    <xsl:template match="tei:app">(<xsl:apply-templates select="tei:rdg[@corresp='#ed3-88']"/>/<xsl:apply-templates select="tei:rdg[@corresp='#ed5-90']"/>)</xsl:template>

    <xsl:template match="tei:bibl">
        <pre> Titre : <xsl:apply-templates select="tei:title"/><br/>
            écrit par : <xsl:apply-templates select="tei:author"/><br/>
            <xsl:apply-templates select="tei:edition"/>, publié en <xsl:apply-templates select="tei:date"/> par <xsl:apply-templates select="tei:publisher"/> à <xsl:apply-templates select="tei:pubPlace"/><br/>
            Cote de l'exemplaire : <xsl:apply-templates select="tei:idno"/>
        </pre>
    </xsl:template>

    <xsl:template match="tei:author">
        <xsl:apply-templates select="tei:forename"/>_<xsl:apply-templates select="tei:nameLink"
            />_<xsl:apply-templates select="tei:surname"/>
    </xsl:template>
</xsl:stylesheet>
