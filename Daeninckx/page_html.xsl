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
                <title><xsl:apply-templates select="//tei:teiHeader//tei:titleStmt/tei:title"/></title>
            </head>
            <body style="margin:0; padding:0; box-sizing:border-box; font-family: verdana, sans-serif">
                <header>
                    <div style="display:flex; margin:20px auto; width:85%; max-width:1300px">
                        <div style="margin:0 auto; text-align:center">
                            <h1><xsl:apply-templates select="//tei:teiHeader//tei:titleStmt/tei:title"/></h1>
                            <div style="padding:20px; border:1px solid black">
                                <h2>Note d'intention</h2>
                                <p><xsl:apply-templates select="//tei:projectDesc/tei:p"/></p>
                                <p><xsl:apply-templates select="//tei:editorialDecl//tei:p"/></p>
                            </div>
                        </div>
                    </div>
                </header>
                <main>
                    <div style="margin:50px 20px 0">
                        <xsl:apply-templates select="//tei:body"/>
                    </div>
                </main>
                <footer>
                    <div>
                        <h2 style="text-align:center">Bibliographie</h2>
                        <div>
                            <xsl:apply-templates select="//tei:sourceDesc"/>
                        </div>
                    </div>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <!-- Templates pour le header -->
    
    <xsl:template match="tei:editorialDecl//tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <!-- Templates pour le body -->
    <!-- Templates pour les parties -->
    
    <xsl:template match="tei:div1[@type='part']/tei:head">
        <h3 style="background:grey; color:white; padding:10px"><xsl:apply-templates/></h3>
    </xsl:template>
    
    <xsl:template match="tei:div2[@type='part_introduction']/tei:p">
        <div style="margin:0 40px 20px; background:#D1E9ED; padding:20px">
            <h4>Introduction de la partie :</h4>
            <p><em><xsl:apply-templates/></em></p>
        </div>
    </xsl:template>
    
    <!-- Templates pour les tables des matières -->
    
    <xsl:template match="tei:div2[@type='table_of_contents']">
        <div style="margin:0 40px; padding:20px 10px">
            <h4>Table des matières :</h4>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div2[@type='table_of_contents']//tei:item">
        <p>- <xsl:apply-templates/></p>
    </xsl:template>
    
    <!-- Templates pour les chapitres -->
    
    <xsl:template match="tei:div2[@type='chapter']">
        <div style="margin:0 40px; padding:20px 10px">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div2[@type='chapter']/tei:head">
        <h4><xsl:apply-templates/></h4>
    </xsl:template>
    
    <!-- Templates pour les remarques -->
    
    <xsl:template match="tei:div3">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div3/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:div3[@type='remark']/tei:p[1]">
        <p>¶ <xsl:apply-templates/></p>
    </xsl:template>
    
    <!-- Templates pour les variantes -->
    
    <xsl:template match="tei:app">
        <span style="color:red">
            [<xsl:apply-templates select="tei:rdg[@source='#ed3_ex1']"/> / <xsl:apply-templates select="tei:rdg[@source='#ed6_ex1']"/>]
        </span>
    </xsl:template>
    
    <!-- Templates pour le footer -->
    
    <xsl:template match="tei:sourceDesc">
        <div style="display:flex; gap: 20px; margin:20px auto; width:85%; max-width:1300px">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        <div style="border:1px solid black; padding:20px">
            <p style="font-size:1.2rem; font-weight:600"><xsl:apply-templates select="tei:title"/></p>
            <p style="text-transform: uppercase"><xsl:apply-templates select="tei:author"/></p>
            <p><xsl:apply-templates select="tei:edition"/></p>
            <p><xsl:apply-templates select="tei:publisher"/></p>
            <p><xsl:apply-templates select="tei:pubPlace"/></p>
            <p><xsl:apply-templates select="tei:date"/></p>
            <p><xsl:apply-templates select="tei:idno"/></p>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
