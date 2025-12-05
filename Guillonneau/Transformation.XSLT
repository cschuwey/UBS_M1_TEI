<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:template match="tei:TEI">
        <hdml>
            <head>
                <meta charset="UTF-8"/>
                <title> <xsl:apply-templates select="//tei:teiStmt/tei:title"></xsl:apply-templates>
                </title>  
               
            </head>
            <body>
                <h1><xsl:apply-templates select="//tei:teiStmt/tei:title"></xsl:apply-templates></h1>
                <h2><xsl:apply-templates select="//tei:div2[@type='chapter']/></h2>
                <p><xsl:apply-templates select="//tei/div3[@type='remark']/tei:p/></p>
            </body>
        </hdml>
        <xsl:apply-templates/>
        <xsl:template match="tei:app">
            <span style="color:red">
                <xsl:apply-templates select="tei:rdg[@source='#ed3']"/>
            </span>
    </xsl:template>
</xsl:stylesheet>

<!--J'ai refait après correction en comprenant un peu mieux :) --!>
