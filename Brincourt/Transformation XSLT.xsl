<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:strip-space elements="*"/>
    
    <!-- Template principal -->
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </title>
            </head>
            <body>
                <!-- Affichage du titre -->
                <h1><xsl:apply-templates select="//tei:teiHeader/filesDesc/tei:titleStmt/tei:title"/></h1>
                
                <p><xsl:apply-templates select="//tei:persName"/></p>             
                
                <p><xsl:apply-templates select="//tei:body//tei:div3[@type='remark']"/></p>
            </body>
            
            <!-- ça ne marche pas, rien ne marche -->
            <xsl:template match="tei:sourceDesc"> 
                <p><xsl:apply-templates select="/tei:bibl/tei:edition"/></p>
                <p><xsl:apply-templates select="//tei:publisher"/></p>
                <p><xsl:apply-templates select="//tei:pubPlace"/></p>
                <p><xsl:apply-templates select="//tei:date"/></p>
                <p><xsl:apply-templates select="//tei:idno"/></p>
            </xsl:template>
           

                                          
        </html>
    </xsl:template>
    
    
    
</xsl:stylesheet>
