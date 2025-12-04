<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
<xsl:output method="text"/>
<xsl:strip-space elements="*"/>
<xsl:template match="tei:TEI">
    <meta charset="UTF-8"/>
<html>
    <title><xsl:template select="/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></title>
<body>
<h1><xsl:apply-templates select="//tei:titleStmt/tei:title"/></h1>
<p><xsl:apply-templates select="//tei:PersName"/></p>
<p><div><xsl:apply-templates select="//tei:div3[@type='remark']"/></div></p>
<h2>Bibliographie</h2>
<p><xsl:apply-templates select="//tei:sourceDesc/bibl"/></p>

<!--Le div3 avec des remarques affiche tout le div3, dont les variantes-->
</body>


</html>


<xsl:apply-templates/>
</xsl:template>

<xsl:templates match="//tei:PersName">
<span class="personne"><xsl:apply-templates/></span>
</xsl:templates>

<xsl:templates match="//tei:div3[@type='remark']">
<p><div><xsl:apply-templates/></div></p>
<!--Si en haut j'écris qu'il faut que chaque remarque est dans un div et un paragraphe, ici je spécifie que chaque remarque
doit être dans un div et un p différent-->
</xsl:templates>

<xsl:templates match="//tei:div3/tei:p/tei:app">
<xsl:apply-templates select="//tei:app/tei:rdg[@source='#Ed7_ex1']"/> / <xsl:apply-templates select="//tei:app/tei:rdg[@source='#Ed2_ex2']"/>
</xsl:templates>

<xsl:templates match="//tei:sourceDesc/bibl">
<p><xsl:text><i><xsl:apply-templates/></i></xsl:text></p>
</xsl:templates>

</xsl:stylesheet>
