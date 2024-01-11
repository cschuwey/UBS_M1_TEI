<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/tei:TEI">
        <html>
            <head>
                <title>
                    <xsl:value-of
                        select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type = 'main']"
                    />
                </title>
                <style type="text/css">
                    body {
                        font-family: 'Times New Roman', serif;
                        line-height: 1.5;
                        color: #333;
                        background-color: #f4f4f4;
                        margin: auto;
                        padding: auto;
                        font-size: 14px;
                    }
                    
                    .title,
                    .subtitle {
                        text-align: center;
                        margin: auto;
                        margin-top: 1rem;
                        margin-bottom: 1rem;
                    }
                    
                    .title {
                        font-size: 2em;
                        color: #333;
                    }
                    
                    .subtitle {
                        font-size: 1.5em;
                        color: #555;
                    }
                    
                    .remarque {
                        margin: 1.5rem auto;
                        max-width: 600px;
                        padding: 1rem;
                        background: #fff;
                        border: 1px solid #ddd;
                        text-align: justify;
                    }
                    
                    .variant {
                        color: red;
                        cursor: pointer;
                    }
                    .key {
                        color: blue;
                        cursor: pointer;
                    }
                    
                    .hidden {
                        display: none;
                    }
                </style>
                <script type="text/javascript">
                    function toggleVisibility(className) {
                        var elems = document.getElementsByClassName(className);
                        for (var i = elems.length - 1; i >= 0; i--) {
                            elems[i].addEventListener('click', function () {
                                var hidden = this.nextElementSibling || this;
                                if (hidden.classList.contains('hidden')) {
                                    hidden.classList.remove('hidden');
                                } else {
                                    hidden.classList.add('hidden');
                                }
                            });
                        }
                    }
                    
                    window.onload = function () {
                        toggleVisibility("variant");
                        toggleVisibility("key");
                    };</script>
            </head>
            <body>
                <div class="title">
                    <xsl:value-of
                        select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type = 'main']"
                    />
                </div>
                <div class="subtitle">
                    <xsl:value-of
                        select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type = 'sub']"/>
                </div>
                <xsl:apply-templates select="tei:text/tei:body/tei:div1/tei:div2"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:div2">
        <h2>
            <xsl:value-of select="tei:head"/>
        </h2>
        <xsl:apply-templates select="tei:div3"/>
    </xsl:template>
    <xsl:template match="tei:div3">
        <div class="remarque">
            <h3>
                <xsl:value-of select="@n"/>
            </h3>
            <xsl:apply-templates select="tei:p"/>
        </div>
    </xsl:template>
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:app">
        <span class="variant">
            <xsl:apply-templates select="tei:lem"/>
        </span>
        <span class="hidden">
            <xsl:apply-templates select="tei:rdg"/>
        </span>
    </xsl:template>

    <xsl:template match="tei:app[@type = 'clé']">
        <span class="key">
            <xsl:apply-templates select="tei:lem"/>
        </span>
        <span class="hidden">
            <xsl:apply-templates select="tei:rdg"/>
        </span>
    </xsl:template>

    <xsl:template match="tei:lem | tei:rdg | tei:g">
        <xsl:value-of select="."/>

    </xsl:template>
    <xsl:template match="tei:note">
        <xsl:variable name="noteNumber">
            <xsl:number count="tei:seg/tei:note" level="any"/>
        </xsl:variable>
        <xsl:text>[</xsl:text>
        <xsl:value-of select="$noteNumber"/>
        <xsl:text>]</xsl:text>
        <!-- Je n'ai pas réussi avec python a affiché les notes en bas de page comme je le souhaitais initiallement -->
    </xsl:template>

</xsl:stylesheet>
