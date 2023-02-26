<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:lh="urn:mycompany:language_holiday_agency">
  <xsl:output method="html"/>

  <!-- Define the template that matches the root node of the XML document -->
  <xsl:template match="/">
    <html>
      <head>
        <title>French Teachers</title>
      </head>
      <body>
        <!-- Display headings for the page and the section on French teachers -->
        <h1>Language Holiday Agency</h1>
        <h2>French Teachers</h2>
        <table border='1'>
          <!-- Display table headers for the information we're going to show -->
          <tr>
            <th>Teacher Name</th>
            <th>Language</th>
            <th>Experience</th>
            <th>Certification</th>
          </tr>
          <!-- Apply the teacher template to each teacher that lists French as one of their languages -->
          <xsl:apply-templates select="//lh:teacher[lh:languages='French']"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <!-- Define the template that matches each teacher that lists French as one of their languages -->
  <xsl:template match="lh:teacher">
    <!-- Generate a table row with information about this French teacher -->
    <tr>
      <td><xsl:value-of select="lh:name"/></td>
      <td><xsl:value-of select="lh:languages"/></td>
      <td><xsl:value-of select="lh:experience"/> years</td>
      <td><xsl:value-of select="lh:certification"/></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
