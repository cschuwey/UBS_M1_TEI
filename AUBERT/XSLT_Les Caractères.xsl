
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="tei:TEI">
        
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title></title>
            </head>
            <body>
                <h1><xsl:apply-templates select="//tei:body/tei:div1/tei:head[@source='n=1']"></xsl:apply-templates></h1>
                <!--Pour obtenir le h1, il fallait que je trouve une particularité avec ce div1 comparé aux autres. C'est le seul à ne pas avoir de div2.-->
                <p><span style="color:red"><xsl:apply-templates select="//tei:rdg[@source='#Ed7_ex1']"/></span></p>
                
                
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:p[ancestor::tei:app[@source='Ed7_ex1']]">
        <p><span style="color:red"><xsl:apply-templates/></span></p>
    </xsl:template>
</xsl:stylesheet>

<!--Je ne suis pas sûre du tout...-->
