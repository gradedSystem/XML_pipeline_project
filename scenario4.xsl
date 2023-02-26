<!--
The XSL file matches the root element of the source document and generates an HTML table with information about French language teachers.
The table has several columns for information about each teacher, including their name, language, experience, and certification.
The XSL file uses the xsl:apply-templates element to select and transform lh:teacher elements that teach French.
The XSL file uses the xsl:template element to define how to transform each selected lh:teacher element into an HTML table row.
The xsl:template element uses xsl:value-of to extract and display data from the XML source document.
-->
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:lh="urn:mycompany:language_holiday_agency">
  <xsl:output method="html"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>French Teachers</title>
      </head>
      <body>
        <h1>Language Holiday Agency</h1>
        <h2>French Teachers</h2>
        <table border='1'>
          <tr>
            <th>Teacher Name</th>
            <th>Language</th>
            <th>Experience</th>
            <th>Certification</th>
          </tr>
          <xsl:apply-templates select="//lh:teacher[lh:languages='French']"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="lh:teacher">
    <tr>
      <td><xsl:value-of select="lh:name"/></td>
      <td><xsl:value-of select="lh:languages"/></td>
      <td><xsl:value-of select="lh:experience"/> years</td>
      <td><xsl:value-of select="lh:certification"/></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
