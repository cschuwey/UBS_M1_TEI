<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8">
                    <title>
                        <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                    </title> 
                    
                </meta>
            </head>
        </html>
    </xsl:template>
    <xsl:template match="tei:TEI">
        <html>
            <body>
                
                <h1>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </h1>    
                
                    <xsl:apply-templates select="//tei:div2[@type='remark']"/>
            

                <h2>Bibliographie</h2>
                <xsl:apply-templates select="//tei:sourceDesc//tei:bibl"/> 
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    
    <xsl:template match="tei:app">
        <xsl:apply-templates select="tei:rdg[@source='#ed3_NUMM-8704022']"/>
        /
        <xsl:apply-templates select="tei:rdg[@source='#ed6_NUMM-8712342']"/>
    </xsl:template>
    
    
    <xsl:template match="tei:bibl">
       
<xsl:apply-templates select="@xml:id"/> :
Auteur :
<xsl:apply-templates select="tei:author"/>
        
Titre : 
<xsl:apply-templates select="tei:title"/>
        
Edition : 
<xsl:apply-templates select="tei:edition"/>
        
Lieu de publication : 
<xsl:apply-templates select="tei:pubPlace"/>
        
Editeur : 
<xsl:apply-templates select="tei:publisher"/>
        
Date de publication : 
<xsl:apply-templates select="tei:date"/>.
        
Cote de l'ouvrage : 
    <xsl:apply-templates select="tei:idno"/>
</xsl:template>
</xsl:stylesheet>


<!-- Je ne comprends pas à quoi servent les "persName" ici. C'est pour les auteurs, les quelques "entités" personnifiés comme "Auteur", le créateur du document ? 
Etant donné qu'il ne s'agit pas d'une pièce de théâtre ou un roman, j'ai du mal à y voir l'utilité. -->
