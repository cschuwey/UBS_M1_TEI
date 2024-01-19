<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="tei:TEI">

        <html>
            <head>
                
                <style type="text/css">
                   
                   div1 {
                   font-family: 'Palatino', serif;
                   line-height: 1.6;
                   margin: 20px;
                   font-size: 30px;
                   text-align: center;
                   color: green;
                   }
                   
                   div2 {
                   font-family: 'Baskerville', serif;
                   line-height: 1.6;
                   margin: 20px;
                   font-size: 27px;
                   text-align: center;
                   font-weight: bold;
                   color: purple;
                   }
                   
                   div3 {
                   font-family: 'Didot', serif;
                   line-height: 1.6;
                   margin: 50px;
                   font-size: 18px;
                   text-transform: uppercase;
                   text-decoration: underline;
                   }
                   
                   body {
                   font-family: 'Didot', serif; 
                   line-height: 1.6;
                   margin: 50px;
                   font-size: 16px;
                   text-align: justify;
                   }
                   
                    .hidden{
                        display:none;
                    }
                    .changer {
                    color: blue;
                    cursor: pointer;
                    text-decoration: underline;
                    }
                </style>
                
                <title>
                    <xsl:apply-templates select="tei:teiHeader/tei:FileDesc/tei:titleStmt/tei:title[@type='main']"/>
                </title>
                
                
            </head>

            <body>
                <div1>
                    <p>
                <xsl:value-of select="//tei:titleStmt/tei:title[@type='main']"/>
                    </p>
                </div1>
                
                <div2>
                    <p>
                    <xsl:value-of select="//tei:div2/tei:head"/>
                    </p>
                </div2>
                
                
                <div3>
                <p>
                    Nombre de variantes : 
                    <xsl:value-of select="count(//tei:app)"/>
                </p>
                </div3>
            
                <xsl:apply-templates select="//tei:div3"/>
            </body>

            <script type="text/javascript"> 
                var elems = document.getElementsByClassName("changer"); 
                for (var i = elems.length - 1; i >= 0; i--)
                { elems[i].addEventListener('click', function handleClick(event) 
                { for (var i = this.children.length - 1; i >= 0; i--) 
                { if (this.children[i].classList.contains('hidden')) 
                { this.children[i].classList.remove('hidden');
                } else { this.children[i].classList.add('hidden');
                } } });
                } 
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

    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:note"/>

    <xsl:template match="tei:app/tei:lem">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:app//tei:rdg">
        <span class="hidden">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:app">
        <span class="changer" style="color:blue;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


</xsl:stylesheet>
