<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="tei:TEI">
        <html>
            <head>
                <title>
                    <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"
                    />
                </title>
            </head>
            <body>
                <p>Nombre de variantes : <xsl:value-of select="count(//tei:app)"/></p>
                <h1>Les Caractères de La Bruyère</h1>
                <apply-templates/>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:p">
        <p>
            <apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:div3/tei:p[position()=1]">
        <p> (<xsl:value-of select="../@n"/>)<apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:div3/tei:p[position()>1]">
        <p>
            <apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:note"/>

    <xsl:template match="tei:app">

        <span class="changer">
            <span>lem</span>
            <span class="hidden">rdg</span>
        </span>

    </xsl:template>



</xsl:stylesheet>
