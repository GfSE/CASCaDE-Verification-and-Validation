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
A further note is that it was needed to slightly modify the original reqIF file (from LONG-NAME="Title" to LONG-NAME="GroupTitle" and from LONG-NAME="Label" to LONG-NAME="GroupLabel")                  

Intermediate step -> |Requirements|SpecIF Tool|jasonLD|

Output -> |Requirements|CASCaRA Validation Tool|Turtle|

## Validation

*The submitted validation requirements shall give a first insight and can be précised after*
To validate the output, following requirements must be met:
1. REQ1: Data contained in the original reqIF file shall be also contained in the output ttl file 
2. REQ2: Entity, Relations and Instance Names & IDs shall not be modified when refIF is transformed into ttl
3. REQ3: No unnecessary information shall be added to the ttl file (e.g. repetitions) 

### Validation Criteria

*Provide a short description of the validation criteria you like to apply.*
 1. REQ1:
    a. Competency questions (CQs) shall be defined, to be as much as possible complete;
    b. Answers to CQs shall be provided (independently from the ttl file generation)
    b. CQs shall be executed and the answers shall be compared with the ones provided.
2. REQ2: How to check this?
3. REQ3: How to check this?

Competency questions shall be written in regular English, trying to be univocal in the meaning and resolvable. Univocal, meaning it shall be granted that the questions can be interpreted in a unique way, independently from the reader. Resolvable, meaning that the answer to the questions shall be contained in the input file provided, and who writes the questions shall have in mind a way to infer the answer from it.
Competency questions shall be written by someone knowing the original content (CS 25 available on the web).
Once Competency Questions are defined, they shall be translated into SPARQL code. This can be done by someone being familiar with the names of the entities and relationships defined in the input reqIF file.

As a first step, CQs can be just a few, and then added incrementally. 

### Validation Queries

*List of SPARQL competency questions to check completeness and consistence (Can the relevant information be retrieved from the graph?).*
CQ1: What are all the Requirements (or Interpretations), published in section X, subsection Y, that refer to a certain given Requirement/Interpretation?
CQ2: Which are all the Requirements (or Interpretations) that have as applicability date (or entry into force date) a date before (or after) a certain given date?

### Validation Results

*Query results (Has the validation been successful?)*

