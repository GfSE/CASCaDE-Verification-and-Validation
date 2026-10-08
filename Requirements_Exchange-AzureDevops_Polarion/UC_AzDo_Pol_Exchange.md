# CASCaRA WP5 – Requirement Verification Use Case

# Use Case Overview

## Title

Bidirectional Synchronization of Requirements Between Azure DevOps and Polarion

## Purpose

This use case demonstrates how requirements managed in Azure DevOps and Polarion can be semantically integrated using the CASCaRA Product Information Graph.

The objective is to evaluate whether requirements, metadata, traceability relationships, and verification information can be exchanged consistently while preserving meaning, structure, and traceability across heterogeneous engineering tools.

---

# Use Case Owner

Authoring Company

---

# Special Conditions

This use case description is intentionally vendor-neutral with respect to organizational context and excludes:

- Proprietary business information
- Confidential project data
- Customer data
- Product-specific information
- Internal identifiers
- Personal information

All datasets used during validation may be synthetic, anonymized, or publicly available.

---

# Business Use Case

## Background

Engineering organizations in different departments often use multiple tools for requirements and lifecycle management.

In many environments:

- Requirements are distributed across different repositories.
- Traceability becomes fragmented.
- Synchronization requires manual effort.
- Data consistency is difficult to maintain.

A semantic interoperability layer based on the CASCaRA Product Information Graph provides a common representation that allows engineering information to be exchanged while preserving meaning and relationships between artifacts.

---

# Scope

The use case focuses on:

- Requirement exchange
- Metadata exchange
- Relationship preservation
- Traceability management
- Change synchronization
- Consistency validation

The use case does not cover:

- Source code synchronization
- Continuous integration pipelines
- Manufacturing systems
- Enterprise resource planning systems
- Product-specific engineering models

---

# System Landscape

## Source System

### Azure DevOps

Managed artifacts include:

- Epics
- Features
- User Stories
- Requirements
- Work Items
- Test Cases

Typical exchange formats:

- JSON
- REST API

---

## Target System

### Polarion

Managed artifacts include:

- Stakeholder Requirements
- System Requirements
- Software Requirements
- Verification Requirements
- Test Cases

Typical exchange formats:

- ReqIF

---

## Semantic Integration Layer

### CASCaRA Product Information Graph

Purpose:

- Semantic interoperability
- Information integration
- Traceability preservation
- Consistency validation
- Cross-tool analysis

The Product Information Graph acts as a tool-independent representation of engineering information.

---

# Process Description

## Step 1 – Extract

Requirements are exported from Azure DevOps.

## Step 2 – Transform

Exported artifacts are transformed into CASCaRA-compliant graph entities.

## Step 3 – Ingest

Entities and relationships are stored in the Product Information Graph.

## Step 4 – Reconstruct

Graph entities are transformed into the Polarion representation.

## Step 5 – Import

Requirements are imported into Polarion.

## Step 6 – Reverse Synchronization

The same workflow is executed in the opposite direction, allowing information to flow from Polarion back to Azure DevOps.

---

# Information Model

## Requirement Attributes

The following information should be preserved during transformation:

- Identifier
- Name
- Title
- Description
- Status
- Priority
- Author
- Creation Date
- Modification Date
- Version
- Classification

---

## Relationship Types

Examples include:

- refines
- derivesFrom
- dependsOn
- satisfies
- verifies
- tracesTo
- impacts
- relatesTo

---

# Conceptual Mapping

| Azure DevOps | CASCaRA Concept | Polarion |
|--------------|-----------------|-----------|
| Epic | Requirement Collection | Requirement Set |
| Feature | Requirement Group | Requirement Group |
| User Story | Requirement | Requirement |
| Work Item | Requirement Artifact | Work Item |
| Test Case | Verification Artifact | Test Case |

The mapping serves as a conceptual example and may be adapted depending on project-specific data models.

---

# Data Exchange Objectives

The following objectives shall be evaluated:

1. Preservation of requirement semantics.
2. Preservation of identifiers and metadata.
3. Preservation of traceability relationships.
4. Detection of inconsistencies.
5. Reconstruction of tool-specific representations.
6. Completeness of exchanged information.
7. Support for bidirectional synchronization.

---

# Validation Criteria

The validation is considered successful if:

- Mandatory attributes are preserved.
- Traceability links remain available.
- Relationships remain consistent.
- Identifiers remain unique.
- Information can be reconstructed correctly.
- No unintended information loss occurs.
- Synchronization results are reproducible.
- Status network is persistent

---

# Validation Queries

## Query 1 – List All Requirements

```sparql
SELECT ?req
WHERE {
    ?req rdf:type cascara:Requirement .
}
```

---

## Query 2 – Requirements Without Identifiers

```sparql
SELECT ?req
WHERE {
    ?req rdf:type cascara:Requirement .
    FILTER NOT EXISTS {
        ?req cascara:identifier ?id .
    }
}
```

---

## Query 3 – Requirements Without Traceability Links

```sparql
SELECT ?req
WHERE {
    ?req rdf:type cascara:Requirement .
    FILTER NOT EXISTS {
        ?req cascara:tracesTo ?other .
    }
}
```

---

## Query 4 – Traceability Relationships

```sparql
SELECT ?source ?target
WHERE {
    ?source cascara:tracesTo ?target .
}
```

---

## Query 5 – Modified Requirements

```sparql
SELECT ?req ?timestamp
WHERE {
    ?req cascara:lastModified ?timestamp .
}
```

---

# Expected Results

The validation should demonstrate:

- Semantic interoperability between Azure DevOps and Polarion.
- Preservation of requirement meaning across transformations.
- Tool-independent traceability.
- Consistent information exchange.
- Support for graph-based engineering integration.
- Applicability of the CASCaRA Product Information Graph approach.

---

# Success Indicators

The use case is considered successful when:

- Requirements can be exchanged in both directions.
- Traceability relationships remain available after transformation.
- No critical information is lost.
- Validation queries return expected results.
- Tool-specific views can be reconstructed from the graph representation.