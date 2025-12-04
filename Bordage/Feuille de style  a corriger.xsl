<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
        <html>
            <head>
                
                <title><xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"></xsl:apply-templates></title>
                <meta charset="UTF-8"/>
               
            </head>
  
            <body>
                <img scr="Les%20caract%C3%A8res.png" alt=""></img>
                <h1><xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"></xsl:apply-templates></h1>
               
                <p><xsl:apply-templates select="//tei:persName"/>=le persoName</p> <!-- je sais pas comment faire sachant que j'ai pas de persName dans mon docuement ? -->
                
              
                <!-- J'ai beaucoup de mal à comprendre comment je peux faire la transformation de mon ficher sans modifier mon docuement TEI. J'ai deux hypothèse :
                la première c'est que mon docuement en tant que tel est peut-être pas optimal dans son encodage qui fait je suis en difficulté 
                la seconde, c'est que c'est possible qque je n'ai as besoin de modifier mon docuement, et que je m'étrise pas encore très bien le xsl.
                dans les deux cas, j'aurai fait de mon mieux -->
               
                <div><p></p><xsl:apply-templates select="//tei:body//tei:div5[@type='remark']/tei:p"></xsl:apply-templates></div>
                
                
                
                <!-- bibliographie -->
                
                <h2>Bibliographie :</h2>
                <p><xsl:apply-templates select="//tei:sourceDesc/tei:bibl[@xml:id='ed3_1688']"></xsl:apply-templates></p>
                <p><xsl:apply-templates select="//tei:sourceDesc/tei:bibl[@xml:id='ed6_1691']"></xsl:apply-templates></p>
                
                Nombre de remark dans le ficher : <xsl:value-of select="count(//tei:div5[@type='remark'])"/> 
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:div5[@type='remark']/tei:p">
        <p><xsl:apply-templates></xsl:apply-templates></p>
    </xsl:template>
    
    <xsl:template match="tei:div5[@type='remark']/tei:p/tei:app/tei:rdg">
        <p><span style="color:red"><xsl:apply-templates/></span></p>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <span class="apparat">
            <xsl:apply-templates select="tei:rdg[@source='#ed3_1688']"/>/<xsl:apply-templates select="tei:rdg[@source='#ed6_1691']"/>
        </span>
    </xsl:template>
    
 
    
   
   
    <xsl:template match="tei:bibl">
        <span style="color:blue"><xsl:apply-templates/></span>
    </xsl:template>
    
</xsl:stylesheet>


