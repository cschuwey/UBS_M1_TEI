<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> </meta>
                
                <style type="text/css">
                    .hidden {
                    display: none;
                    }
                </style>
                <title>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </title>
            </head>
            <body>
                <h1>"Les Caractères de La Bruyère"</h1>
                <p>Nombre de variantes : <xsl:value-of select="count(//tei:app)"/></p>
                <xsl:apply-templates select="//tei:div3"/>
                <span class="changer"><span>lem</span><span class="hidden">rdg</span></span>
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
    
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader"/>
    
    <xsl:template match="tei:note"/>
    
    <xsl:template match="tei:div3/tei:p[1]">
        <p>
            (<xsl:value-of select="../@n"/>)
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <span class="changer" style="color:red;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:app/tei:rdg[position()>1]">
        
        <span>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:app//tei:rdg[2]">
        <span class="hidden">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>
