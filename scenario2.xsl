<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:lh="urn:mycompany:language_holiday_agency">
  <xsl:output method="html"/>
  
  <!-- Define a key that matches language holidays by destination -->
  <xsl:key name="destinations" match="lh:language_holiday" use="lh:destination" />
  
  <!-- Define a key that matches clients by language holiday -->
  <xsl:key name="clients-by-holiday" match="lh:client" use="lh:language_holiday" />
  
  <!-- Define the template that matches the root node of the XML document -->
  <xsl:template match="/">
    <html>
      <body>
        <h2>Language Holiday Agency</h2>
        <table border="1">
          <!-- Start the table with column headers -->
          <tr>
            <th>Destination</th>
            <th>Languages</th>
            <th>Duration</th>
            <th>Language Classes</th>
            <th>Language Tests</th>
            <th>Activities</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Booked By</th>
          </tr>
          <!-- Loop through each language holiday that matches the destination "Spain" -->
          <xsl:for-each select="key('destinations', 'Spain')">
            <!-- Find all clients who have booked this holiday -->
            <xsl:variable name="holidayClients" select="key('clients-by-holiday', lh:destination)" />
            <!-- Generate a table row with information about the holiday and the first client who booked it -->
            <tr>
              <td rowspan="{count($holidayClients)}">
                <xsl:value-of select="lh:destination"/>
              </td>
              <td rowspan="{count($holidayClients)}">
                <xsl:value-of select="lh:languages"/>
              </td>
              <td rowspan="{count($holidayClients)}">
                <xsl:value-of select="lh:duration"/> weeks
              </td>
              <td rowspan="{count($holidayClients)}">
                <xsl:value-of select="lh:language_classes"/>
              </td>
              <td rowspan="{count($holidayClients)}">
                <xsl:value-of select="lh:language_tests"/>
              </td>
              <td rowspan="{count($holidayClients)}">
                <xsl:value-of select="lh:activities"/>
              </td>
              <td rowspan="{count($holidayClients)}">
                <xsl:value-of select="lh:dates/lh:start_date"/>
              </td>
              <td rowspan="{count($holidayClients)}">
                <xsl:value-of select="lh:dates/lh:end_date"/>
              </td>
              <td>
                <xsl:value-of select="$holidayClients[1]/lh:name"/> - <xsl:value-of select="$holidayClients[1]/lh:email"/>
              </td>
            </tr>
            <!-- Generate a table row for each additional client who booked the holiday -->
            <xsl:for-each select="$holidayClients[position() &gt; 1]">
              <tr>
                <td>
                  <xsl:value-of select="lh:name"/> - <xsl:value-of select="lh:email"/>
                </td>
              </tr>
            </xsl:for-each>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
