<!--
The xsl:stylesheet element has two namespaces defined: xsl for the XSLT namespace and lh for a custom namespace.
The output format is set to HTML using the xsl:output element.
The file contains two templates: one to match the root element of the source document, and another to match the lh:client element in the source document.
The root template generates an HTML document with a table that displays information about each lh:client element in the source document.
The lh:client template generates a row in the table with information about the lh:language_holiday element that has the same destination as the current lh:client element.
-->

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
        <h1>Language Holiday Agency</h1>
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
          <xsl:apply-templates select="//lh:client"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="lh:client">
    <xsl:variable name="client_holiday" select="//lh:language_holiday[lh:destination=current()/lh:language_holiday]"/>
    <tr>
      <td><xsl:value-of select="$client_holiday/lh:destination"/></td>
      <td><xsl:value-of select="$client_holiday/lh:languages"/></td>
      <td><xsl:value-of select="$client_holiday/lh:duration"/> days</td>
      <td><xsl:value-of select="$client_holiday/lh:language_classes"/></td>
      <td><xsl:value-of select="$client_holiday/lh:language_tests"/></td>
      <td><xsl:value-of select="$client_holiday/lh:activities"/></td>
      <td><xsl:value-of select="$client_holiday/lh:dates/lh:start_date"/></td>
      <td><xsl:value-of select="$client_holiday/lh:dates/lh:end_date"/></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
