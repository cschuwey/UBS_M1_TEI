<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:strip-space elements="*"/>

    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>
                    <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    <xsl:apply-templates/>
                </title>

                <h1>
                    <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </h1>
                <h2>
                    <author>
                        <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"
                        />
                    </author>
                </h2>


            </head>

            <body>
                <style type="text/css">
                    html {
                        border: 20px solid #DFE3CF;
                    }
                    
                    .hidden {
                        display: none;
                    
                    }
                    h1 {
                        font-family: Tahoma, Geneva, sans-serif;
                        font-size: 23px;
                        letter-spacing: 2px;
                        word-spacing: 2px;
                        color: #000000;
                        font-weight: 700;
                        text-decoration: none;
                        font-style: normal;
                        font-variant: small-caps;
                        text-transform: none;
                        display: flex;
                        justify-content: center;
                    }
                    h2 {
                        font-family: Tahoma, Geneva, sans-serif;
                        font-size: 14px;
                        letter-spacing: 2px;
                        word-spacing: 2px;
                        color: #000000;
                        font-weight: normal;
                        text-decoration: none;
                        font-style: normal;
                        font-variant: normal;
                        text-transform: none;
                        display: flex;
                        justify-content: center;
                    }
                    
                    body {
                        font-family: Tahoma, Geneva, sans-serif;
                        font-size: 14px;
                        letter-spacing: 2px;
                        word-spacing: 2px;
                        color: #000000;
                        font-weight: normal;
                        text-decoration: none;
                        font-style: normal;
                        font-variant: normal;
                        text-transform: none;
                        background-color: #DFE3CF;
                    }</style>



                <xsl:apply-templates/>
                <br/>
                <p> Nombre de variantes visibles en rouge dans le texte : <xsl:value-of
                        select="count(//tei:rdg[1])"/></p>
                <!-- Etant donné que les deux variantes sont à chaque fois identiques, j'ai décidé de ne pas compter les deuxièmes rdg n'étant pas vraiment des variantes -->
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
                }</script>

        </html>
    </xsl:template>

    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="//tei:div1/tei:head">
        <b><xsl:apply-templates/></b>
    </xsl:template>

    <xsl:template match="//tei:div2/tei:head">

        <h3> Chapitre <xsl:value-of select="//tei:div2/@n"/>: <xsl:apply-templates/>
        </h3>

    </xsl:template>

    <xsl:template match="tei:div3">
        <p> (<xsl:value-of select="@n"/>) <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:note"/>


    <xsl:template match="tei:app">
        <span class="changer" style="color: #AB0202;">

            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:lem">
        <span>
            <b>
                <xsl:apply-templates/>
            </b>
        </span>
    </xsl:template>

    <xsl:template match="tei:app//tei:rdg[1]">
        <span class="hidden">

            <b>
                <xsl:apply-templates/>
            </b>
        </span>
    </xsl:template>

    <xsl:template match="tei:app//tei:rdg[not(position() = 1)]"/>
    <!-- Etant donné que les deux variantes sont à chaque fois identiques, j'ai décidé de ne pas faire afficher la deuxième variantes car non-pertinent, selon moi -->

</xsl:stylesheet>
