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
                    <xsl:value-of select="//tei:title"/>
                </title>
            </head>
            <body>
                <h1><xsl:value-of select="//tei:title"></xsl:value-of></h1>
                <p>nombre de variantes : <xsl:value-of select="count(//tei:rdg)"/></p>
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

 
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>


    <xsl:template match="tei:app">
        <span class="changer" style="color: red">
            <span>
                <xsl:value-of select="tei:lem"/>
            </span>
            <span class="hidden">
                <xsl:value-of select="//tei:rdg[position()=1]"/>
            </span>
        </span>
    </xsl:template>



    <xsl:template match="tei:div3/tei:p[position()=1]">
        <p>(<xsl:value-of select="../@n"/>) <xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="tei:div3/tei:p[position()>1]">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>




    <xsl:template match="tei:app/lem">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:rdg"/>
    <xsl:template match="tei:note"/>

</xsl:stylesheet>
