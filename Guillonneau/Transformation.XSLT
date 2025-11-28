<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <!-- Honnêtement, je n'ai rien compris. J'ai essayé de m'aider des explications écrites d'une camarade de classe et des explications sur internet mais c'est très bancal et incertain.. Je suis perdu. -->
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Titre de l'œuvre</title>
            </head>
            
            <body>
                <h1>Grand titre</h1>
                <h2>Titre de chapitre</h2>
                
                <p>
                    Premier paragraphe, avec
                    <span style="color:red">du texte en rouge</span>
                </p>
                
                <p>Deuxième paragraphe</p>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>