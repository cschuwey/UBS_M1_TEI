<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:xs="http://www.w3.org/2001/XMLSchema" 
        xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
        <xsl:output method="xml" encoding="UTF-8"/>
        
   
        <xsl:strip-space elements="*"/>
        <xsl:template match="/">
            <html>
                <head> 
                    <title>
                        <xsl:value-of select="//tei:titleStmt/tei:title[@type='main']"/>
                        <xsl:value-of select="//tei:titleStmt//tei:title[@type='sub']"/>
                    </title>
                    <style type="text/css"> body {
                        font-family: 'Arial', serif;
                        line-height: 1.5;
                        color: #333;
                        margin: auto;
                        padding: auto;
                        font-size: 16px;
                        } 
                        title {
                        font-family: 'Arial', serif;
                        line-height: 1.5;
                        color: #333;
                        margin: auto;
                        padding: auto;
                        font-size: 25px;
                        } 
                        .title {
                        font-size: 2em;
                        color: #333;
                        }
                        .variant {
                        color: red;
                        cursor: pointer;
                        }
                        .hidden {
                        display: none;
                        } </style>
                   
                    <script type="text/javascript"> 
                    var elems = document.getElementsByClassName("changer"); 
                    for (var i = elems.length - 1; i >= 0; i--) { elems[i].addEventListener('click', function handleClick(event) 
                    { for (var i = this.children.length - 1; i >= 0; i--) { if (this.children[i].classList.contains('hidden')) { this.children[i].classList.remove('hidden'); } 
                    else { this.children[i].classList.add('hidden'); } } }); }
                    </script>
                </head>
                <body>
                    <div class="title">   <xsl:value-of select="//tei:titleStmt/tei:title[@type='main']"/> </div>
                        <div class="title">  <xsl:value-of select="//tei:titleStmt/tei:title[@type='sub']"/> </div>
                   <p><xsl:value-of select="//tei:div2/tei:head"/></p>
                   <p>Nombre de variantes</p>    
                    <xsl:value-of select="count(//tei:app)"/> <xsl:apply-templates select="//tei:div3"/>
                   
                </body>
                
            </html>
        </xsl:template>
    <xsl:template match="tei:p"> <p> <xsl:apply-templates/> </p> </xsl:template>
    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:notes"/>
    
    <xsl:template match="tei:app"> 
        <span class="variant"><xsl:apply-templates select="tei:lem"/></span> 
        <span class="hidden"><xsl:apply-templates select="tei:rdg"/></span>
    </xsl:template>
    
    <xsl:template match="tei:div3/tei:p[1]"><p>(<xsl:value-of select="../@n"/>)<xsl:apply-templates/></p></xsl:template>
    
    
</xsl:stylesheet>
