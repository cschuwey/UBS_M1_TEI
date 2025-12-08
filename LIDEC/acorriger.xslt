<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="tei:TEI">
        <html>
        <head>
            <meta charset="UTF-8"></meta>
            <title><xsl:apply-templates select="//tei:teiHeader//tei:titleStmt/tei:title"/></title>
        </head>
        <front>
            <h1><xsl:apply-templates select="//tei:div1[@type='preface']/tei:head"/></h1>
            <xsl:apply-templates select="//tei:div1[@type='preface']/tei:p"/>
        </front>
        <body>
            <h1><xsl:apply-templates select="//tei:div1[@type='Caracteres']/tei:head[@type='main']"/></h1>
            <h2><xsl:apply-templates select="//tei:div1[@type='Caracteres']/tei:head[@type='sub']"/></h2>
            <h2><xsl:apply-templates select="//tei:div2[@n='1']/tei:head"/></h2>
            <xsl:apply-templates select="//tei:div2[@n='1']/tei:div3/tei:p"/>
            <h2><xsl:apply-templates select="//tei:div2[@n='2']/tei:head"/></h2>
            <xsl:apply-templates select="//tei:div2[@n='2']/tei:div3/tei:p"/>
            <h2><xsl:apply-templates select="//tei:div2[@n='3']/tei:head[@type='main']"/></h2>
            <h3><xsl:apply-templates select="//tei:div2[@n='3']/tei:head[@type='sub']"/></h3>
            <xsl:apply-templates select="//tei:div2[@n='3']/tei:div3/tei:p"/>
            <h2><xsl:apply-templates select="//tei:div2[@n='42']/tei:head"/></h2>
            <xsl:apply-templates select="//tei:div2[@n='42']/tei:div3/tei:p"/>
            <xsl:apply-templates select="//tei:div2[@n='42']/tei:div3/tei:note"/>
            <xsl:apply-templates select="//tei:div2[@n='42']/tei:div3/tei:app/tei:rdg/tei:note"/>
        </body>
        <back>
            <h1><xsl:apply-templates select="//tei:div1[@type='Discours']/tei:head"/></h1>
            <h2><xsl:apply-templates select="//tei:div2[@type='prefaceD']/tei:head[@type='main']"/></h2>
            <xsl:apply-templates select="//tei:div2[@type='prefaceD']/tei:p"/>
            <h2><xsl:apply-templates select="//tei:div2[@type='Discours']/tei:head[@type='main']"/></h2>
            <h3><xsl:apply-templates select="//tei:div2[@type='Discours']/tei:head[@type='sub']"/></h3>
            <xsl:apply-templates select="//tei:div2[@type='Discours']/tei:p"/>
            <h1><xsl:apply-templates select="//tei:div1[@type='sommaire']/tei:head"/></h1>
            <xsl:apply-templates select="//tei:div1[@n='sommaire']/tei:p"/>
            <h1><xsl:apply-templates select="//tei:div1[@type='back']/tei:head"/></h1>
            <xsl:apply-templates select="//tei:div1[@n='back']/tei:p"/>
            <h1>Bibliographie</h1>
            <xsl:apply-templates select="//tei:bibl[@n='1']"/>
            <xsl:apply-templates select="//tei:bibl[@n='2']"/>
        </back>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:div1/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template> 
    
    <xsl:template match="tei:div2/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:div3/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
 
    <xsl:template match="tei:app"> 
        <span style="color:red"><xsl:apply-templates select="tei:rdg[@source='#car1688']"/></span>
        /
        <span style="color:green"><xsl:apply-templates select="tei:rdg[@source='#car1694']"/></span>
    </xsl:template>
    
    <xsl:template match="tei:div2[@n='42']/tei:div3[@type='remark']/tei:app/tei:rdg/tei:note[@source='#car1688']">
        <p><span style="color:red">
            <xsl:apply-templates/>
        </span></p>
    </xsl:template>
    
    <xsl:template match="tei:div2[@n='42']/tei:div3[@type='remark']/tei:app/tei:rdg/tei:note[@source='#car1694']">
        <p><span style="color:green">
            <xsl:apply-templates/>
        </span></p>
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        <p><xsl:apply-templates/></p>
    </xsl:template> 
    
</xsl:stylesheet>
