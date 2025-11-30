<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:template match="tei/TEI">
       <html>
        <head>
    <meta charset="UTF-8"/>
        <title>Titre de l'oeuvre</title>    
        </head> 
           <body>
               <h1><xsl:apply-templates select="//tei:head[@type='title'][@n='1']"/></h1>
               <h2><xsl:apply-templates select="//tei:div2/tei:p"/></h2>
           </body>
           </html>  
           <p><strong>Nombre de remarques :</strong></p>
           <xsl:value-of select="count(.//tei:div3)"/>
           <xsl:template match="//tei:div3[type='remark'][@n='2']/tei:p/tei:app">
           <p><xsl:apply-templates/></p>
           </xsl:template>
           <xsl:template match="tei:app/tei:rdg [@source='#wit-ed3']">
           <p><xsl:apply-templates/><span style="color:red"></span></p>
               <p>Je ne suis pas certain d'avoir compris ce qu'il falait faire</p>
           </xsl:template>                                                
   </xsl:template>
 
