<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <!-- marche parce que dans ce cas précis que du texte à traiter : <xsl:value-of select="//tei:titleStmt/tei:title"/> -->
                    <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    <!-- avec select le contexte a son importance, on part de l'enfant du template-->
                </title>
                <style type="text/css">
                    .hidden{
                        display:none;
                    }</style>
            </head>
            <body>
                <p>Nombre de variantes : <xsl:value-of select="count(//tei:app)"/></p>
                <h1>Les Caractères de La Bruyère</h1>
                <xsl:apply-templates select="//tei:div3"/>

            </body>
            <script type="text/javascript">
                
                var elems = document.getElementsByClassName("changer");
                for (var i = elems.length - 1; i >= 0; i--) {
                elems[i].addEventListener('click', function handleClick(event) {
                for (var i = this.children.length - 1; i >= 0; i--) {
                if (this.children[i].classList.contains('hidden')) {
                this.children[i].classList.remove('hidden');
                }
                else {
                this.children[i].classList.add('hidden');
                }
                }
                
                });
                }
                
            </script>
        </html>
    </xsl:template>

    <xsl:template match="tei:div3/tei:p[position()=1]">
        <p>(<xsl:value-of select="../@n"/>)<xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:div3/tei:p[position()>1]">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:note"/>

    <xsl:template match="tei:app">
        <span class="changer">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:lem">
        <span>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:rdg">
        <span class="hidden">
            <xsl:apply-templates/>
        </span>
    </xsl:template>



</xsl:stylesheet>
