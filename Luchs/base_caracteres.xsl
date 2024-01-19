<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="tei:TEI">
        <html>
            <head>
                <title>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </title>
                <style type="text/css">
                    .hidden{
                        display:none;
                    }
                    h1{
                        text-align:center;
                        font-family:Bookman Old Style, Book Antiqua, Garamond;
                    }
                    h2{
                        text-align:center;
                        font-family:Bookman Old Style, Book Antiqua, Garamond;
                    }
                    <!-- Le texte en justifié est une question de préférence -->
                    p{
                        text-align:justify;
                        text-indent:20px;
                        font-family:Bookman Old Style, Book Antiqua, Garamond;
                        margin: 50px 250px 100px;
                    }</style>
            </head>
            <body>
                <h1>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </h1>
                <h2>
                    <xsl:apply-templates select="//tei:body/tei:div1/tei:div2/tei:head"/>
                </h2>
                <br/>
                <p class="n">Il y a <xsl:value-of select="count(//tei:app)"/> variantes dans ce
                    texte (en rouge).</p>
                <xsl:apply-templates select="//tei:div3"/>
            </body>

            <script type="text/javascript">
                var elems = document.getElementsByClassName("changer"); for (var i = elems.length - 1; i >= 0; i--) { elems[i].addEventListener('click', function handleClick(event) { for (var i = this.children.length - 1; i >= 0; i--) { if (this.children[i].classList.contains('hidden')) { this.children[i].classList.remove('hidden'); } else { this.children[i].classList.add('hidden'); } } }); }
            </script>

        </html>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader"/>
    
    <!-- Affichage du texte -->
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- Sélectionner les numéros canoniques de chaque paragraphe et les afficher -->
    <xsl:template match="tei:div3/tei:p[position()=1]">
        <p> (<xsl:value-of select="../@n"/>) <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- Affiche des notes (en violet) au clic, les segments annotés sont en vert -->
    <xsl:template match="tei:seg">
        <span class="changer" style="color:green">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:note">
        <span>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:seg//tei:note">
        <span class="hidden" style="color:orange">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- Affichage des variantes et changement au clic (seulement la première variante s'il y en a plusieurs mais dans mon cas il y en avait qu'une seule à chaque fois) -->
    <xsl:template match="tei:app">
        <span class="changer" style="color:red">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:lem">
        <span>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:app//tei:rdg[1]">
        <span class="hidden">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:app//tei:rdg[not(position()=1)]"/>

</xsl:stylesheet>
