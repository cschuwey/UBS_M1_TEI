<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <style type="text/css">
                    .hidden{
                        display:none;
                    }</style>
                <title>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </title>
            </head>
            <body>
                <h1
                    style="color:rgb(54, 95, 141);font-family: Georgia; font-size: 25px;text-align: center; text-decoration: underline; font-weight: 800;line-height : 2">
                    <xsl:apply-templates select="//tei:div1/tei:head"/>
                </h1>
                <h2
                    style="color:rgb(54, 95, 141);font-family: Georgia; font-size: 23px;text-align: center;line-height : 2">
                    <xsl:apply-templates select="//tei:div2//tei:head"/>
                </h2>
                <h3
                    style="font-family: Times new roman; font-size: 20px; font-style: italic;  color:rgb(240, 138, 6);text-align: center;line-height : 2"
                    >Nombre de variantes: <xsl:value-of select="count(//tei:app)"/></h3>
                <h4
                    style="font-family: Times new roman; font-size: 14px; font-style: normal; color: #242424; text-align: justify;font-weight: 200;margin: 20px;Width: 800px;position: relative;margin-left: auto;margin-right: auto; line-height : 2">
                    <xsl:apply-templates select="//tei:div3"/>
                </h4>
            </body>

            <script type="text/javascript"> var elems = document.getElementsByClassName("changer"); for (var i = elems.length - 1; i >= 0; i--) { elems[i].addEventListener('click', function handleClick(event) { for (var i = this.children.length - 1; i >= 0; i--) { if (this.children[i].classList.contains('hidden')) { this.children[i].classList.remove('hidden'); } else { this.children[i].classList.add('hidden'); } } }); } </script>
        </html>
    </xsl:template>
    <xsl:template match="tei:note"/>
    <xsl:template match="tei:div3">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:div3/tei:p[1]">
        <p> ( <xsl:value-of select="../@n"/> ) <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:div3/tei:p[position()>1]">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:app">
        <span class="changer" style="color:rgb(240, 138, 6);">
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
