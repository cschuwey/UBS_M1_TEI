<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:strip-space elements="*"/>
    <!-- Pour retirer espacements et retours à la ligne. -->


    <xsl:template match="tei:TEI">
        <!-- Je souhaite avoir une structure HTML en sortie -->

        <!-- Début <HTML> -->
        <html>
            <!-- Début <head> -->
            <head>
                <style type="text/css">
                    .hidden {
                        display: none;
                    }
                    
                    /* Body */
                    * {
                        cursor: default;
                        /* J'ai ajouté un "cursor: default;" au body car je trouvais que le cursor par défaut n'était pas le plus adapté à la mise en page. J'ai aussi ajouté un cursor particulier pour les variantes afin que l'utilisateur•ice puisse s'apercevoir d'un changement dans le texte et ait l'idée de cliquer. J'ai essayé de choisir un cursor qui correspondait à cette idée. */
                    }
                    
                    body {
                        background: linear-gradient(to bottom, #DBC2AD 0%, #E9D3C0 50%, #EFDCCC 100%);
                    }
                    
                    p {
                        font-family: "Times New Roman", Times, serif;
                        font-size: 16px;
                        letter-spacing: 1px;
                        word-spacing: 1px;
                        line-height: 1.5;
                        color: #000000;
                        font-weight: normal;
                        text-decoration: none;
                        font-style: normal;
                        font-variant: normal;
                        text-transform: none;
                        position: relative;
                        text-align: justify;
                        padding: 10px 35px 10px;
                        border: 2px solid #D1B7A1;
                        /* Je souhaitais faire en sorte que la "div3 n=9" ait un border à elle toute seule, car il y a deux paragraphes. Cependant, je n'ai pas trouvé de solution à ce problème : j'ai esasyé de modifier le fichier XML afin de relier les deux "p" et insérer un saut de ligne et j'ai essayé de lui créer une ID à cette "div3" en particulière pour lui insérer son propre border, mais ces deux tentatives ont échoué.*/
                    }
                    
                    #variants {
                        font-family: "Times New Roman", Times, serif;
                        font-size: 18px;
                        letter-spacing: 2px;
                        word-spacing: 2px;
                        color: #000000;
                        font-weight: 700;
                        text-decoration: none;
                        font-style: italic;
                        font-variant: normal;
                        text-transform: none;
                        position: relative;
                        text-align: jusitfy;
                        border: none;
                    }
                    
                    .original {
                        font-family: "Times New Roman", Times, serif;
                        font-size: 16px;
                        letter-spacing: 2px;
                        word-spacing: 2px;
                        color: #BA0001;
                        font-weight: 700;
                        text-decoration: none;
                        font-style: normal;
                        font-variant: small-caps;
                        text-transform: none;
                        position: relative;
                        text-align: justify;
                        cursor: context-menu;
                    }
                    
                    .reading_1 {
                        font-family: "Times New Roman", Times, serif;
                        font-size: 16px;
                        letter-spacing: 2px;
                        word-spacing: 2px;
                        color: #01377D;
                        font-weight: 700;
                        text-decoration: none;
                        font-style: normal;
                        font-variant: small-caps;
                        text-transform: none;
                        position: relative;
                        text-align: justify;
                        cursor: context-menu;
                    }
                    
                    /* Headings */
                    h1 {
                        font-family: 'Times New Roman', Times, serif;
                        font-size: 24px;
                        letter-spacing: 0.8px;
                        word-spacing: -0.4px;
                        color: #000000;
                        font-weight: 700;
                        font-style: italic;
                        font-variant: normal;
                        text-transform: none;
                        position: relative;
                        text-align: center;
                    }
                    #jb {
                        font-size: 24px;
                        letter-spacing: 0.8px;
                        word-spacing: -0.4px;
                        color: #000000;
                        font-weight: 700;
                        font-style: normal;
                        font-variant: normal;
                        text-transform: none;
                        position: relative;
                        text-align: center;
                    }
                    
                    h2 {
                        font-family: "Times New Roman", Times, serif;
                        font-size: 22px;
                        letter-spacing: 2px;
                        word-spacing: 2px;
                        color: #000000;
                        font-weight: 700;
                        text-decoration: none;
                        font-style: normal;
                        font-variant: normal;
                        text-transform: none;
                        position: relative;
                        text-align: center;
                    }
                    
                    h3 {
                        font-family: "Times New Roman", Times, serif;
                        font-size: 20px;
                        letter-spacing: 2px;
                        word-spacing: 2px;
                        color: #000000;
                        font-weight: 700;
                        text-decoration: none;
                        font-style: normal;
                        font-variant: normal;
                        text-transform: none;
                        position: relative;
                        text-align: center;
                    }
                    
                    h4 {
                        font-family: "Times New Roman", Times, serif;
                        font-size: 18px;
                        letter-spacing: 2px;
                        word-spacing: 2px;
                        color: #000000;
                        font-weight: 700;
                        text-decoration: none;
                        font-style: normal;
                        font-variant: normal;
                        text-transform: none;
                        position: relative;
                        text-align: center;
                    
                    }</style>
                <!-- Style CSS pour le document. -->

                <title>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </title>
                <h1>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </h1>
                <h1 id="jb">
                    <xsl:apply-templates select="//tei:titleStmt/tei:author"/>
                </h1>
            </head>
            <!-- Fin <head> -->

            <!-- Début <body> -->
            <body>
                <p id="variants">Nombre de variantes : <xsl:value-of select="count(//tei:app)"/></p>
                <!-- Compter le nombre de variantes : cet élément devra apparaître au début. = numéro de <tei:app> -->
                <h2>
                    <xsl:apply-templates select="//tei:div1"/>
                </h2>

            </body>
            <!-- Fin <body> -->

            <script type="text/javascript">
                var elems = document.getElementsByClassName("changer");
                for (var i = elems.length - 1; i >= 0; i--) {
                    elems[i].addEventListener('click', function handleClick(event) {
                        for (var i = this.children.length - 1; i >= 0; i--) {
                            if (this.children[i].classList.contains('hidden')) {
                                this.children[i].classList.remove('hidden');
                            } else {
                                this.children[i].classList.add('hidden');
                            }
                        }
                    });
                }</script>

        </html>
        <!-- Fin <HTML> -->

    </xsl:template>

    <!-- Début <template:match> -->
    <xsl:template match="tei:div3">
        <h4>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>

    <xsl:template match="tei:div3/tei:p[1]">
        <p>(<xsl:value-of select="../@n"/>)<xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="tei:div3/tei:p[position() > 1]">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:app">
        <span class="changer original">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:lem">
        <span class="original">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:app/tei:rdg[1]">
        <span class="hidden reading_1">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:app//tei:rdg[not(position() = 1)]"/>
    <!-- Fin <xsl:apply-templates particuliers -->

    <!-- Début autres -->
    <xsl:template match="tei:note"/>

    <xsl:template match="//tei:titleStmt/tei:title">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="//tei:div1">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>

    <xsl:template match="//tei:div2">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    <!-- Fin autres -->


</xsl:stylesheet>
