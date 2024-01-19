<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="tei:TEI">
        <html>
            <head>
                <h1>
                    <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </h1>
                <h2>
                    <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/>
                </h2>

            </head>

            <body>
                <style type="text/css">
                    .hidden {
                        display: none;
                    }
                    h1 {
                        font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
                        font-size: 20px;
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
                        font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
                        font-size: 20px;
                        letter-spacing: 2px;
                        word-spacing: 2px;
                        color: #000000;
                        font-weight: 400;
                        text-decoration: none;
                        font-style: normal;
                        font-variant: small-caps;
                        text-transform: none;
                        display: flex;
                        justify-content: center;
                    }
                    
                    body {
                        font-family: "Times New Roman", Times, serif;
                        font-size: 14px;
                        letter-spacing: 2px;
                        word-spacing: 2px;
                        color: #000000;
                        font-weight: normal;
                        text-decoration: none;
                        font-style: normal;
                        font-variant: normal;
                        text-transform: none;
                    }
                    
                    h3 {
                        font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
                        font-size: 18px;
                        letter-spacing: 2px;
                        word-spacing: 2px;
                        color: #000000;
                        font-weight: 700;
                        text-decoration: none;
                        font-style: normal;
                        font-variant: normal;
                        text-transform: none;
                    
                    }
                    html {
                        background-color: rgba(145, 96, 130, 0.44);
                    
                    }</style>

                <xsl:apply-templates/>



                <p> Nombre de variantes : <xsl:value-of select="count(//tei:app)"/>
                </p>
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
    <xsl:template match="//tei:div1/tei:head"/>
    <xsl:template match="tei:div3/tei:p[1]">
        <p>(<xsl:value-of select="../@n"/>)<xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="//tei:div2/tei:head">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:note"/>
    <xsl:template match="tei:app">
        <span class="changer" style="color: red">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:lem">
        <span>

            <xsl:apply-templates/>

        </span>
    </xsl:template>

    <xsl:template match="tei:app//tei:rdg[1]">
        <span class="hidden" style="color: #2C2A91;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:app//tei:rdg[position() > 1]">
        <span class="hidden" style="color: #147000">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:app//tei:rdg[not(position() ! 1)]"/>

</xsl:stylesheet>
