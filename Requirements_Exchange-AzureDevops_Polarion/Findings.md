# Findings – CASCaRA ReqIF / SpecIF Tryout

Date: October 7th


## Scope
Test system: Polarion 

Objective: Evaluate whether requirements and traceability information can be transferred from Polarion to CASCaRA using ReqIF / SpecIF.

## Findings

### Successful Results
- Polarion ReqIF export was successful.
- Polarion generates a ReqIFZ container.
- ReqIFZ could be renamed to ZIP and extracted successfully.
- The extracted ReqIF file could be processed by CASCaRA.
- The extracted ReqIF file could also be used for SpecIF processing.
- SpecIF correctly distinguished between resource types such as Heading and Requirement.
- In the CASCaRA Validation Tool, imported artifacts were represented as `cas:anEntity`.
- Headings and Requirements were differentiated by their assigned Class.

### Open Findings
- Direct import of ReqIFZ is currently not supported in the tested workflow.
- Traceability between EPH and EDS artifacts could not yet be demonstrated.
- The generated CASCaRA XML contains entities and classes.
- No explicit relationship instances were identified during the current analysis.
- It remains unclear whether trace links are lost during export, transformation, or import.

## Improvement Potential

### Direct ReqIFZ Support
The CASCaRA import workflow should support ReqIFZ containers directly, as ReqIFZ is a common export format from Polarion.


