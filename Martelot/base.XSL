<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
   
   
<xsl:template match="tei:TEI">
    <html>
        <head>
            <!--<title><xsl:value-of select="//tei:fileDesc/tei:titleStmt"/></title> marche pas parce que c'est du texte à traiter -->
            <title><xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='main']"/></title>
            <style type="text/css">
                .hidden {
                display: none;
                }
            </style>
        </head>
        <body>
            <h1>Les Caractères de La Bruyère</h1>
            <p>nombre de variante <xsl:value-of select ="count(//tei:app)"></xsl:value-of></p>
            <xsl:apply-templates></xsl:apply-templates>
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
        <p><xsl:apply-templates></xsl:apply-templates></p>
        
    </xsl:template>
    
    <xsl:template match="tei:head"> 
        <h1><xsl:apply-templates></xsl:apply-templates></h1>
        
    </xsl:template>
    
    <xsl:template match="tei:app"> 
        <span class="changer"><xsl:apply-templates></xsl:apply-templates></span>
        
        
    </xsl:template>
    
    <xsl:template match="tei:lem"> 
        <span><xsl:apply-templates></xsl:apply-templates></span>
        
    </xsl:template>
    
    <xsl:template match="tei:rdg"> 
        <span class="hidden"><xsl:apply-templates></xsl:apply-templates></span>
        
    </xsl:template>
    
    <xsl:template match="tei:div3/tei:p[position()=1]"> 
        <p>(<xsl:value-of select="../@n"/>)<xsl:apply-templates></xsl:apply-templates></p>
        
    </xsl:template>
    
    <xsl:template match="tei:note"/> 
    
    <xsl:template match="tei:teiheader"/> 
     
    <xsl:template match="tei:body//tei:p/tei:app/tei:lem"> 
        <span style="color:red"><xsl:apply-templates></xsl:apply-templates></span>
        
    </xsl:template>
    
</xsl:stylesheet>
