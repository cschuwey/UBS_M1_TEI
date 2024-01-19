<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>

    <xsl:template match="tei:TEI">
        
        <html>
            <head>
        <!-- Ce script sert à modifier le texte (couleur, police, taille, positionnement...) -->
                <style type="text/css">.title { font-family: 'Calibri';line-height: 1.5;
                    color: darkgreen; margin: auto; text-decoration: underline; text-align: center; font-size: 33px; }
                    
                    .title2 { font-family: 'Calibri';line-height: 1.5;
                    color: darkblue; margin: auto; font-weight: bold; text-align: center; font-size: 27px; }
                    
                    .nombre { font-family: 'Calibri';line-height: 1.5;
                    color: black; margin: auto; font-style: italic; text-indent: 5em; font-size: 21px; }
                    
                    body { font-family: 'Calibri'; line-height: 1.5;
                    color: #245; margin: auto; text-align: justify; text-indent: 2em; font-size: 16px; padding: 1em; }
                </style>
                
        <!-- Ce script sert à cacher les <rdg> car ils sont placés dans la classe "hidden" (voir plus bas) -->        
                <style type="text/css"> .hidden { display: none; } </style>
                
        <!-- Ici, le titre de l'œuvre est obtenu automatiquement depuis le fichier xml. Il est affiché comme nom de l'onglet -->
                <title>
                    <xsl:value-of select="//tei:titleStmt/tei:title[@type='main']"/>
                    <xsl:value-of select="//tei:titleStmt/tei:title[@type='sub']"/>
                </title>
            </head>
            
            <body>
                
        <!-- Ici, le titre de l'œuvre et du chapitre sont obtenus automatiquement depuis le fichier xml. Ils sont affichés en haut de la page -->
                <div class="title"><xsl:value-of select="//tei:titleStmt/tei:title[@type='main']"/>
                    <xsl:value-of select="//tei:titleStmt/tei:title[@type='sub']"/></div>
        <!-- La balise <p/> vide sert à sauter une ligne dans l'export -->
                <p/>
                <div class="title2"><xsl:value-of select="//tei:div2/tei:head"/></div> 
                
        <!-- Cette fonction sert à compter le nombre de variantes dans le fichier xml -->
                <div class="nombre"><p>Nombre de variantes : <xsl:value-of select="count(//tei:app)"/></p></div>
                
                <xsl:apply-templates select="//tei:div3"/>
                
        <!-- Ce script sert à cliquer sur les variantes dans le rendu html pour les faire changer -->
                <script type="text/javascript"> var elems = document.getElementsByClassName("changer"); for (var i = elems.length - 1; i >= 0; i--) { elems[i].addEventListener('click', function handleClick(event) { for (var i = this.children.length - 1; i >= 0; i--) { if (this.children[i].classList.contains('hidden')) { this.children[i].classList.remove('hidden'); } else { this.children[i].classList.add('hidden'); } } }); } </script>
            </body>
        </html>
    </xsl:template>
    
        <!-- Le <xsl:template match="tei:teiHeader"/> sert à ne pas afficher le teiHeader dans l'export -->
    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:div3">
        <p><xsl:apply-templates/></p>
        </xsl:template>
    
        <!-- Cette commande sert à numéroter automatiquement les remarques à partir du numéro présent dans le <div3> du fichier xml mais de l'afficher dans le même <p>
            que la remarque dans l'export. La commande sert à ne faire ce processus que pour le premier paragraphe de chaque remarque -->
    <xsl:template match="tei:div3/tei:p[1]">
        <p>(<xsl:value-of select="../@n"/>)<xsl:apply-templates/></p>
        </xsl:template>
    
    <xsl:template match="tei:div3/tei:p[position()>1]">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:note"/>
    
        <!-- Donner des classes aux <lem> et <rdg> sert à pouvoir utiliser le premier script pour les afficher de manière voulue -->
    <xsl:template match="tei:app">
        <span class="changer" style="color:red;"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:lem">
        <span><xsl:apply-templates/></span>
        </xsl:template>
    
    <xsl:template match="tei:app//tei:rdg[1]">
        <span class="hidden"><xsl:apply-templates/></span>
        </xsl:template>
    
    <xsl:template match="tei:app//tei:rdg[not(position()=1)]"/>
   </xsl:stylesheet>
