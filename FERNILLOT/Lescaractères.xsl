<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
        
        <html>
            
            <head>
                <title>
                    <xsl:apply-templates select="//tei:header/tei:fileDesc/tei:titleStmt/tei:title[@type='main']"/>
                </title>
                
                <style type="text/css">
                    body {
                    font-family: 'Century Schoolbook', sans-serif;
                    line-height: 1.6;
                    margin: 20px;
                    }
                    p {
                    margin-bottom: 1.2em;
                    }
                    .hidden {
                    display: none;
                    }
                    .changer {
                    color: red;
                    cursor: pointer;
                    text-decoration: underline;
                    }
                </style>

            </head>
            
            <body>
                <xsl:value-of select="//tei:titleStmt/tei:title[@type='main']"/>
                <p><xsl:value-of select="//tei:div2/tei:head"/></p>
                <p>Nombre de variantes : <xsl:value-of select="count(//tei:lem)"/></p>
                <xsl:apply-templates select="//tei:div3"/>
            </body>
            
            <script type="text/javascript"> var elems = document.getElementsByClassName("changer"); 
                for(var i = elems.length - 1; i>= 0; i--) { elems[i].addEventListener('click', function handleClick(event) 
                { for (var i = this.children.length - 1; i >= 0; i--) { if (this.children[i].classList.contains('hidden')) 
                { this.children[i].classList.remove('hidden'); } else { this.children[i].classList.add('hidden'); } } }); } 
            </script>
        </html>
        
    </xsl:template>
    
    <xsl:template match="tei:div3">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:div3/tei:p[1]">
        <p> ( <xsl:value-of select="../@n"/> ) <xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:div3/tei:p[position()>1]">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
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
    
    <xsl:template match="tei:app//tei:rdg[1]">
        <span class="hidden">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="//tei:note"/>
    
    <xsl:template match="tei:app//tei:rdg[not(position()=1)]"/>
    
    
    
</xsl:stylesheet>
