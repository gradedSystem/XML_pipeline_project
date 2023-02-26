<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:lha="urn:mycompany:language_holiday_agency">

  <!-- specify the output format -->
  <xsl:output method="html"/>

  <!-- main template to match the root node -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Language Holiday Agency</title>
      </head>
      <body>
        <h1>Language Holiday Agency</h1>
        <!-- apply templates to all client nodes -->
        <xsl:apply-templates select="//lha:client"/>
      </body>
    </html>
  </xsl:template>

  <!-- template to match the client nodes -->
  <xsl:template match="lha:client">
    <!-- get the holiday corresponding to the current client -->
    <xsl:variable name="holiday" select="//lha:language_holiday[lha:destination = current()/lha:language_holiday]"/>
    <!-- get the teacher with the same language as the holiday -->
    <xsl:variable name="teacher" select="//lha:teacher[lha:languages = $holiday/lha:languages]"/>
    <!-- display client information -->
    <h2><xsl:value-of select="lha:name"/></h2>
    <p>Email: <xsl:value-of select="lha:email"/></p>
    <p>Holiday in <xsl:value-of select="$holiday/lha:destination"/> (<xsl:value-of select="$holiday/lha:languages"/>)</p>
    <ul>
      <li>Duration: <xsl:value-of select="$holiday/lha:duration"/> days</li>
      <li>Classes: <xsl:value-of select="$holiday/lha:language_classes"/></li>
      <li>Tests: <xsl:value-of select="$holiday/lha:language_tests"/></li>
      <li>Activities: <xsl:value-of select="$holiday/lha:activities"/></li>
      <li>Start date: <xsl:value-of select="$holiday/lha:dates/lha:start_date"/></li>
      <li>End date: <xsl:value-of select="$holiday/lha:dates/lha:end_date"/></li>
    </ul>
    <!-- display teacher information -->
    <p>Teacher: <xsl:value-of select="$teacher/lha:name"/></p>
  </xsl:template>

</xsl:stylesheet>
