# Customer Use Case / Test Case Description

## Use Case Owner

*Collins Aerospace*

## Contact

*Cecilia Tonelli, cecilia.tonelli@collins.com*

## Special Conditions

*Submitted data can be used after formal request to Cecilia Tonelli*

## Business Use Case

*Use case: Transform requirements from reqIF format to ttl format. Benefits: possibility of merge requirements with other data in ttl data, possibility to reason on data, possibility to query data.*

### Related Use Case

*Not known*

## Data Formats and Associated Tools

Input data is the CS 25 from EASA, that is the list of regulatory requirements that apply to Large Airplanes. The list of requirement is publicly available online in different formats, e.g. pdf and xml (see https://www.easa.europa.eu/en/document-library/easy-access-rules/easy-access-rules-large-aeroplanes-cs-25). 
In the context of CONCERTO EU project, the xml format has been transformed into reqIF format (in particular, by Dassault Aviation, a CONCERTO project partner). This file is the input of this CASCaRA validation example.
Description (content) of the input data, the format and the authoring tool.
Source data \[transformation of standard data formats --> graph data]

Input -> |Requirements|ReqIF|Dassault Aviation tool|

Output data is in the CS 25 data in ttl format. To achieve this, two steps were taken:
1. The input CS 25 reqIF file was transformed into cas.jasonld format using Tool https://specif.de/apps-alpha/edit was used.
2. CS 25 cas.jasonld file was transformed into ttl file using CASCaRA Validation Tool https://app-alpha.product-information-graph.org/interfaces
Two steps were needed, since the original file was too big for the CASCaRA Validation Tool.
A further note is that it was needed to slightly modify the original reqIF file (see the bolded parts below)

<ATTRIBUTE-DEFINITION-STRING DESC="Label" IS-EDITABLE="true" IDENTIFIER="idLabel1" LAST-CHANGE="2026-02-24T16:47:22.4536074+01:00" LONG-NAME="**Group**Label">
                     <TYPE>
                        <DATATYPE-DEFINITION-STRING-REF>datatype2</DATATYPE-DEFINITION-STRING-REF>
                     </TYPE>
                  </ATTRIBUTE-DEFINITION-STRING>
<ATTRIBUTE-DEFINITION-STRING DESC="Title" IS-EDITABLE="true" IDENTIFIER="idTitle1" LAST-CHANGE="2026-02-24T16:47:22.4536074+01:00" LONG-NAME="**Group**Title">
                     <TYPE>
                        <DATATYPE-DEFINITION-STRING-REF>datatype2</DATATYPE-DEFINITION-STRING-REF>
                     </TYPE>
                  </ATTRIBUTE-DEFINITION-STRING>
                  

Intermediate step -> |Requirements|SpecIF Tool|jasonLD|
Output -> |Requirements|CASCaRA Validation Tool|Turtle|

## Validation

*The submitted validation requirements shall give a first insight and can be précised after*

### Validation Criteria

*Provide a short description of the validation criteria you like to apply.*

### Validation Queries

*List of SPARQL competency questions to check completeness and consistence (Can the relevant information be retrieved from the graph?).*

### Validation Results

*Query results (Has the validation been successful?)*

