<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="tei:TEI">
        <html>
            <head class="centered-content">
                <h1>
                    <span style="font-family:Formula1 Display-Regular; font-size:2em">
                        <xsl:apply-templates
                            select="//tei:text/tei:body/tei:div1[@type='part' and @n='1']/tei:head"
                        />
                    </span>
                </h1>
            </head>
            <body>
                <div>
                    <p>
                        <span style="color:red">
                            <xsl:value-of select="count(//tei:div3[@type='remark'])"/>
                        </span>
                    </p>

                    <p>
                        <span style="font-size:2em">
                            <xsl:value-of select="count(//tei:app)"/>
                        </span>
                    </p>

                    <xsl:apply-templates select="//tei:div3[@type='remark']"/>
                </div>
                <div id="bibliographie">
                    <h2>
                        <span style="color:blue">Bibliographie</span>
                    </h2>
                    <xsl:apply-templates select="//tei:sourceDesc/tei:bibl[@xml:id='ed3']"/>
                    <xsl:apply-templates select="//tei:sourceDesc/tei:bibl[@xml:id='ed7']"/>                    
                </div>      
                <div id="table_of_content"> 
                    <xsl:apply-templates select="//tei:div2[@type='table_of_contents' and @source='#ed3_ex1']"/> 
                
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:div3[@type='remark']">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:app"> [<xsl:apply-templates select="tei:rdg[@source='#ed7']"/>
        <xsl:apply-templates select="tei:rdg[ @source='#ed3_ex1']"/>] </xsl:template>
    
    
    <xsl:template match="tei:bibl[@xml:id='ed3']">
        <xsl:apply-templates/>
        <p> Publieur : <xsl:apply-templates select="tei:publisher"/></p> 
         <p>   Date de parution :<xsl:apply-templates select="tei:date"/></p> <!-- je voulais les mettre ensemble mais ce n'est peut-être pas la solution car les infos apparaissent deux fois -->
          <p>  édition :<xsl:apply-templates select="tei:edition"/></p>
        <p> Idno : <xsl:apply-templates select="tei:idno"/></p>
    </xsl:template>
    
    
    <xsl:template match="tei:bibl[@xml:id='ed7']">
        <xsl:apply-templates/>
        <p> Publieur : <xsl:apply-templates select="tei:publisher"/></p> 
        <p>   Date de parution :<xsl:apply-templates select="tei:date"/></p> <!-- je voulais les mettre ensemble mais ce n'est peut-être pas la solution car les infos apparaissent deux fois -->
        <p>  édition :<xsl:apply-templates select="tei:edition"/></p>
        <p> Idno : <xsl:apply-templates select="tei:idno"/></p>
    </xsl:template>
    





</xsl:stylesheet>
