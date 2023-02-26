<!--
The XSL file matches the root element of the source document and generates an HTML document with information about each client and their holiday.
The HTML document includes the client's name, email, destination, languages, duration, language classes, language tests, activities, start date, end date, and their teacher's name.
The XSL file uses the xsl:template element to define how to transform each lha:client element in the source document into an HTML section.
The xsl:variable element is used to store information about the holiday and the teacher associated with each client.
The xsl:value-of element is used to extract and display data from the XML source document.
-->
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:lha="urn:mycompany:language_holiday_agency">

  <xsl:output method="html"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Language Holiday Agency</title>
      </head>
      <body>
        <h1>Language Holiday Agency</h1>
        <xsl:apply-templates select="//lha:client"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="lha:client">
    <xsl:variable name="holiday" select="//lha:language_holiday[lha:destination = current()/lha:language_holiday]"/>
    <xsl:variable name="teacher" select="//lha:teacher[lha:languages = $holiday/lha:languages]"/>
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
    <p>Teacher: <xsl:value-of select="$teacher/lha:name"/></p>
  </xsl:template>

</xsl:stylesheet>
