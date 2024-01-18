<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <!-- Style CSS -->
                <style type="text/css">
                    .hidden{
                        display:none;
                    }
                    .head{
                        display:flex;
                        justify-content:center;
                        align-items:center;
                        color:rgb(48, 84, 150);
                        font-size:18px;
                        height:36px;
                        background:FloralWhite;
                        font-weight:bold;
                    }
                    .head1{
                        display:flex;
                        justify-content:center;
                        align-items:center;
                        font-weight:lighter;
                        font-size:12px;
                        height:24px;
                        background:FloralWhite;
                    }
                    .responsive{
                        display:block;
                        text-align:justify;
                        font-size:14px;
                        text-indent:3em;
                        background:white;
                        transition:background-color 2s, 
                    color 2s;
                    }
                    .responsive:hover{
                        color:rgb(48, 84, 150);
                        display:block;
                        text-align:justify;
                        text-indent:3em;
                        font-size:14px;
                        background:rgb(240, 255, 255);
                    }</style>

                <!-- Titre page -->
                <title>
                    <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"
                    />
                </title>

                <!-- En-tête-->
                <span class="head">
                    <br>
                        <i>
                            <xsl:apply-templates
                                select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                        </i>
                    </br>
                </span>
                <span class="head1">
                    <i>Par <xsl:apply-templates
                            select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/>, encodés
                        par <xsl:apply-templates
                            select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher"
                        /></i>
                </span>
                <!-- Numéros et titres de partie et chapitre -->
                <span class="head"> Partie <xsl:apply-templates
                        select="/tei:TEI/tei:text/tei:body/tei:div1/@n"/> : <i><xsl:apply-templates
                            select="//tei:div1/tei:head"/></i></span>
                <span class="head"> Chapitre <xsl:apply-templates
                        select="/tei:TEI/tei:text/tei:body/tei:div1/tei:div2/@n"/> :
                        "<xsl:apply-templates select="//tei:div2/tei:head"/>" </span>
            </head>

            <!-- Corps de texte -->
            <body>

                <span class="head1">
                    <i>Nombre de variantes encodées : <xsl:value-of select="count(//tei:app)"/></i>
                </span>
                <xsl:apply-templates select="//tei:div3"/>
            </body>

            <!-- Script Javascript pour le changement de lem/rdg -->
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
                }</script>
        </html>
    </xsl:template>

    <!-- Éléments contenus -->
    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:div3/tei:p[position() = 1]">
        <p>
            <span style="color:rgb(48, 84, 150);">
                <b><xsl:value-of select="../@n"/>.</b>
            </span>
            <span class="responsive">
                <xsl:apply-templates/>
            </span>
        </p>
    </xsl:template>
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:div3/tei:p[position() > 1]">
        <p>
            <span class="responsive">
                <xsl:apply-templates/>
            </span>
        </p>
    </xsl:template>
    <!--Élément app et ses enfants-->
    <xsl:template match="tei:app">
        <span class="changer" style="color: maroon;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:note"/>

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
</xsl:stylesheet>
