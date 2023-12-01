<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="tei:TEI">

        <html>
            <head> </head>
           <body>
               <p>Les caractères de La Bruyère</p>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
<xsl:template match="tei:teiHeader"/>
<xsl:template match="tei:lem"><p><xsl:apply-templates></xsl:apply-templates></p></xsl:template> <!--Comme les lem sont forcément dans les app, je ne sais pas si c'est vraiment nécessaire de préciser les app, je ne sais pas quoi ajouter comme balise, si on doit mettre <p> comme les lem ne sont pas dans un langage html...-->
    <xsl:template match="tei:note"></xsl:template>

</xsl:stylesheet>
