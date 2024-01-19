<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="tei:TEI">
        <html>
            <head>
                <style type="text/css">
                    html{
                        background-color:
                        }
                    body{
                        font-family:"Courier New", Courier, monospace;
                        line-height:1.5;
                        color:black;
                        margin: 1em;
                        padding:auto;
                        font-size:14px;
                    }
                    h1{                        
                        font-style:bold;
                        font-family:Times, serif;
                        text-decoration:underline;
                        color:black;
                    }
                    h2{
                        text-align:center;
                        font-style:oblique;
                        font-family:"Courier New", Courier, monospace;
                    }
                    .variant{
                        color:red;
                        cursor:pointer;
                    }
                    .hidden{
                        display:none;
                    }</style>

                <title>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </title>

            </head>
            <script type="text/javascript">
                var elems = document.getElementsByClassName("changer"); for (var i = elems.length - 1; i >= 0; i--) { elems[i].addEventListener('click', function handleClick(event) { for (var i = this.children.length - 1; i >= 0; i--) { if (this.children[i].classList.contains('hidden')) { this.children[i].classList.remove('hidden'); } else { this.children[i].classList.add('hidden'); } } }); }
            </script>
            <body>
                <h1>
                    <xsl:apply-templates select="//tei:div1/tei:head"/>
                </h1>

                <h2>
                    <xsl:apply-templates select="//tei:div2/tei:head"/>
                </h2>

                <p class="nb-var">Nombre de variantes : <xsl:value-of select="count(//tei:app)"/>
                    <xsl:apply-templates select="//tei:div3"/></p>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:note"/>

    <xsl:template match="tei:div3/tei:p[position()=1]">
        <p>(<xsl:value-of select="../@n"/>) <xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="tei:app">
        <span class="changer" style="color:red;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:app//tei:rdg[1]">
        <span class="hidden">
            <xsl:apply-templates/>
        </span>
        <span class="variant">
            <xsl:apply-templates select="tei:rdg"/>
        </span>
    </xsl:template>
    <!-- Tentative de faire changer les variantes à l'aide du curseur, mais je n'ai pas réussi à le coder --> 

</xsl:stylesheet>
