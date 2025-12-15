<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
   
    <xsl:strip-space elements="*"/>

    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                    <title>Titre de l'oeuvre</title>
            </head>

            <body>
                <h1><xsl:apply-templates select="//tei:head[@type='title'][@n='1']"/></h1>
                <h2>Titre de chapitre</h2>
                <xsl:apply-templates select="//tei:div[@n='3']/tei:p"/>
                      
            </body>
        </html> 
    </xsl:template>   
        
           <xsl:template match="//tei:div[type='remark'][@n='3']/tei:p/tei:app"/>
            <p><xsl:apply-templates/></p>
          </xsl:template
  
        <xsl:template match="tei:app/tei:rdg [@source='#ed3']">
            <p><xsl:apply-templates/><span style="color:red"></span></p>
          </xsl:template>
  
</xsl:stylesheet>
