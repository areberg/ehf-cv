<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">

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

  <rule context="cv:Clearance">
      <assert id="EHF-CV-R008"
              test="(cv:Title) or (cv:Type)"
              flag="fatal">A clearance shall include either a title or a type.</assert>
  </rule>

  <rule context="cv:Skills">
      <assert id="EHF-CV-R009"
              test="(cv:Title) or (cv:Type)"
              flag="fatal">A skill shall include either a title or a type.</assert>
      <assert id="EHF-CV-R010"
              test="(cv:MinimumLengthPractice) &gt;= 0"
              flag="fatal">Minimum length of practice shall be a greater than or equal zero.</assert>
  </rule>

  <rule context="cv:PersonalSkills">
      <assert id="EHF-CV-R011"
              test="(cv:Title) or (cv:Type)"
              flag="fatal">A personal skill shall include either a title or a type.</assert>
  </rule>

  <rule context="cv:SocialMedia">
      <assert id="EHF-CV-R012"
              test="(cv:Title) or (cv:Type)"
              flag="fatal">A social media shall include either a title or a type.</assert>
  </rule>

</pattern>
