<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:lh="urn:mycompany:language_holiday_agency">

  <!-- Set the output method to HTML -->
  <xsl:output method="html"/>

  <!-- Define the template that matches the root node of the XML document -->
  <xsl:template match="/">
    <html>
      <head>
        <!-- Set the title of the HTML page -->
        <title>Language Holiday Agency show the first occurence</title>
      </head>
      <body>
        <!-- Add the agency name to the top of the page -->
        <h1>Language Holiday Agency</h1>
        <!-- Start the HTML table with column headers -->
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
          <!-- Apply the template that matches each client element -->
          <xsl:apply-templates select="//lh:client"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <!-- Define the template that matches each client element -->
  <xsl:template match="lh:client">
    <!-- Find the language holiday that matches the current client's destination -->
    <xsl:variable name="client_holiday" select="//lh:language_holiday[lh:destination=current()/lh:language_holiday]"/>
    <!-- Generate a table row with information about the client's language holiday -->
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
