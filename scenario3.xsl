<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:lh="urn:mycompany:language_holiday_agency">

  <xsl:output method="html"/>

  <!-- Define the template that matches the root node of the XML document -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Language Holiday Agency show the first occurence</title>
      </head>
      <body>
        <!-- Display a heading for the page -->
        <h1>Language holidays for people who love Museum</h1>
        <table border='1'>
          <!-- Display table headers for the information we're going to show -->
          <tr>
            <th>Destination</th>
            <th>Languages</th>
            <th>Duration</th>
            <th>Language Classes</th>
            <th>Language Tests</th>
            <th>Activities</th>
            <th>Start Date</th>
            <th>End Date</th>
          </tr>
          <!-- Apply the language_holiday template to each holiday that has "Museum" listed as one of its activities -->
          <xsl:apply-templates select="//lh:language_holiday[lh:activities='Museum']"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <!-- Define the template that matches each language holiday that has "Museum" listed as one of its activities -->
  <xsl:template match="lh:language_holiday">
    <!-- Generate a table row with information about this language holiday -->
    <tr>
      <td><xsl:value-of select="lh:destination"/></td>
      <td><xsl:value-of select="lh:languages"/></td>
      <td><xsl:value-of select="lh:duration"/> weeks</td>
      <td><xsl:value-of select="lh:language_classes"/></td>
      <td><xsl:value-of select="lh:language_tests"/></td>
      <td><xsl:value-of select="lh:activities"/></td>
      <td><xsl:value-of select="lh:dates/lh:start_date"/></td>
      <td><xsl:value-of select="lh:dates/lh:end_date"/></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
