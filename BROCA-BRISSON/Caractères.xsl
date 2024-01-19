<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="tei:TEI">
        <html>
            <head>
                <title>
                    <xsl:value-of select="//tei:titleStmt//tei:title[@type='main']"/>
                    <xsl:value-of select="//tei:titleStmt//tei:title[@type='sub']"/>
                </title>
                <style type="text/css">
                    .hidden {
                    display: none;
                    }
                </style>
                <style type="text/css">
                    .title {
                    font-weight: bold;
                    text-align: center;
                    font-size: 1.5em;
                    }
                </style>
                <style type="text/css">
                    .nombre_variantes {
                    text-align: center;
                    }
                </style>
                <style type="text/css">
                    .changer {
                    color: red;
                    }
                </style>
            </head>
            <body>
                <p class="title"><xsl:value-of select="//tei:div1/tei:head"/></p>
                <p class="title"><xsl:value-of select="//tei:div2/tei:head"/></p>
                <p class="nombre_variantes">Nombre de variantes : <xsl:value-of select="count(//tei:rdg)"/></p>
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
    
    <xsl:template match="tei:div1/tei:head"/>
        
    <xsl:template match="tei:div2/tei:head"/>
    
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:div3/tei:p[position()=1]">
        <p>
            (<xsl:value-of select="../@n"/>)
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:app">
        <seg class="changer">
            <seg><xsl:value-of select="tei:lem"/></seg>
            <seg class="hidden"><xsl:value-of select="tei:rdg[position()=1]"/></seg>
        </seg>
    </xsl:template>
    
</xsl:stylesheet>


