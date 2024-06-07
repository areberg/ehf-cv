<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">

  <let name="ClearanceLevel" value="tokenize('TOPSECRET SECRET CONFIDENTIAL RESTRICTED')"/>
  <let name="EducationDegree" value="tokenize('0 1 2 3 4 5 6 7 8 9')"/>
  <let name="LanguageLevel" value="tokenize('A1 A2 B1 B2 C1 C2')"/>
  <let name="PoliceCertificate" value="tokenize('Ordinær Barneomsorgsattest Begrenset Uttømmende UttømmendeUtvidet')"/>
  <let name="ClassificationOccupation" value="tokenize('0 1 2 3 4 5 6 7 8 9')"/>
         
  <rule context="cv:Period">
      <assert id="EHF-CV-R001"
              test="(cv:StartDate) &lt;= (cv:EndDate)"
              flag="fatal">A period end date shall be later or equal to the period start date.</assert>
  </rule>

  <rule context="cv:Course">
      <assert id="EHF-CV-R002"
              test="(cv:Title) or (cv:Type)"
              flag="fatal">A course shall include either a title or a type.</assert>
  </rule>

  <rule context="cv:Certification">
      <assert id="EHF-CV-R003"
              test="(cv:Title) or (cv:Type)"
              flag="fatal">A Certification shall include either a title or a type.</assert>
  </rule>

  <rule context="cv:ExperienceDescription | cv:WorkExperienceDescription">
      <assert id="EHF-CV-R004"
              test="((cv:PositionPercent) &gt;= 0) and ((cv:PositionPercent) &lt;= 100)"
              flag="fatal">Position percent shall be a greater than or equal zero, and less than or
              equal 100.</assert>
  </rule>

  <rule context="cv:ExperienceValue">

      <assert id="EHF-CV-R005"
              test="number(cv:ProjectParticipation) &gt; 0"
              flag="fatal">Project participation shall be greater than zero.</assert>

      <assert id="EHF-CV-R006"
              test="number(cv:ProjectSize) &gt; 0"
              flag="fatal">Project size shall be greater than zero.</assert>

      <assert id="EHF-CV-R007"
              test="(cv:ProjectValue) &gt; 0"
              flag="fatal">The project value shall be greater than zero.</assert>
  </rule>

  <rule context="cv:Skills">
      <assert id="EHF-CV-R008"
              test="(cv:Title) or (cv:Type)"
              flag="fatal">A skill shall include either a title or a type.</assert>
      <assert id="EHF-CV-R009"
              test="(cv:MinimumLengthPractice) &gt;= 0"
              flag="fatal">Minimum length of practice shall be a greater than or equal zero.</assert>
  </rule>
         
  <rule context="cv:Clearance/cv:Level">
         <assert id="EHF-CV-R010"
                 test="(some $code in $ClearanceLevel satisfies $code = normalize-space(text()))"
                 flag="fatal">Value MUST be part of code list Clearance level code list'.</assert>
  </rule>
 
  <rule context="cv:Education/cv:EducationDegree">
         <assert id="EHF-CV-R011"
                 test="(some $code in $EducationDegree satisfies $code = normalize-space(text()))"
                 flag="fatal">Value MUST be part of code list Education degree code list'.</assert>
  </rule>
         
  <rule context="cv:LanguageSkills/cv:OralSkill">
         <assert id="EHF-CV-R012"
                 test="(some $code in $LanguageLevel satisfies $code = normalize-space(text()))"
                 flag="fatal">Value MUST be part of code list Language level code list'.</assert>
  </rule>
 
  <rule context="cv:LanguageSkills/cv:WrittenSkill">
         <assert id="EHF-CV-R013"
                 test="(some $code in $LanguageLevel satisfies $code = normalize-space(text()))"
                 flag="fatal">Value MUST be part of code list Language level code list'.</assert>
  </rule>
 
  <rule context="cv:PoliceCertificate/cv:Type">
         <assert id="EHF-CV-R014"
                 test="(some $code in $PoliceCertificate satisfies $code = normalize-space(text()))"
                 flag="fatal">Value MUST be part of code list Language level code list'.</assert>
  </rule> 
         
  <rule context="cv:WorkExperience/cv:PositionLevel">
         <assert id="EHF-CV-R015"
                 test="(some $code in $ClassificationOccupation satisfies $code = normalize-space(text()))"
                 flag="fatal">Value MUST be part of code list Classification of Occupations'.</assert>
  </rule>
         
  <rule context="cv:*">
      <assert id="EHF-COMMON-R001"
              test="normalize-space() != ''"
              flag="fatal">Document MUST not contain empty elements.</assert>
  </rule>
  
</pattern>
