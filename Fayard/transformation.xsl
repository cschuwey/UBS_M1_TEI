<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
<xsl:strip-space elements="*"/>
  <xsl:template match="tei:TEI">
    <html>
      <head>
      <meta charset="UTF-8"/>
        <title>Titre de l'œuvre</title>
      </head>
      <body>
        <h1><xsl:apply-templates select="//tei:titleStmt/tei:title"/></h1>
        <p><xsl:apply-templates select="//tei:div3/tei:p"/></p>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="tei:app">
    <span style="color:red"><xsl:apply-templates select="tei:rdg[@source='#ed2']"/></span>
  </xsl:template>
</xsl:stylesheet>
