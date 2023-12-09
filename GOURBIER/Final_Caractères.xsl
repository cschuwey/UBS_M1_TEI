<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="//tei:titleStmt//tei:title"/>
                </title>
                <style type="text/css">
                    .hidden {
                        display: none
                    }</style>
            </head>
            <body> Nombre de Variantes : <xsl:value-of select="count(//tei:rdg)"/>
                <xsl:apply-templates/>
            </body>
            <script type="text/javascript">
                var elems = document.getElementsByClassName("changer");
                for (var i = elems.length - 1; i >= 0; i--) {
                elems[i].addEventListener('click', function handleClick(event) {
                for (var i = this.children.length - 1; i >= 0; i--) {
                if (this.children[i].classList.contains('hidden')) {
                this.children[i].classList.remove('hidden');
                } else {
                this.children[i].classList.add('hidden');
                }
                }
                });
                }
            </script>
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
    <xsl:template match="tei:div3/tei:p[position() = 1]">
        <p> (<xsl:value-of select="../@n"/>) <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:seg[@type='clé']">
        <seg class="changer">
            <seg><xsl:value-of select="tei:note[@type='origine']"/></seg>
            <seg class="hidden"><xsl:value-of select="tei:note[@type='clé']"/></seg>
        </seg>
    </xsl:template>
</xsl:stylesheet>
