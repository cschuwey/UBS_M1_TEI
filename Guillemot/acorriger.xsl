<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>

    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title><xsl:apply-templates select="//tei:titleStmt/tei:title"/></title>
            </head>
            <body>

                <h1>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </h1>
               
                    <xsl:apply-templates select="//tei:div[@n='3'][@type='remark']//tei:p"/>
                
                <xsl:apply-templates select="//tei:sourceDesc//tei:bibl"/>
            </body>
                    
        </html>
    </xsl:template>
    
    <xsl:template match="tei:div[@n='3'][@type='remark']">
        <div>
            <xsl:apply-templates/>
        </div>
        
    </xsl:template>

    <xsl:template match="tei:div[@n='3'][@type='remark']/tei:p">
        <p>
            <xsl:apply-templates/>
        </p>

    </xsl:template>

    <xsl:template match="tei:app">        
            <xsl:apply-templates select="tei:rdg[@source='ed3_ex1']"/>
        /
        <xsl:apply-templates select="tei:rdg[@source='ed5_ex1']"/>
    </xsl:template>
    <xsl:template match="tei:bibl">       
    <xsl:apply-templates select="@xml:id"/> :
    <xsl:apply-templates select="tei:author"/>,     
    <xsl:apply-templates select="tei:title"/>, 
    <xsl:apply-templates select="tei:publisher"/>, 
    <xsl:apply-templates select="tei:idno"/>
</xsl:template>

</xsl:stylesheet>
