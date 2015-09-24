<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.0">
    <xsl:output encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="yes" />
    
    <xsl:template match="/">
        <html><xsl:apply-templates/></html>
    </xsl:template>
         
    <xsl:template match="tei:TEI/tei:text">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>       
            <link rel="stylesheet" media="screen" type="text/css" href="wheatley.css"/>            
            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"><![CDATA[// JQuery]]></script>
            <script type="text/javascript"><![CDATA[function toggle(getid) { var div = document.getElementById(getid);	div.style.display = (div.style.display == 'none') ? 'inline' : 'none'; }]]></script>
            <script type="text/javascript"><![CDATA[(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-25017282-4', 'auto');
  ga('send', 'pageview');
            ]]></script>
            <title><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></title>
        </head>
            <body>
                <div id="toolbox">
                    <h1>Welcome</h1>
                    <p>Welcome to the <a href="http://www.ucl.ac.uk/Bentham-Project">Bentham Project’s</a> edition of <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/>’s <span class="italic"><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></span>.</p>
                    <p>To increase or reduce the size of the text, simultaneously press the CTRL (Mac: CMD) key and the + or - key respectively.</p>
                    <p><a href="#table-of-contents">View the table of contents</a>.</p>
                    <p>This work is licensed under a <a href="http://creativecommons.org/licenses/by-nc-nd/3.0/deed.en_GB">Creative Commons CC BY-NC-ND 3.0 Unported License</a>.</p>
                    <p>Download this work <a href="http://discovery.ucl.ac.uk/1462164/2/wheatley.xml">as an XML file</a> or <a href="http://discovery.ucl.ac.uk/1462164/1/wheatley.pdf">as a PDF</a>. View the entry at <a href="http://discovery.ucl.ac.uk/1462164/">UCL Discovery</a>.</p>
                    <p>Please send comments and feedback to kcg4 [at] st-andrews.ac.uk.</p>
                    <span class="close-editor-note"><a href="javascript:;" onmousedown="toggle('toolbox');">[hide menu]</a></span>                    
                </div>
                <div id="show-toolbox">
                    <p><a href="javascript:;" onmousedown="toggle('toolbox');">[show menu]</a></p>
                </div>
                <div id="wrapper">
                    <xsl:call-template name="title-page"/>
                    <div id="table-of-contents" class="part">
                        <h1>Contents</h1>
                        <hr class="part-divide"/>                
                        <xsl:apply-templates select="//tei:head" mode="toc"/>
                        <h2><a href="#endnotes">Notes</a></h2>
                    </div>
                    <div class="page-break">&#160;</div>
                    <xsl:apply-templates/>
                    <div id="endnotes" class="part">
                            <h1>Notes</h1>
                            <hr class="part-divide"/>
                            <xsl:apply-templates select="//tei:note" mode="endnotes"/>
                    </div>   
                    <div class="page-break">&#160;</div>
                </div>
            </body>
    </xsl:template>

    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Template for the title page.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="title-page">
        <div id="title-page" class="part">
            <div id="header">
                <h1><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h1>
            </div>
            <div id="byline">
                <p>By <span class="caps"><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/></span></p>
                <p>Edited by <span class="caps"><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor"/></span></p>                
            </div>
            <div id="ucl">                
                <p><span class="caps">The Bentham Project, UCL<br/>
                London<br/>
                2015</span></p>
            </div>            
        </div>
        <div id="page-break">&#160;</div>
    </xsl:template>

    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Templates for generating the table of contents.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:head" mode="toc">
      <h2><a href="#{../@xml:id}"><xsl:apply-templates mode="toc"/></a></h2>        
    </xsl:template>        
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Template for generating endnotes.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:note" mode="endnotes">
        <xsl:if test="substring-after(@xml:id,'fn') = '1'">
           <h2><xsl:value-of select="../../tei:head"/></h2>                    
        </xsl:if>
        <div class="endnote">
            <div class="number"><a href="#{@xml:id}"><xsl:value-of select="substring-after(@xml:id,'fn')"/></a></div>
            <div class="note"><xsl:apply-templates/></div>
        </div>
    </xsl:template>  

    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Ascribe correct class to each type of div</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:div">            
                <div id="{@xml:id}" class="part">
                    <xsl:apply-templates/></div>
                <div class="page-break">&#160;</div>
    </xsl:template>

    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Make head tag in a div equivalent to an HTML heading based on what type of div it
                is</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:head">
            <hr class="part-divide"/>
            <h2><xsl:apply-templates/></h2>        
    </xsl:template>

    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Renditions</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:*[@rend = 'italic']"><span class="italic"><xsl:apply-templates/></span></xsl:template>
    <xsl:template match="tei:*[@rend = 'superscript']"><span class="sup"><xsl:apply-templates/></span></xsl:template>
    <xsl:template match="tei:add"><span class="sup"><xsl:apply-templates/></span></xsl:template>
    <xsl:template match="tei:del"><span class="del"><xsl:apply-templates/></span></xsl:template>
    <xsl:template match="tei:*[@rend = 'bold']"><span class="bold"><xsl:apply-templates/></span></xsl:template>
    <xsl:template match="tei:*[@rend = 'small-caps']"><span class="small-caps"><xsl:apply-templates/></span></xsl:template>      
    <xsl:template match="tei:*[@rend = 'catchword']"><span class="sup"><xsl:apply-templates/></span></xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Create an inline numbered footnote reference by parsing the xml:id. Put the note itself in a span that is hidden by default - the Javascript will unhide it on click.
                These notes are processed a second time as endnotes.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:note">
        <a href="javascript:;" onmousedown="toggle('n-{@xml:id}');" id="{@xml:id}" class="sup"><xsl:value-of select="substring-after(@xml:id,'fn')"/></a><span class="editor-note" id="n-{@xml:id}" style="display:none;"><xsl:apply-templates/><span class="close-editor-note"><a href="javascript:;" onmousedown="toggle('n-{@xml:id}');">[X]</a></span></span>
    </xsl:template>

      
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Handle paragraphs within notes. Because the superscript letter which acts as an anchor is the first part of the author note, we need a hack to insert it after the first paragraph tag, which we find by counting the paragaphs contained within the note div. Parse the anchor letter from the note's xml:id. Unanchored notes need to have their paragraph tags processed correctly, too. Editorial notes, meanwhile, go in span tags, so paragraph tags are not appropriate. Change them to a trailing br.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:note/tei:p">        
        <xsl:variable name="p-count">
            <xsl:number level="single" count="tei:p"/>
        </xsl:variable>
        <xsl:if test="../@type = 'editor'">
            <xsl:apply-templates/><br/>
        </xsl:if>
        <xsl:if test="../@type = 'author'">
        <xsl:choose>
            <xsl:when test="$p-count = '1'">
                <p class="first"><span class="sup"><xsl:value-of select="substring(../@xml:id,string-length(../@xml:id))"/></span>&#160;<xsl:apply-templates/></p>
            </xsl:when>
            <xsl:otherwise>
                <p><xsl:apply-templates/></p>
            </xsl:otherwise>
        </xsl:choose>
        </xsl:if>
        <xsl:if test="../@type = 'subnote'">
            <xsl:choose>
                <xsl:when test="$p-count = '1'">
                    <p class="first"><span class="sup italic"><xsl:value-of select="substring(../@xml:id,string-length(../@xml:id))"/></span>&#160;<xsl:apply-templates/></p>
                </xsl:when>
                <xsl:otherwise>
                    <p><xsl:apply-templates/></p>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>   
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Picks up a ptr element and assigns it to the note. If it's a subnote, makes it italic to differentiate</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:ptr">
        <xsl:choose>
            <xsl:when test="@type = 'subnote'">                
                <a href="#{@target}" class="sup italic"><xsl:value-of select="substring(@target,string-length(@target))"/></a>
            </xsl:when>
            <xsl:otherwise><a href="#{@target}" class="sup"><xsl:value-of select="substring(@target,string-length(@target))"/></a>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>       
        
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Subnote to an author note.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:note[@type = 'subnote']">
        <div class="tx-identifier" title="Location reference"><xsl:value-of select="@xml:id"/></div>
        <div id="{@xml:id}" class="subnote"><xsl:apply-templates/></div>
    </xsl:template>   
           
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Note with manuscript reference goes in its own div which is positioned absolutely by CSS</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:note[@type = 'ms']">
        <div class="ms-identifier" title="MS reference"><xsl:apply-templates/></div>
    </xsl:template>
   
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Transforms TEI ref element into a link element.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:ref[@type = 'external']">
        <a href="{@target}"><xsl:apply-templates/></a>
    </xsl:template>    
    <xsl:template match="tei:ref[@type = 'internal']">
        <a href="#{@target}"><xsl:apply-templates/></a>
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
            <xsl:when test="@rend = 'right' or @rend = 'end'">
                <p id="{../@xml:id}.p{$p-count}" class="right"><xsl:apply-templates/></p>
            </xsl:when>
            <xsl:when test="$p-count = '1' or @n = '1'">
                <p id="{../@xml:id}.p{$p-count}" class="first"><xsl:apply-templates/></p>
            </xsl:when>
            <xsl:when test="@rend = 'end'">
                <p id="{../@xml:id}.p{$p-count}" class="first"><xsl:apply-templates/></p>
            </xsl:when>  
            <xsl:when test="@rend = 'center'">
                <p id="{../@xml:id}.p{$p-count}" class="center"><xsl:apply-templates/></p>
            </xsl:when>
            <xsl:otherwise>
                <p id="{../@xml:id}.p{$p-count}"><xsl:apply-templates/></p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>For editorial versus authorial correction, choose editorial by default</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:corr">[<xsl:apply-templates/>]</xsl:template>
    <xsl:template match="tei:sic"><xsl:apply-templates/></xsl:template>   
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Other editorial interventions</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:gap">[...?]</xsl:template>
    <xsl:template match="tei:unclear"><xsl:apply-templates/>[?]</xsl:template>
    <xsl:template match="tei:q"><div class="quote"><xsl:apply-templates/></div></xsl:template>
    <xsl:template match="tei:q/tei:p"><p class="first"><xsl:apply-templates/></p></xsl:template>
    
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Turn TEI ordered lists into HTML lists. Eventually make this into a loop based on item
                element and value of parent element (list) attribute type (e.g. ordered)</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:list[@type = 'ordered']">
        <ol><xsl:apply-templates/></ol>
    </xsl:template>    
    <xsl:template match="tei:list[@type = 'ordered']/tei:item">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
    <xsl:template match="tei:table">        
        <table>      
            <xsl:apply-templates/>           
        </table>
    </xsl:template>
    
    <xsl:template match="tei:table/tei:row">          
        <tr><xsl:apply-templates/></tr>
    </xsl:template>
    
    <xsl:template match="tei:table/tei:row/tei:cell">
        <xsl:variable name="c-count">
            <xsl:number level="single" count="tei:cell"/>
        </xsl:variable>
        <td class="cell{$c-count}"><xsl:apply-templates/></td>
    </xsl:template>    

    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>lb to br</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:lb"><br><xsl:apply-templates/></br></xsl:template>
    <xsl:template match="tei:lb" mode="toc"><br><xsl:apply-templates mode="toc"/></br></xsl:template>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Mute the teiHeader</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="tei:teiHeader" />    
</xsl:stylesheet>
