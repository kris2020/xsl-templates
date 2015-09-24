<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">
    
    <xsl:template match="tei:TEI">
        <fo:root>
            <fo:layout-master-set>   
                <fo:simple-page-master margin-right="0.25in" margin-left="0.25in" margin-bottom="0.25in"
                    margin-top="0.25in" page-width="6in" page-height="9in" master-name="page">
                    <fo:region-body margin-top="0.5in" margin-bottom="0.5in" margin-left="0.5in" margin-right="0.5in"/>
                    <fo:region-before/>                    
                    <fo:region-after extent="0.5in" />
                    <fo:region-end/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <fo:page-sequence master-reference="page" force-page-count="no-force">
                <fo:flow flow-name="xsl-region-body" font-family="'Times New Roman', Times, serif">
                    <fo:block><xsl:call-template name="title-page"/></fo:block>
                </fo:flow>  
            </fo:page-sequence>                
            
            <fo:page-sequence master-reference="page" force-page-count="no-force">
                <fo:flow flow-name="xsl-region-body" font-family="'Times New Roman', Times, serif">
                    <fo:block font-size="16pt"
                        margin-bottom="24pt" text-transform="uppercase" text-align="center" letter-spacing="2pt">Contents</fo:block>
                        <fo:block>
                            <fo:table>
                                <fo:table-column column-width="90%"/>
                                <fo:table-column column-width="10%"/>
                                <fo:table-body>
                                    <xsl:apply-templates select="//tei:head" mode="toc"/>
                                </fo:table-body>
                            </fo:table>
                        </fo:block>
                </fo:flow>                
            </fo:page-sequence>          
                      
            <fo:page-sequence master-reference="page">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block font-family="'Times New Roman', Times, serif" font-size="9pt" text-transform="uppercase" text-align="center" letter-spacing="1pt">A Visit to Jeremy Bentham</fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center" font-family="'Times New Roman', Times, serif" font-size="12pt"><fo:page-number/></fo:block>
                </fo:static-content>
                <!--<fo:static-content flow-name="xsl-region-end">
                    <fo:block font-family="Times, 'Times New Roman', serif" font-size="6pt"><fo:retrieve-marker retrieve-class-name="ms-note"/></fo:block>
                </fo:static-content>-->
                <fo:static-content flow-name="xsl-footnote-separator">
                    <fo:block>
                        <fo:leader leader-pattern="rule" rule-thickness="0.5pt" leader-length="33%"/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body" font-family="'Times New Roman', Times, serif" font-size="12pt" text-align="justify">
                    <xsl:apply-templates/>
                </fo:flow>                
            </fo:page-sequence>
        </fo:root>        
    </xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Template for the title page.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="title-page">
        <fo:block font-size="24pt" margin-top="10pt" text-transform="uppercase" text-align="center">
            <fo:block><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></fo:block>
        </fo:block>        
        <fo:block margin-top="180pt" font-size="16pt" text-align="center" letter-spacing="1pt">
            <fo:block>By <fo:inline text-transform="uppercase"><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/></fo:inline></fo:block>            
            <fo:block margin-top="20pt">Edited by
                <fo:block>
                    <fo:inline text-transform="uppercase"><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor"/></fo:inline>
                </fo:block>  
            </fo:block>
        </fo:block>
        <fo:block margin-top="170pt" font-size="12pt" text-align="center" letter-spacing="1pt" text-transform="uppercase">
            <fo:block>The Bentham Project</fo:block>
            <fo:block>University College London</fo:block>
            <fo:block>2015</fo:block>
        </fo:block>        
    </xsl:template>
      
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Template for generating the table of contents.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:head" mode="toc">
                                    <fo:table-row>
                                        <fo:table-cell>
                                            <fo:block keep-together.within-column="always" font-size="14pt" margin-top="8pt" text-transform="uppercase"  letter-spacing="2pt"><fo:basic-link internal-destination="{../@xml:id}"><xsl:apply-templates mode="toc"/></fo:basic-link></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell display-align="after">
                                            <fo:block font-size="10pt" text-align="right"><fo:page-number-citation ref-id="{../@xml:id}"/></fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>                                    
    </xsl:template>
    <xsl:template match="tei:note" mode="toc"/>    
              
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Give each div a unique ID</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:div">
            <fo:block id="{@xml:id}">
                <xsl:apply-templates/>
            </fo:block>
            <fo:block page-break-after="always"/>
    </xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Make head tag in a div into a heading</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:head">
            <fo:block page-break-before="always"/>
            <fo:block font-size="16pt"
                margin-bottom="24pt" text-transform="uppercase" text-align="center" letter-spacing="2pt">
                <xsl:apply-templates/>
            </fo:block>          
    </xsl:template>    
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Remove indent of the first paragraph of any section or chapter.</xd:p>
        </xd:desc>
    </xd:doc>   
    <xsl:template match="tei:div/tei:p">
        <xsl:variable name="p-count">
            <xsl:number level="single" count="tei:p"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="@rend = 'center'">
                <xsl:choose>
                    <xsl:when test="$p-count = '12'">
                        <fo:block page-break-before="always"/>
                        <fo:block id="{../@xml:id}.p{$p-count}" text-align="center" margin-top="6pt" margin-bottom="6pt">
                            <xsl:apply-templates/>
                        </fo:block>
                    </xsl:when>                    
                <xsl:otherwise>                
                <fo:block id="{../@xml:id}.p{$p-count}" text-align="center" margin-top="10pt" margin-bottom="10pt">
                    <xsl:apply-templates/>
                </fo:block>
                </xsl:otherwise>
                </xsl:choose>
            </xsl:when>  
            <xsl:when test="@rend = 'right'">
                <fo:block id="{../@xml:id}.p{$p-count}" text-align="right" margin-bottom="10pt">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:when>    
            <xsl:when test="@rend = 'end'">
                <fo:block id="{../@xml:id}.p{$p-count}" text-align="right" margin-top="20pt" text-indent="0pt">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:when>              
            <xsl:when test="@n = '1'">
                <fo:block id="{../@xml:id}.p{$p-count}" text-indent="0pt"
                    text-align="justify">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:when> 
            <xsl:otherwise>
                <fo:block id="{../@xml:id}.p{$p-count}" text-indent="20pt"
                    text-align="justify">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:otherwise>    
        </xsl:choose>        
    </xsl:template>    
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Process line breaks.</xd:p>
        </xd:desc>
    </xd:doc>   
    <xsl:template match="tei:q/tei:lb">
        <fo:block/>
    </xsl:template>
    <xsl:template match="tei:lb">
        <xsl:choose>
            <xsl:when test="../@rend='end'">
                <fo:block/>
            </xsl:when>
            <xsl:otherwise>
                <fo:block margin-bottom="12pt"/>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>    
           
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Handle paragraphs within notes. Because the superscript letter which acts as an anchor is the first part of the author note, we need a hack to insert it after the first paragraph tag, which we find by counting the paragaphs contained within the note div. Parse the anchor letter from the note's xml:id. Unanchored notes need to have their paragraph tags processed correctly, too.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:note/tei:p">        
        <xsl:variable name="p-count">
            <xsl:number level="single" count="tei:p"/>
        </xsl:variable>        
        <xsl:choose>
            <xsl:when test="$p-count = '1'">
                <fo:inline><xsl:apply-templates/></fo:inline>
            </xsl:when>
            <xsl:otherwise>
                <fo:block><xsl:apply-templates/></fo:block>
            </xsl:otherwise>
        </xsl:choose>  
        </xsl:template>    
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Quiten the teiHeader</xd:p>
        </xd:desc>
    </xd:doc>    
    <xsl:template match="tei:teiHeader">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Renditions</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:*[@rend = 'italic']">
        <fo:inline font-style="italic">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>
    <xsl:template match="tei:*[@rend = 'underline']">
        <fo:inline text-decoration="underline">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>  
    <xsl:template match="tei:*[@rend = 'bold']">
        <fo:inline font-weight="bold">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>    
    <xsl:template match="tei:*[@rend = 'superscript']">
        <fo:inline baseline-shift="super"
            font-size="6pt">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template> 
    <xsl:template match="tei:*[@rend = 'small-caps']">
        <fo:inline font-size="smaller" text-transform="uppercase">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template> 
    <xsl:template match="tei:add">
        <fo:inline baseline-shift="super"
            font-size="6pt">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template> 
    <xsl:template match="tei:del">
        <fo:inline text-decoration="line-through">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template> 
    <xsl:template match="tei:*[@rend = 'catchword']">
    </xsl:template> 

    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Editor notes (footnotes)</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:note">
                    <fo:footnote>
                        <fo:inline baseline-shift="super" font-size="6pt" font-style="normal" text-transform="none" letter-spacing="0pt"><fo:basic-link internal-destination="{@xml:id}"><xsl:value-of select="substring-after(@xml:id,'fn')"/></fo:basic-link></fo:inline>
                        <fo:footnote-body font-size="9pt" start-indent="0cm" text-indent="6pt" text-align="justify" font-style="normal" text-transform="none" letter-spacing="0">
                            <fo:block id="{@xml:id}"><fo:inline baseline-shift="super" font-size="6pt"><xsl:value-of select="substring-after(@xml:id,'fn')"/></fo:inline>&#160;<xsl:apply-templates/></fo:block>
                        </fo:footnote-body>
                    </fo:footnote>                
    </xsl:template> 
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Quotations</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:q">
        <fo:block margin-top="3pt" margin-bottom="3pt" margin-left="32pt" font-size="11pt">
            <xsl:apply-templates/>
        </fo:block>        
    </xsl:template>
    <xsl:template match="tei:q/tei:p">
        <fo:block margin-top="0pt" margin-bottom="0pt" text-indent="20pt">
            <xsl:apply-templates/>
        </fo:block>        
    </xsl:template>  

    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>For editorial versus authorial correction, choose editorial by default</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:corr" priority="99">
        <fo:inline>[<xsl:apply-templates/>]</fo:inline>
    </xsl:template>
    <xsl:template match="tei:sic" priority="99"><fo:inline><xsl:apply-templates/></fo:inline></xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Table (used for symbols in editorial introduction)</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:table">
        <fo:block>
            <fo:table margin-top="6pt" margin-bottom="10pt">
                <fo:table-column column-width="25%"/>
                <fo:table-column column-width="75%"/>
                <fo:table-body>
                    <xsl:apply-templates/>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>        
    <xsl:template match="tei:table/tei:row">          
        <fo:table-row>
            <xsl:apply-templates/>
        </fo:table-row>        
    </xsl:template>    
    <xsl:template match="tei:table/tei:row/tei:cell">
        <fo:table-cell>
            <fo:block><xsl:apply-templates/></fo:block>
        </fo:table-cell>            
    </xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Transforms TEI ref element into a link element.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:ref">
        <xsl:if test="@type = 'external'">
        <fo:basic-link external-destination="url('{@target}')" text-decoration="underline"><xsl:apply-templates/></fo:basic-link>
        </xsl:if>
        <xsl:if test="@type = 'internal'">
            <fo:basic-link internal-destination="{@target}" text-decoration="underline"><xsl:apply-templates/></fo:basic-link>  
        </xsl:if>
    </xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Other editorial interventions</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:gap">[...?]</xsl:template>
    <xsl:template match="tei:add[@type = 'index']"><fo:inline font-family="Wingdings">F</fo:inline></xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Page breaks</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:pb">
        <fo:block page-break-before="always"/>
    </xsl:template>   
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Define the footnote separator dimensions</xd:p>
        </xd:desc>
    </xd:doc>
    <fo:static-content flow-name="xsl-footnote-separator">
        <fo:block>
            <fo:leader leader-pattern="rule" leader-length="100%" rule-thickness="0.5pt"
                rule-style="solid" color="black"/>
        </fo:block>
    </fo:static-content>
   
</xsl:stylesheet>
