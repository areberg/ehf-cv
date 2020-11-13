<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:n1="urn:fdc:difi.no:2017:vefa:structure:Syntax-1"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:cv-req="urn:fdc:anskaffelser.no:2019:ehf:schema:CVRequest-1"
    version="2.0">

    <xsl:template match="processing-instruction('xml-stylesheet')"/>

    <xsl:template match="@* | node()">
        <xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="n1:Syntax/n1:Document">
        <xsl:param name="root" select="n1:Term"/>
        <xsl:element name="{$root}">
            <xsl:namespace name="cv-req">urn:fdc:anskaffelser.no:2019:ehf:schema:CVRequest-1</xsl:namespace>
            <xsl:apply-templates select="n1:Element"/>
        </xsl:element>

    </xsl:template>

    <xsl:template match="n1:Element[n1:Element]">
        <xsl:param name="tag" select="n1:Term"/>
        <xsl:element name="{$tag}">
            <xsl:apply-templates select="./n1:Element"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="n1:Element[n1:Value/@type='EXAMPLE'][not(n1:Attribute)]">
        <xsl:param name="tag" select="n1:Term"/>
        <xsl:element name="{$tag}">
            <xsl:value-of select="n1:Value[@type='EXAMPLE']"/>
        </xsl:element>
    </xsl:template>

   <xsl:template match="n1:Element[n1:Attribute]">
        <xsl:param name="tag" select="n1:Term"/>   
        <xsl:element name="{$tag}">
            <xsl:for-each select="n1:Attribute">
                <xsl:variable name="attr" select="n1:Term"/>
                <xsl:attribute name="{$attr}">
                    <xsl:value-of select="n1:Value[@type='EXAMPLE']"/>
                </xsl:attribute>
            </xsl:for-each>
            <xsl:value-of select="n1:Value[@type='EXAMPLE']"/>
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>
