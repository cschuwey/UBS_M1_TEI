<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
 
 <xsl:template match="tei:TEI">
     <html>
         <head><title> <xsl:apply-templates select="//tei:titleStmt/tei:title"/></title></head>
         <body>
             <h1><xsl:apply-templates select="//tei:titleStmt/tei:title"/></h1>
             <xsl:apply-templates select="//tei:div2[@type='remark']/tei:p"/>
             <h2>Bibliographie</h2>
             <xsl:apply-templates select="//tei:sourceDesk/tei:bibl"/>
             
         </body>
     </html>
 </xsl:template>
    
    <xsl:template match="tei:div2[@type='remark']">
        <div><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="tei:div2[@type='remark']/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
</xsl:stylesheet>
j'ai pas de persName dans mon doc tei donc je l'ai pas fait et la consigne avec les app et organiser les elements de bibl j'ai pas compris. 
Par contre en sortie ça ne me met pas les <div> ni le contenu de bibl:
  <!DOCTYPE HTML>
<html xmlns:tei="http://www.tei-c.org/ns/1.0">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Les Caractères de Théophraste traduits du grec : avec les Caractères ou les moeurs de ce siècle</title>
   </head>
   <body>
      <h1>Les Caractères de Théophraste traduits du grec : avec les Caractères ou les moeurs
         de ce siècle</h1>
      <p> Tout est dit, et l'οn vient trop tard depuis plus de sept mille ans qu'il y a des
         hommes, et qui pensent.
         Sur ce qui concerne les mœurs le plus beau et le meilleur est enlevé ; 
         l'on ne fait que glaner aprés les Anciens et les habiles d'entre les Modernes.</p>
      <p>Combien de siecles se sont écoulez avant que les hommes dans les sciences et dans
         les arts ayent pû revenir an goût des Anciens, 
         et reprendre enfîn le simple et le naturel</p>
      <p>Entre toutes les différentes expressions qui peuvent rendre une seule de nos pensées,
         il n'y en a qu'une qui soit la bonne ;
         on ne la rencontre pas toûjours en parlant, ou en écrivant ;
         il est vrai neanmoins qu'elle existe, que tout ce qui ne l'est point est faible,
         et ne satisfait point un homme d'esprit qui veut se faire entendre.</p>
      <p> ... </p>
      <h2>Bibliographie</h2>
   </body>
</html>
