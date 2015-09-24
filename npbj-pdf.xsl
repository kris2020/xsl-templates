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
                    <fo:block><xsl:call-template name="copyright"/></fo:block>
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
                    <fo:block font-family="'Times New Roman', Times, serif" font-size="9pt" text-transform="uppercase" text-align="center" letter-spacing="1pt">Not Paul, but Jesus</fo:block>
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
        <fo:block font-size="20pt" margin-top="10pt" text-transform="uppercase" text-align="center" letter-spacing="2pt">
            <fo:block>Not Paul, but Jesus</fo:block>
            <fo:block>Vol. III. Doctrine</fo:block>
        </fo:block>        
        <fo:block margin-top="120pt" font-size="14pt" text-align="center" letter-spacing="1pt">
            <fo:block>by</fo:block>
            <fo:block text-transform="uppercase">Jeremy Bentham</fo:block>
        </fo:block>
        <fo:block margin-top="250pt" font-size="12pt" text-align="center" letter-spacing="1pt" text-transform="uppercase" >
            <fo:block>The Bentham Project, UCL</fo:block>
            <fo:block>London</fo:block>
            <fo:block>2013</fo:block>
        </fo:block>        
    </xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Template for the copyright page.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="copyright">
        <fo:block font-size="12pt" margin-top="10pt" text-align="justify">
            <fo:block><fo:inline font-style="italic">Not Paul, but Jesus Vol. III. Doctrine</fo:inline> by Jeremy Bentham published by the  <fo:basic-link 
                external-destination="url('http://www.ucl.ac.uk/Bentham-Project')"
                text-decoration="underline">Bentham Project</fo:basic-link>, UCL, 2013.</fo:block>
            <fo:block margin-top="10pt">This work is licensed under a <fo:basic-link 
                external-destination="url('http://creativecommons.org/licenses/by-nc-nd/3.0/deed.en_GB')"
                text-decoration="underline">Creative Commons CC BY-NC-ND 3.0 Unported License</fo:basic-link>.</fo:block>
            <fo:block margin-top="20pt" text-align="center" font-style="italic">The Collected Works of Jeremy Bentham</fo:block>
            <fo:block margin-top="10pt">The new critical edition of the works and correspondence of Jeremy Bentham (1748-1832) is being prepared and published under the supervision of the Bentham Committee of University College London. In spite of his importance as jurist, philosopher, and social scientist, and leader of the Utilitarian reformers, the only previous edition of his works was a poorly edited and incomplete one brought out within a decade or so of his death. Eight volumes of the new <fo:inline font-style="italic">Collected Works</fo:inline>, five of correspondence, and three of writings on jurisprudence, appeared between 1968 and 1981, published by Athlone Press. Further volumes in the series since then are published by Oxford University Press. The overall plan and principles of the edition are set out in the General Preface to <fo:inline font-style="italic">The Correspondence of Jeremy Bentham</fo:inline> vol. 1, which was the first volume of the <fo:inline font-style="italic">Collected Works</fo:inline> to be published.</fo:block>
        </fo:block>        
    </xsl:template>    
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Template for generating the table of contents.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:head" mode="toc">
                    <xsl:choose>
                        <xsl:when test="../@type = 'part'">
                            <xsl:choose>
                                <xsl:when test="../@xml:id = 'd2'">
                                    <fo:table-row break-before="page">
                                        <fo:table-cell>
                                            <fo:block keep-together.within-column="always" font-size="14pt" margin-top="8pt" text-transform="uppercase"  letter-spacing="2pt"><fo:basic-link internal-destination="{../@xml:id}"><xsl:apply-templates mode="toc"/></fo:basic-link></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell display-align="after">
                                            <fo:block font-size="10pt" text-align="right"><fo:page-number-citation ref-id="{../@xml:id}"/></fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>                                    
                                </xsl:when>
                                <xsl:otherwise>    
                                    <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block keep-together.within-column="always" font-size="14pt" margin-top="8pt" text-transform="uppercase"  letter-spacing="2pt"><fo:basic-link internal-destination="{../@xml:id}"><xsl:apply-templates mode="toc"/></fo:basic-link></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell display-align="after">
                                                <fo:block font-size="10pt" text-align="right"><fo:page-number-citation ref-id="{../@xml:id}"/></fo:block>
                                            </fo:table-cell>
                                    </fo:table-row>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when test="../@type = 'chapter'">
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block keep-together.within-column="always" font-size="14pt" margin-top="8pt"><fo:basic-link internal-destination="{../@xml:id}">Chapter&#160;<xsl:value-of select="substring-after(../@xml:id,'c')"/>.&#160;<xsl:apply-templates mode="toc"/></fo:basic-link></fo:block>
                                </fo:table-cell>
                                <fo:table-cell display-align="after">
                                    <fo:block font-size="10pt" text-align="right"><fo:page-number-citation ref-id="{../@xml:id}"/></fo:block>
                                </fo:table-cell>
                            </fo:table-row>   
                        </xsl:when>    
                        <xsl:when test="../@type = 'appendix'">
                         <fo:table-row>
                             <fo:table-cell>
                                 <fo:block font-size="14pt" margin-top="8pt"><fo:basic-link internal-destination="{../@xml:id}"><xsl:apply-templates mode="toc"/></fo:basic-link></fo:block>
                             </fo:table-cell>
                             <fo:table-cell display-align="after">
                                 <fo:block font-size="10pt" text-align="right"><fo:page-number-citation ref-id="{../@xml:id}"/></fo:block>
                             </fo:table-cell>
                         </fo:table-row>   
                     </xsl:when>                     
                     <xsl:when test="../@type = 'section'">
                         <fo:table-row>
                             <fo:table-cell>
                                 <fo:block font-size="12pt" margin-bottom="4pt" margin-left="24pt"><fo:basic-link internal-destination="{../@xml:id}">&#167;. <xsl:value-of select="substring-after(../@xml:id,'s')"/>&#160;<xsl:apply-templates mode="toc"/></fo:basic-link></fo:block>
                             </fo:table-cell>
                             <fo:table-cell display-align="after">
                                 <fo:block font-size="10pt" text-align="right"><fo:page-number-citation ref-id="{../@xml:id}"/></fo:block>
                             </fo:table-cell>
                         </fo:table-row>
                     </xsl:when>    
                        <xsl:otherwise><!--  do nothing (to keep the table layout happy) -->
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block></fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block></fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </xsl:otherwise>
                    </xsl:choose>                    
            </xsl:template>
    <xsl:template match="tei:note[@type = 'editor']" mode="toc"/>    
              
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Give each div a unique ID</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:div">
        <xsl:choose>
            <xsl:when test="@type = 'chapter' or @type = 'appendix'">
            <fo:block id="{@xml:id}">
                <xsl:apply-templates/>
            </fo:block>
            <fo:block page-break-after="always"/>
        </xsl:when>
            <xsl:otherwise>                
        <fo:block id="{@xml:id}">
            <xsl:apply-templates/>
        </fo:block>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Make head tag in a div into headings based on what type of div it
                is</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:head">
        <xsl:if test="../@type = 'part'">
            <fo:block page-break-before="always"/>
            <fo:block font-size="16pt"
                margin-bottom="24pt" text-transform="uppercase" text-align="center" letter-spacing="2pt">
                <xsl:apply-templates/>
            </fo:block>         
        </xsl:if>
        <xsl:if test="../@type = 'chapter'">
            <fo:block font-size="14pt" margin-bottom="12pt" text-transform="uppercase" text-align="center" letter-spacing="2pt">Chapter <xsl:value-of select="substring-after(../@xml:id,'c')"/>.&#160;<xsl:apply-templates/></fo:block>
        </xsl:if>
        <xsl:if test="../@type = 'appendix'">
            <fo:block font-size="14pt" margin-bottom="12pt" text-transform="uppercase" text-align="center" letter-spacing="2pt"><xsl:apply-templates/></fo:block>
        </xsl:if>        
        <xsl:if test="../@type = 'section'">
            <fo:block font-size="14pt"  margin-bottom="12pt" margin-top="12pt" text-align="center">&#167;<xsl:value-of select="substring-after(../@xml:id,'s')"/>.&#160;<fo:inline font-style="italic"><xsl:apply-templates/></fo:inline></fo:block>
        </xsl:if>
        <xsl:if test="../@type = 'subsection'">
            <fo:block font-size="14pt"  margin-bottom="12pt" margin-top="12pt" text-align="center"><fo:inline font-style="italic"><xsl:apply-templates/></fo:inline></fo:block>
        </xsl:if>
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
            <xsl:when test="$p-count = '1'">
                <fo:block id="{../@xml:id}.p{$p-count}" text-indent="0pt"
                    text-align="justify">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:when>
            <xsl:when test="$p-count = '5' and ../@xml:id = 'ed-intro'">
                <fo:block id="{../@xml:id}.p{$p-count}" text-indent="0pt" margin-top="6pt"
                    text-align="justify">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:when>
            <xsl:when test="../@xml:id = 'ed-note'">
                <fo:block id="{../@xml:id}.p{$p-count}" text-indent="0pt" margin-top="6pt"
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
    <xsl:template match="tei:lb">
        <xsl:choose>
            <xsl:when test="parent::tei:head or ancestor::tei:div[@xml:id='ed-intro']">
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
        <xsl:if test="../@type = 'editor'">
            <xsl:choose>
                <xsl:when test="$p-count = '1'">
                    <fo:inline><xsl:apply-templates/></fo:inline>
                </xsl:when>
                <xsl:otherwise>
                    <fo:block><xsl:apply-templates/></fo:block>
                </xsl:otherwise>
            </xsl:choose>                           
        </xsl:if>
        <xsl:if test="../@type = 'author'">
            <xsl:choose>
                <xsl:when test="$p-count = '1'">
                    <fo:block text-indent="6pt"
                        text-align="justify"><fo:inline baseline-shift="super" font-size="6pt"><xsl:value-of select="substring(../@xml:id,string-length(../@xml:id))"/></fo:inline>
                        &#160;<xsl:apply-templates/></fo:block>
                </xsl:when>
                <xsl:otherwise>
                    <fo:block text-indent="6pt"
                        text-align="justify">
                        <xsl:apply-templates/>
                    </fo:block>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
        <xsl:if test="../@type = 'subnote'">
            <xsl:choose>
                <xsl:when test="$p-count = '1'">
                    <fo:block text-indent="6pt"
                        text-align="justify"><fo:inline baseline-shift="super" font-style="italic" font-size="6pt"><xsl:value-of select="substring(../@xml:id,string-length(../@xml:id))"/></fo:inline>
                        &#160;<xsl:apply-templates/></fo:block>
                </xsl:when>
                <xsl:otherwise>
                    <fo:block text-indent="6pt"
                        text-align="justify">
                        <xsl:apply-templates/>
                    </fo:block>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>        
    </xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Picks up the ptr element and displays it as an author note anchor</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:ptr">
        <xsl:choose>
            <xsl:when test="@type = 'subnote'">                
                <fo:inline baseline-shift="super" font-style="italic" font-size="6pt"><fo:basic-link internal-destination="{@target}"><xsl:value-of select="substring(@target,string-length(@target))"/></fo:basic-link></fo:inline>
            </xsl:when>
            <xsl:otherwise>
                <fo:inline baseline-shift="super" font-size="6pt"><fo:basic-link internal-destination="{@target}"><xsl:value-of select="substring(@target,string-length(@target))"/></fo:basic-link></fo:inline>
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
    <xsl:template match="tei:*[@rend = 'bold']">
        <fo:inline font-weight="bold">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>    
    <xsl:template match="tei:*[@rend = 'sup']">
        <fo:inline baseline-shift="super"
            font-size="6pt">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Author notes</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:note[@type = 'author']">
        <fo:block background-color="#d6d6c6" id="{@xml:id}" text-align="justify" font-size="11pt" padding="6pt" margin-top="6pt" margin-bottom="6pt"><xsl:apply-templates/></fo:block>
    </xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Subnotes to author notes</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:note[@type = 'subnote']">
        <fo:block background-color="#d6d6c6" id="{@xml:id}" text-align="justify" font-size="10pt" margin-top="6pt" margin-bottom="6pt"><xsl:apply-templates/></fo:block>
    </xsl:template>   

    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Editor notes (footnotes)</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:note[@type = 'editor']">
        <fo:footnote>
            <fo:inline baseline-shift="super" font-size="6pt" font-style="normal" text-transform="none" letter-spacing="0pt"><fo:basic-link internal-destination="{@xml:id}"><xsl:value-of select="substring-after(@xml:id,'fn')"/></fo:basic-link></fo:inline>
            <fo:footnote-body font-size="9pt" text-indent="6pt" text-align="justify" font-style="normal" text-transform="none" letter-spacing="0">
                <fo:block id="{@xml:id}"><fo:inline baseline-shift="super" font-size="6pt"><xsl:value-of select="substring-after(@xml:id,'fn')"/></fo:inline>&#160;<xsl:apply-templates/></fo:block>
            </fo:footnote-body>
        </fo:footnote>
        <!--<fo:block id="{@xml:id}">
            <fo:list-block provisional-distance-between-starts="0pt">
            <fo:list-item>
            <fo:list-item-label end-indent="label-end()">
            <fo:block>
            <fo:inline baseline-shift="super" font-size="6pt"><xsl:value-of select="substring-after(@xml:id,'fn')"/></fo:inline>
            </fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="body-start()">
            <fo:block text-indent="12pt">
            <xsl:apply-templates/>
            </fo:block>
            </fo:list-item-body>
            </fo:list-item>
            </fo:list-block>
            </fo:block>-->
    </xsl:template> 
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Manuscript notes</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:note[@type = 'ms']">
            <fo:block margin-top="3pt" margin-bottom="3pt" font-size="8pt" font-style="normal" text-transform="none" letter-spacing="0pt" text-align="right">
                <xsl:apply-templates/>
            </fo:block>        
    </xsl:template>   
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Quotations</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:q">
        <fo:block margin-top="3pt" margin-bottom="3pt" font-size="11pt">
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
    <xsl:template match="tei:sic" priority="99"><!-- blank --></xsl:template>
    
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
    <xsl:template match="tei:ref[@target]">
        <fo:basic-link internal-destination="{@target}"><xsl:apply-templates/> [p.<fo:page-number-citation ref-id="{@target}"/>]</fo:basic-link>
    </xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Other editorial interventions</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:gap">[...?]</xsl:template>
    <xsl:template match="tei:add[@type = 'index']"><fo:inline font-family="'Wingdings'">F</fo:inline></xsl:template>
    <xsl:template match="tei:unclear"><xsl:apply-templates/>[?]</xsl:template>
    
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
