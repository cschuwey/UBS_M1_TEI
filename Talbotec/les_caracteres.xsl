<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
        <xsl:template match="tei:TEI">
       <html> 
           <body>
               <head> "Les caractères de La Bruyère" </head>
               <xsl:apply-templates/>
           </body> 
       </html>  
        </xsl:template>
<xsl:template match="tei:teiHeader">
</xsl:template>
   <xsl:template match="tei:p">
       <p>  <xsl:apply-templates/> </p>
    </xsl:template>
        <xsl:template match="tei:note"> </xsl:template>
    <xsl:template match="tei:app/lem"> 
        <lem> </lem> 
    </xsl:template>
        <xsl:template match="tei:rdg"> </xsl:template>
</xsl:stylesheet>
