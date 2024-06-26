<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">

    <rule context="cv-req:*">
        <assert id="EHF-COMMON-R003"
                test="normalize-space() != ''"
                flag="fatal">Document MUST not contain empty elements.</assert>
        <assert id="EHF-COMMON-R004"
                test="every $attr in @* satisfies normalize-space($attr) != ''"
                flag="warning">Attributes MUST contain value.</assert>
    </rule>
</pattern>
