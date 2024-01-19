<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="tei:TEI">
        <html>
            <head>
                <xsl:template match="tei:teiHeader"/>
                <title>
                    <xsl:apply-templates
                        select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='main']"/>
                </title>
                <style type="text/css">
                    .hidden{
                        display:none;
                    }
                </style>
            </head>
            
            <body>
               <h1><xsl:apply-templates select="//tei:titleStmt/tei:title"/></h1>
                <h2><xsl:apply-templates select="//tei:div1/tei:head"/></h2>
                <h3><xsl:apply-templates select="//tei:body/tei:div1/tei:div2/tei:head"/></h3>
                <br/>
                <p class="n">Nombre de variantes : <xsl:value-of select="count(//tei:app)"/></p>
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
    
    <!--
    
    <xsl:template match="tei:div3/tei:p[position()=1]">
        <p> (<xsl:value-of select="../@n"/>) <xsl:apply-templates/>
        </p>
-->

    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:note"/>
    
    <!-- Selon moi, pour seulement afficher les lem, il suffit de dire de ne pas afficher les rdg (dans le cadre de mon document de travail -->
    
    <xsl:template match="tei:rdg"/>
    
   <!-- Test pour colorer les notes différemment

    <xsl:template match="tei:note[@type='cle']">
        <note style="color:purple;">
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    
    <xsl:template match="tei:note">
        <note style="color:red;">
            <xsl:apply-templates/>
        </note>
    </xsl:template>
-->

    </xsl:stylesheet>
    <xsl:template match="tei:app//tei:rdg[1]">
        <span class="hidden">
            <xsl:apply-templates/>
        </span>
    </xsl:stylesheet>
    <xsl:template match="tei:app//tei:rdg[not(position()=1)]"/>
    
</xsl:stylesheet>
