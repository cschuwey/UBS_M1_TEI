<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

   <xsl:template match="tei:TEI">
       <html>
           <head>
               <xsl:value-of select="tei:title"></xsl:value-of>
               <style type="text/css">
                   .hidden {
                   display: none;
                   }
               </style>
               
           </head>
           
           <body>
               <span class="changer"><span>lem</span><span class="hidden">rdg</span></span>
           </body>
           
           <script type="text/javascript">
               
               var elems = document.getElementsByClassName("changer");
               for (var i = elems.length - 1; i >= 0; i--) {
               elems[i].addEventListener('click', function handleClick(event) {
               for (var i = this.children.length - 1; i >= 0; i--) {
               if (this.children[i].classList.contains('hidden')) {
               this.children[i].classList.remove('hidden');
               }
               else {
               this.children[i].classList.add('hidden');
               }
               }
               
               });
               }
           </script>
            <body>
                   <p>
                       Nombre de variantes : <xsl:value-of select="count(//tei:app)"></xsl:value-of>
                   </p>
               </body>
       </html>
   </xsl:template>
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
            <xsl:value-of select="@tei:n"></xsl:value-of>
        </p>
    </xsl:template>
    <xsl:template match="tei:div3"/>
    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:note"/>
    <xsl:template match="tei:rdg[position()=1]"><xsl:apply-templates/></xsl:template>
    <xsl:template match="tei:rdg[position()=2]"/>
    <xsl:template match="tei:app[tei:lem]"><xsl:apply-templates/></xsl:template>
</xsl:stylesheet>