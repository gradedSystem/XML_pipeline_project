<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:lh="urn:mycompany:language_holiday_agency">

  <xsl:output method="html" indent="yes"/>

  <!-- This template matches the root node of the XML document -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Language Holiday Agency</title>
      </head>
      <body>
        <!-- The main heading of the page -->
        <h1>Language Holiday Agency</h1>
		
		<!-- The table of all the teachers and the languages they teach -->
		<h2>Teachers and their languages</h2>
		<table border="1">
          <tr>
            <th>Teacher Name</th>
            <th>Languages Taught</th>
          </tr>
          <!-- Loop through all the teachers and create a row for each -->
          <xsl:for-each select="//lh:teacher">
            <tr>
              <td><xsl:value-of select="lh:name"/></td>
              <td><xsl:value-of select="lh:languages"/></td>
            </tr>
          </xsl:for-each>
        </table>
		
        <!-- The table of all the clients and their bookings -->
        <h2>Clients and their bookings</h2>
        <table border="1">
          <tr>
            <th>Client Name</th>
            <th>Email</th>
            <th>Destination</th>
            <th>Languages</th>
            <th>Duration</th>
            <th>Language Classes</th>
            <th>Language Tests</th>
            <th>Activities</th>
            <th>Start Date</th>
            <th>End Date</th>
          </tr>
          <!-- Loop through all the clients and create a row for each booking -->
          <xsl:for-each select="//lh:client">
            <!-- Store the name, email and holiday information of the client in variables -->
            <xsl:variable name="clientName" select="lh:name"/>
            <xsl:variable name="clientEmail" select="lh:email"/>
            <xsl:variable name="clientHoliday" select="//lh:language_holiday[lh:destination=current()/lh:language_holiday]"/>
            <tr>
              <td><xsl:value-of select="$clientName"/></td>
              <td><xsl:value-of select="$clientEmail"/></td>
              <td><xsl:value-of select="$clientHoliday/lh:destination"/></td>
              <td><xsl:value-of select="$clientHoliday/lh:languages"/></td>
              <td><xsl:value-of select="$clientHoliday/lh:duration"/> days</td>
              <td><xsl:value-of select="$clientHoliday/lh:language_classes"/></td>
              <td><xsl:value-of select="$clientHoliday/lh:language_tests"/></td>
              <td><xsl:value-of select="$clientHoliday/lh:activities"/></td>
              <td><xsl:value-of select="$clientHoliday/lh:dates/lh:start_date"/></td>
              <td><xsl:value-of select="$clientHoliday/lh:dates/lh:end_date"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
