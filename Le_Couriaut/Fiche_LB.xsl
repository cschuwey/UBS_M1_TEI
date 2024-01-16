<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

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
                    body {
                    margin-left: 10%;
                    margin-right: 10%;
                    font-size: 16px;
                    background-color: rgb(236, 229, 219);
                    }
                </style>

            </head>
            <body>
                <xsl:apply-templates/>
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
        <h1 style="text-align:center">
            <xsl:apply-templates/>
        </h1>
        <p style="text-align:center"> Nombre de variantes: <xsl:value-of select="count(//tei:app)"/></p>
    </xsl:template>
    
    <xsl:template match="tei:div2/tei:head">
        <h2 style="color:rgb(116, 31, 31)">
            <xsl:apply-templates></xsl:apply-templates>
        </h2>
        
    </xsl:template>

    <xsl:template match="tei:div3/tei:p[position()=1]">
        <p style="text-align:justify">
            <xsl:value-of select="../@n"/>. <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:div3/tei:p[position()>1]">
        <p style="text-align:justify;  position: relative;
            text-display: flex;
            margin: 10%;">
           
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:note"/>

    <xsl:template match="tei:app">
        <span style="color:red">
            <span class="changer">
                <xsl:apply-templates/>
            </span>
        </span>
    </xsl:template>

    <xsl:template match="tei:lem">
        <span>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:rdg[position()=1]">
        <span class="hidden">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:rdg[position()>1]"/>
</xsl:stylesheet>
