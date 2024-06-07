<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">
     
  <let name="ClearanceLevel" value="tokenize('TOPSECRET SECRET CONFIDENTIAL RESTRICTED')"/>
  <let name="EducationDegree" value="tokenize('0 1 2 3 4 5 6 7 8 9')"/>
  <let name="LanguageLevel" value="tokenize('A1 A2 B1 B2 C1 C2')"/>
  <let name="PoliceCertificate" value="tokenize('Ordinær Barneomsorgsattest Begrenset Uttømmende UttømmendeUtvidet')"/>
  <let name="ClassificationOccupation" value="tokenize('0 1 2 3 4 5 6 7 8 9')"/>
  <let name="Requirement" value="tokenize('must should')"/>       
                
  <rule context="cv-req:Course | cv-req:Course/cv-req:AlternativeCourse">
      <assert id="EHF-CV-REQ-R001"
              test="(cv-req:Title) or (cv-req:Type)"
              flag="fatal">A course shall include either a title or a type.</assert>
  </rule>

  <rule context="cv-req:Period">
      <assert id="EHF-CV-REQ-R002"
              test="(cv-req:StartDate) &lt;= (cv-req:EndDate)"
              flag="fatal">A period end date shall be later or equal to the period start date.</assert>
  </rule>

  <rule context="cv-req:Certification | cv-req:AlternativeCertification">
      <assert id="EHF-CV-REQ-R003"
              test="(cv-req:Title) or (cv-req:Type)"
              flag="fatal">A Certification shall include either a title or a type.</assert>
  </rule>

  <rule context="cv-req:RequiredTotalExperience">
      <assert id="EHF-CV-REQ-R004"
              test="(cv-req:MaximumYearsExperience) &gt;= (cv-req:MinimumYearsExperience)"
              flag="fatal">Maximum years experience must be larger than minimum experience.</assert>
  </rule>

  <rule context="cv-req:ExperienceDescription | cv-req:WorkExperienceDescription">
      <assert id="EHF-CV-REQ-R005"
              test="((cv-req:PositionPercent) &gt;= 0) and ((cv-req:PositionPercent) &lt;= 100) "
              flag="fatal">Position percent shall be a greater than or equal zero, and less than or
              equal 100.</assert>
  </rule>

  <rule context="cv-req:ExperienceValue">
      <assert id="EHF-CV-REQ-R006"
              test="number(cv-req:ProjectParticipation) &gt; 0"
              flag="fatal">Project participation shall be greater than zero.</assert>

      <assert id="EHF-CV-REQ-R007"
              test="number(cv-req:ProjectSize) &gt; 0"
              flag="fatal">Project size shall be greater than zero.</assert>

      <assert id="EHF-CV-REQ-R008"
              test="(cv-req:ProjectValue) &gt; 0"
              flag="fatal">The project value shall be greater than zero.</assert>
  </rule>
  
  <rule context="cv-req:Clearance/cv-req:Level">
         <assert id="EHF-CV-REQ-R009"
                 test="(some $code in $ClearanceLevel satisfies $code = normalize-space(text()))"
                 flag="fatal">Value MUST be part of code list Clearance level'.</assert>
  </rule>
         
  <rule context="cv-req:Education/cv-req:EducationDegree">
         <assert id="EHF-CV-REQ-R010"
                 test="(some $code in $EducationDegree satisfies $code = normalize-space(text()))"
                 flag="fatal">Value MUST be part of code list Education degree'.</assert>
  </rule>
         
  <rule context="cv-req:Skills">
        <assert id="EHF-CV-REQ-R011"
                test="(cv-req:Tile) or (cv-req:Type)"
                flag="fatal">A skill shall include ´either a title or a type.</assert>
  </rule>

  <rule context="cv-req:SkillPractice">
      <assert id="EHF-CV-REQ-R012"
              test="(cv-req:MinimumLengthPractice) &gt;= 0"
              flag="fatal">Minimum length of practice shall be a greater than or equal zero.</assert>
  </rule>
  
  <rule context="cv-req:LanguageSkills/cv-req:OralSkill">
         <assert id="EHF-CV-REQ-R013"
                 test="(some $code in $LanguageLevel satisfies $code = normalize-space(text()))"
                 flag="fatal">Value MUST be part of code list Language level'.</assert>
  </rule>
         
  <rule context="cv-req:LanguageSkills/cv-req:WrittenSkill">
         <assert id="EHF-CV-REQ-R014"
                 test="(some $code in $LanguageLevel satisfies $code = normalize-space(text()))"
                 flag="fatal">Value MUST be part of code list Language level'.</assert>
  </rule>
         
  <rule context="cv-req:PoliceCertificate/cv-req:Type">
         <assert id="EHF-CV-REQ-R015"
                 test="(some $code in $PoliceCertificate satisfies $code = normalize-space(text()))"
                 flag="fatal">Value MUST be part of code list Police certificate'.</assert>
  </rule>
         
  <rule context="cv-req:WorkExperience/cv-req:PositionLevel">
         <assert id="EHF-CV-REQ-R016"
                 test="(some $code in $ClassificationOccupation satisfies $code = normalize-space(text()))"
                 flag="fatal">Value MUST be part of code list Classification of Occupations'.</assert>
  </rule>
          
  <rule context="cv-req:Requirement">
         <assert id="EHF-CV-REQ-R017"
                 test="(some $code in $Requirement satisfies $code = normalize-space(text()))"
                 flag="fatal">Value MUST be part of code list Requirement'.</assert>
  </rule>
                 
  <rule context="cv-req:*">
       <assert id="EHF-COMMON-R003"
               test="normalize-space() != ''"
               flag="fatal">Document MUST not contain empty elements.</assert>
  </rule>
         
</pattern>
