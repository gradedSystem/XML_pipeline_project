<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:lh="urn:mycompany:language_holiday_agency"
                exclude-result-prefixes="lh">
  <xsl:output method="text"/>
  
  <!-- Match the root element and start the JSON object -->
  <xsl:template match="lh:language_holiday_agency">
    {
      "language_holidays": [
        <xsl:apply-templates select="lh:language_holidays/lh:language_holiday"/>
      ]
    }
  </xsl:template>
  
  <!-- Match each language holiday element and create a JSON object for it -->
  <xsl:template match="lh:language_holiday">
    {
      "destination": "<xsl:value-of select="lh:destination"/>",
      "languages": "<xsl:value-of select="lh:languages"/>",
      "duration": <xsl:value-of select="lh:duration"/>,
      "language_classes": "<xsl:value-of select="lh:language_classes"/>",
      "language_tests": "<xsl:value-of select="lh:language_tests"/>",
      "activities": "<xsl:value-of select="lh:activities"/>",
      "dates": {
        "start_date": "<xsl:value-of select="lh:dates/lh:start_date"/>",
        "end_date": "<xsl:value-of select="lh:dates/lh:end_date"/>"
      },
      "teacher": "<xsl:value-of select="substring-after(lh:language_classes, ' ')"/>"
    }
    <xsl:if test="position() != last()">,</xsl:if>
  </xsl:template>
  
</xsl:stylesheet>
