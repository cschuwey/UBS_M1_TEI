<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
       <html>
           
           <head>
               <meta charset="UTF-8"/>
                   <title>Titre de l'œuvre</title>
           </head>
           <body>
               <h1><xsl:apply-templates select="//tei:titleStmt/tei:title"/></h1>
               <h2>Titre de chapitre</h2>

                   <xsl:apply-templates select="//tei:body//tei:div4//tei:p"/>
           </body>
       </html>
    </xsl:template>
    
    <xsl:template match="tei:app">
        
    <span style="color:red">
        <xsl:apply-templates select="//tei:rdg[@source='#P-e3']"/>
    </span>
    
    </xsl:template>
</xsl:stylesheet>


