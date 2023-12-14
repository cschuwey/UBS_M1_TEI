<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <style>
                    .hidden{
                        display:none;
                    }
                    div{
                        color:black;
                        margin:5px}
                    title{
                        color:black;
                        margin:8px}
                    h1{
                        color:rgb(255, 0, 0);
                        font-size:2em;
                        padding:10px;
                        text-align:center;
                        font-family: 'Franklin Gothic Medium', sans-serif;
                        margin:7px}
                    h2{
                        color:rgb(0, 70, 9);
                        font-size:1.5em;
                        padding:10px;
                        text-align:center;
                        font-family: 'Franklin Gothic Medium', sans-serif;
                        margin:6px}
                    p{
                        color:black;
                        margin:6px;
                        padding:4px;
                        text-align:justify;
                        text-indent:1em;
                        line-height:30px;
                        font-family: 'Franklin Gothic Medium', sans-serif;
                        font-size:1em;
                    }
                    span{
                        color:red;
                        font-size:1em;
                        text-align:justify
                    }</style>
                <title>
                    <xsl:apply-templates select="//tei:titleStmt//tei:title"/>
                </title>
            </head>
            <body>
                <xsl:apply-templates select="//tei:div1/tei:head"/>
                <xsl:apply-templates select="//tei:div2/tei:head"/> 
                <p>Nombre de variantes :
                    <xsl:value-of select="count(//tei:app)"/></p>
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
    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:div1/tei:head">
        <h1 class="title"> 
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    <xsl:template match="tei:div2/tei:head">
        <h2 class="title">
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    <xsl:template match="tei:div3">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:div3/tei:p [1]">
        <p> (<i><xsl:value-of select="../@n"/></i>) <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:div3/tei:p [position()>1]">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:note"> </xsl:template>
    <xsl:template match="tei:app">
        <span class="changer" style="color:red;">
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
