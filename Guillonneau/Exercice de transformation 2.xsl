<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title> <xsl:apply-templates select="//tei:teiStmt/tei:title"></xsl:apply-templates>
                </title>  
                
            </head>
            <body>
                <h1><xsl:apply-templates select='/tei:div1[@type='head']/></h1>
                <p><xsl:apply-templates select='//persName'></xsl:apply-templates></p>
                <p><xsl:apply-templates select='//tei//div3[@type='remark']/tei:p/'></p>
                <p><xsl:apply-templates select='//tei//app/*self::rdg[@source='ed3']/ self::rdg[@source='ed5']/> </p>
                <h2>Bibliographie</h2>
                <xsl:apply-templates select='tei//sourceDesc/bibl[@xml:id='ed']'/>
                <xsl:apply-templates select='tei//sourceDesc/bibl[@xml:id='ed']'/>
            </body>
        </hdml>
        <xsl:apply-templates/>
        </xsl:template>
    
    <xsl:template match="tei:persName">
        <span class="personne"/>
            <xsl:apply-templates/>
        </xsl:template>
    
    <xsl:template match="tei:bibl">
        <div> <xsl:value-of select="title"/> <br/>
                Auteur : <xsl:value-of select="author"/><br/>
                Date : <xsl:value-of select="date"/><br/>
                Édition : <xsl:value-of select="edition"/><br/>
                Éditeur : <xsl:value-of select="publisher"/><br/>
                Lieu : <xsl:value-of select="pubPlace"/><br/>
                Cote : <xsl:value-of select="idno"/>
        </div>
    </xsl:template>
    
</xsl:stylesheet>