<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:lh="urn:mycompany:language_holiday_agency">

  <xsl:output method="html"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Language Holiday Agency show the first occurence</title>
      </head>
      <body>
        <h1>Language holidays for people who love Museum</h1>
        <table border='1'>
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
          <xsl:apply-templates select="//lh:language_holiday[lh:activities='Museum']"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="lh:language_holiday">
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
