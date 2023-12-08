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
                        color:red;
                    }
                .changer{
                color:red;
                }
                </style>
                <title>
                    <xsl:value-of select="//tei:title"/>
                </title>
            </head>
            <body> Nombre de variantes : <xsl:value-of select="count(//tei:rdg)"/>
                <p><xsl:apply-templates/></p>
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
<p><xsl:value-of select="../@n"/> 
    <xsl:apply-templates/> </p>
    </xsl:template>

    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:lem">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!--Comme les lem sont forcément dans les app, je ne sais pas si c'est vraiment nécessaire de préciser les app, je ne sais pas quoi ajouter comme balise, si on doit mettre <p> comme les lem ne sont pas dans un langage html...-->
    <xsl:template match="tei:note"/>
    <xsl:template match="tei:rdg"/>

    <xsl:template match="tei:app"> 
        <span class="changer"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:lem">
        <span><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:rdg">
        <span class="hidden">
            <xsl:apply-templates/></span>
    </xsl:template>

</xsl:stylesheet>
