<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">

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

  <rule context="cv-req:Certification | cv-req:Certification/cv-req:AlternativeCertification">
      <assert id="EHF-CV-REQ-R003"
              test="(cv-req:Title) or (cv-req:Type)"
              flag="fatal">A Certification shall include either a title or a type.</assert>
  </rule>

  <rule context="cv-req:ProjectExperience/cv-req:RequiredTotalExperience |
  cv-req:ProjectExperience/cv:req:AlternativeProjectExperience/cv-req:RequiredTotalExperience">
      <assert id="EHF-CV-REQ-R004"
              test="(cv-req:MinimumExperience) &lt; (cv-req:MaximumExperience)"
              flag="fatal">Maximum experience must be larger than minimum experience.</assert>
  </rule>

  <rule context="cv-req:ExperienceDescription|cv-req:WorkExperienceDescription">
      <assert id="EHF-CV-REQ-R005"
              test="((cv-req:PositionPercent) &gt;= 0) and ((cv-req:PositionPercent) &lt;= 100) "
              flag="fatal">Position percent shall be a greater than or equal zero, and less than or
              equal 100.</assert>
  </rule>

  <rule context="cv-req:ProjectExperience/cv-req:ExperienceValue |
  cv-req:ProjectExperience/cv-req:AlternativeProjectExperience/cv-req:ExperienceValue">

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

  <rule context="cv-req:Clearance | cv-req:Clearance/cv-req:AlternativeClearance">
      <assert id="EHF-CV-REQ-R009"
              test="(cv-req:Title) or (cv-req:Type)"
              flag="fatal">A clearance shall include either a title or a type.</assert>
  </rule>

  <rule context="cv-req:Reference">
      <assert id="EHF-CV-REQ-R010"
              test="(cv-req:MinimumTotalReference) &gt; 0"
              flag="fatal">Total minimum reference number shall be greater than zero.</assert>
  </rule>

  <rule context="cv-req:Skills | cv-req:Skills/cv-req:AlternativeSkills">
      <assert id="EHF-CV-REQ-R011"
              test="(cv-req:Title) or (cv-req:Type)"
              flag="fatal">A skill shall include either a title or a type.</assert>
  </rule>

  <rule context="cv-req:Skills/cv-req:SkillPractice | cv-req:Skills/cv-req:AlternativeSkills/cv-req:SkillPractice">
      <assert id="EHF-CV-REQ-R012"
              test="(cv-req:MinimumLengthPractice) &gt;= 0"
              flag="fatal">Minimum length of practice shall be a greater than or equal zero.</assert>
  </rule>

  <rule context="cv-req:PersonalSkills">
      <assert id="EHF-CV-REQ-R013"
              test="(cv-req:Title) or (cv-req:Type)"
              flag="fatal">A personal skill shall include either a title or a type.</assert>
  </rule>

</pattern>
