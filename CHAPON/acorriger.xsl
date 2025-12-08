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
                    <title><xsl:apply-templates select="//tei:bibl[@xml:id='ed3']//tei:title" mode="head"/></title>
                </head>
                <body>
                    <p><xsl:apply-templates select="//tei:persName"/></p> <!-- j'en ai pas dans mon document -->
                    <center><xsl:apply-templates select="//tei:body"/></center><!-- même si la balise n'est plus trop utilisée -->
                    <h2>Bibliographie</h2>
                    <xsl:apply-templates select="//tei:sourceDesc"/>
                </body>
            </html>
        </xsl:template>
        
        <xsl:template match="tei:persName">
            <span class="personne"><xsl:apply-templates/></span>
        </xsl:template>
        <xsl:template match="tei:body">
            <xsl:apply-templates/>
        </xsl:template>
        
        <xsl:template match="tei:head[@type='main'][ancestor::tei:div[@type='part']]">
            <h1><xsl:apply-templates/></h1>
        </xsl:template>
        
        <xsl:template match="tei:head[@type='sub'][ancestor::tei:div[@type='part']]">
            <h2><xsl:apply-templates/></h2>
        </xsl:template>
        
        <xsl:template match="tei:div[@type='introduction'][ancestor::tei:div[@type='part']]">
            <i><xsl:apply-templates/></i>
        </xsl:template>
        
        <xsl:template match="tei:div[@type='sommaire'][ancestor::tei:div[@type='part']]">
           <!-- ne rien mettre car à enlever sur le fichier tei si je souhaite la construire ici -->        
        </xsl:template>
        
        <xsl:template match="tei:head[@type='main'][ancestor::tei:div[@type='chapter']]">
            <h3><xsl:apply-templates/></h3>
        </xsl:template>
        
        <xsl:template match="tei:p">
            <p><xsl:number level="multiple" count="//tei:div[@type='remark']|//tei:div[@type='remark']/tei:p" format="1.1"></xsl:number><xsl:text> </xsl:text><xsl:apply-templates/></p> 
        </xsl:template>
        
        <xsl:template match="tei:app">
            (<xsl:apply-templates select="tei:rdg[@source='#ed3']"/>/<xsl:apply-templates select="tei:rdg[@source='#ed5']"/>) <!-- tjr pas réussi à déplacer le paragraphe volant entre les éditions 3 et 5-->
        </xsl:template>
        
        <xsl:template match="tei:rdg[@source='#ed3']">
            <span style="color:red"><xsl:apply-templates/></span>
        </xsl:template>
        
        <xsl:template match="tei:rdg[@source='#ed5']">
            <span style="color:blue"><xsl:apply-templates/></span>
        </xsl:template>
        
        <xsl:template match="tei:div[@type='remark']">
            <div>remarque n°<xsl:number count="//tei:div[@type='remark']" format="1"></xsl:number><xsl:text> </xsl:text><xsl:apply-templates/></div>
            <xsl:value-of select="@n"/>
        </xsl:template>
        
        <xsl:template match="tei:sourceDesc">
            <xsl:apply-templates/>
        </xsl:template>
        
        <xsl:template match="tei:title" mode="head"> <!-- bon ça a pas marché la différenciation-->
            <xsl:apply-templates/>
        </xsl:template>
    
    <xsl:template match="tei:title" mode="bibl"> <!-- et ça non plus -->
        <p><I><xsl:apply-templates/>.</I></p>
    </xsl:template>
        
        <xsl:template match="tei:author">
            <p><xsl:apply-templates select="tei:forename"/> <xsl:apply-templates select="tei:surname"/>,</p>
        </xsl:template>
        
        <xsl:template match="tei:idno">
            <p>Cote : <xsl:apply-templates/></p>
        </xsl:template>
        
        <xsl:template match="tei:publisher">
            <xsl:apply-templates/>
        </xsl:template>
        
        <xsl:template match="tei:date">
            <xsl:apply-templates/>
        </xsl:template>
        
        <xsl:template match="tei:edition">
            <xsl:value-of select="."/> <!--change rien dans le résultat de le mettre comme ça apparait tjr deux fois-->
        </xsl:template>
        
        <xsl:template match="tei:ref">
            <p><xsl:apply-templates/></p>
        </xsl:template>
        
        <xsl:template match="tei:bibl">
            <xsl:apply-templates/>
            <p><xsl:apply-templates select="tei:publisher"/>, 
                <xsl:apply-templates select="tei:date"/>, <!-- je voulais les mettre ensemble mais ce n'est peut-être pas la solution car les infos apparaissent deux fois -->
                <xsl:apply-templates select="tei:edition"/>.</p>
        </xsl:template>
        
</xsl:stylesheet>
