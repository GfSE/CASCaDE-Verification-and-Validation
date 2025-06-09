{
  "@context": {
    "@base": "https://product-information-graph.org/examples/Dimmer.specifz",
    "rdf:": "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
    "rdfs:": "http://www.w3.org/2000/01/rdf-schema#",
    "owl:": "http://www.w3.org/2002/07/owl#",
    "sh:": "https://www.w3.org/ns/shacl",
    "W3C:": "https://www.w3.org/standards/semanticweb#",
    "xs:": "http://www.w3.org/2001/XMLSchema#",
    "xsd:": "http://www.w3.org/2001/XMLSchema#",
    "dcterms:": "http://purl.org/dc/terms/",
    "dc:": "http://purl.org/dc/elements/1.1/",
    "schema:": "https://schema.org#",
    "iana:": "https://www.iana.org/assignments/media-types#",
    "foaf:": "http://xmlns.com/foaf/0.1/",
    "FMC:": "http://fmc-modeling.org#",
    "IR:": "https://www.adesso.de/de/impulse/interaction-room/index.jsp#",
    "IREB:": "https://www.ireb.org/en/downloads/#cpre-glossary",
    "ReqIF:": "https://www.prostep.org/fileadmin/downloads/PSI_ImplementationGuide_ReqIF_V1-7.pdf#",
    "ReqIF-WF:": "https://www.prostep.org/fileadmin/downloads/Recommendation_ReqIF_V2_RZ3.pdf#",
    "HIS:": "https://www.itwissen.info/Herstellerinitiative-Software-Automotive-HIS.html#",
    "oslc:": "http://open-services.net/ns/core#",
    "oslc_rm:": "http://open-services.net/ns/rm#",
    "oslc_cm:": "http://open-services.net/ns/cm#",
    "ArchiMate:": "https://pubs.opengroup.org#",
    "bpmn:": "https://www.bpmn.org/#",
    "uml:": "https://www.omg.org/spec/UML#",
    "sysml:": "https://www.omg.org/spec/SysML#",
    "pig:": "https://product-information-graph.org",
    "DDP:": "http://www.prostep.org/dictionary/2.0#",
    "SpecIF:": "https://specif.de/v1.1/schema#"
  },
  "@type": "pig:Product",
  "@id": "#ACP-59c8a7730000bca80137509a49b1218b",
  "dcterms:title": [
    {
      "text": "Dimmer - Semantically Integrated Specification (2021-01-28)"
    }
  ],
  "dcterms:description": "This specification method integrates and represents:\n- processes, system composition and requirements (dynamic, static and detail views)\n- mechanic, electric and software components with their interfaces.\n\nIt is important to understand, that all plans (diagrams) are views of a common system engineering model, sometimes called 'system repository'. Thus, consistency is always maintained.\n\nThe model elements are connected with relations, most of which are defined by positioning graph elements. For example, if a system component is drawn within another, a relationship 'contains' is created in the logic representation of the engineering model. Other relations, such as a system component 'satisfies' a requirement are created manually.  \n\nAlso, the documents are generated from the system engineering model. The ordering is in most projects (it can be rearranged, however, if appropriate):\n- All plans\n- A glossary with descriptions of all model elements appearing on one or more plans\n- A hierarchically ordered list of requirements\n- A list of open issues.\nPlease note that plans list related model elements and model elements list related requirements .. and vice versa. Active hyper-links are used, so that it is easy to jump between related model elements.\n\nFurther information is given in Appendix 'Method'.",
  "dcterms:modified": "2025-06-09T07:17:28.425Z",
  "@graph": [
    {
      "@id": "#PC-Name",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "rdfs:label",
      "dcterms:description": null,
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1",
      "xs:maxLength": 256
    },
    {
      "@id": "#PC-Description",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "rdfs:comment",
      "dcterms:description": null,
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1"
    },
    {
      "@id": "#PC-Diagram",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2023-02-26T14:40:17.601Z",
      "dcterms:title": "SpecIF:Diagram",
      "dcterms:description": "One or more diagrams illustrating the resource.",
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "unbounded"
    },
    {
      "@id": "#PC-Pln-Notation",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:Notation",
      "dcterms:description": null,
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1",
      "xs:maxLength": 256
    },
    {
      "@id": "#PC-Priority",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:Priority",
      "dcterms:description": null,
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1"
    },
    {
      "@id": "#PC-Status",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:LifecycleStatus",
      "dcterms:description": null,
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1"
    },
    {
      "@id": "#PC-SupplierStatus",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "ReqIF-WF.SupplierStatus",
      "dcterms:description": null,
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1"
    },
    {
      "@id": "#PC-SupplierComment",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "ReqIF-WF.SupplierComment",
      "dcterms:description": null,
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1"
    },
    {
      "@id": "#PC-OemStatus",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "ReqIF-WF.CustomerStatus",
      "dcterms:description": null,
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1"
    },
    {
      "@id": "#PC-OemComment",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "ReqIF-WF.CustomerComment",
      "dcterms:description": null,
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1"
    },
    {
      "@id": "#PC-VisibleId",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "dcterms:identifier",
      "dcterms:description": null,
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1",
      "xs:maxLength": 256
    },
    {
      "@id": "#PC-Perspective",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:StakeholderGroup",
      "dcterms:description": null,
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1"
    },
    {
      "@id": "#PC-Discipline",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:EngineeringDiscipline",
      "dcterms:description": null,
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "unbounded"
    },
    {
      "@id": "#PC-IssueStatus",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:LifecycleStatus",
      "dcterms:description": null,
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1"
    },
    {
      "@id": "#PC-Responsible",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:Responsible",
      "dcterms:description": null,
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1",
      "xs:maxLength": 256
    },
    {
      "@id": "#PC-DueDate",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:DueDate",
      "dcterms:description": null,
      "sh:datatype": "xs:dateTime",
      "sh:minCount": "0",
      "sh:maxCount": "1"
    },
    {
      "@id": "#PC-Type",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2023-02-26T20:18:04.451Z",
      "dcterms:title": "dcterms:type",
      "dcterms:description": "<p>The nature or genre of the resource. <small>(<i>source: <a href=\"http://purl.org/dc/elements/1.1/type\">DCMI</a></i>)</small></p><p>Recommended best practice is to use a controlled vocabulary such as the DCMI Type Vocabulary [DCMITYPE]. To describe the file format, physical medium, or dimensions of the resource, use the Format element.</p><p>For example, a [[FMC:Actor]] may represent a <i>System Function</i>, a <i>System Component</i> or a <i>User Role</i>. Similarly, in the context of process modelling, a FMC:Actor may represent a <i>Process Step</i> or again a <i>User Role</i>. So, all of these are meaningful values for a FMC:Actor's property named dcterms:type.</p>",
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1",
      "xs:maxLength": 32
    },
    {
      "@id": "#RC-Folder",
      "@type": "pig:entityClass",
      "dcterms:modified": "2024-03-02T15:28:50.414Z",
      "dcterms:title": "SpecIF:Heading",
      "dcterms:description": "A 'Heading' is a chapter title at any level with optional description.",
      "pig:specializes": "#RC-Paragraph"
    },
    {
      "@id": "#RC-View",
      "@type": "pig:organizerClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "pig:View",
      "dcterms:description": "A 'Diagram' is a graphical model view with a specific communication purpose, e.g. a business process or system composition.",
      "pig:eligiblePropertyClass": [
        "#PC-Name",
        "#PC-Description",
        "#PC-Diagram",
        "#PC-Pln-Notation",
        "#PC-Status",
        "#PC-SupplierStatus",
        "#PC-SupplierComment",
        "#PC-OemStatus",
        "#PC-OemComment"
      ]
    },
    {
      "@id": "#RC-Actor",
      "@type": "pig:entityClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "FMC:Actor",
      "dcterms:description": "An 'Actor' is a fundamental model element type representing an active entity, be it an activity, a process step, a function, a system component or a role.",
      "pig:eligiblePropertyClass": [
        "#PC-Name",
        "#PC-Description",
        "#PC-Diagram"
      ]
    },
    {
      "@id": "#RC-State",
      "@type": "pig:entityClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "FMC:State",
      "dcterms:description": "A 'State' is a fundamental model element type representing a passive entity, be it a value, a condition, an information storage or even a physical shape.",
      "pig:eligiblePropertyClass": [
        "#PC-Name",
        "#PC-Description"
      ]
    },
    {
      "@id": "#RC-Event",
      "@type": "pig:entityClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "FMC:Event",
      "dcterms:description": "An 'Event' is a fundamental model element type representing a time reference, a change in condition/value or more generally a synchronisation primitive.",
      "pig:eligiblePropertyClass": [
        "#PC-Name",
        "#PC-Description"
      ]
    },
    {
      "@id": "#RC-Requirement",
      "@type": "pig:entityClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "IREB:Requirement",
      "dcterms:description": "A 'Requirement' is a singular documented physical and functional need that a particular design, product or process must be able to perform.",
      "pig:eligiblePropertyClass": [
        "#PC-VisibleId",
        "#PC-Name",
        "#PC-Description",
        "#PC-Status",
        "#PC-Priority",
        "#PC-Perspective",
        "#PC-Discipline",
        "#PC-SupplierStatus",
        "#PC-SupplierComment",
        "#PC-OemStatus",
        "#PC-OemComment"
      ]
    },
    {
      "@id": "#RC-Issue",
      "@type": "pig:entityClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:Issue",
      "dcterms:description": "An 'Issue' is a question to answer or decision to take which is worth tracking.",
      "pig:eligiblePropertyClass": [
        "#PC-VisibleId",
        "#PC-Name",
        "#PC-Description",
        "#PC-IssueStatus",
        "#PC-Priority",
        "#PC-Responsible",
        "#PC-DueDate"
      ]
    },
    {
      "@id": "#RC-Paragraph",
      "@type": "pig:entityClass",
      "dcterms:modified": "2023-07-16T09:30:25.850Z",
      "dcterms:title": "SpecIF:Paragraph",
      "dcterms:description": "<p>A 'Paragraph' is an unspecified information in a document at any level.</p>",
      "pig:eligiblePropertyClass": [
        "#PC-Name",
        "#PC-Description",
        "#PC-Diagram",
        "#PC-Type"
      ]
    },
    {
      "@id": "#SC-shows",
      "@type": "pig:relationshipClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:shows",
      "dcterms:description": "Relation: Plan shows Model-Element",
      "pig:eligibleSubjectClass": [
        "#RC-View"
      ],
      "pig:eligibleObjectClass": [
        "#RC-Actor",
        "#RC-State",
        "#RC-Event"
      ]
    },
    {
      "@id": "#SC-contains",
      "@type": "pig:relationshipClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:contains",
      "dcterms:description": "Relation: Model-Element contains Model-Element",
      "pig:eligibleSubjectClass": [
        "#RC-Actor",
        "#RC-State",
        "#RC-Event"
      ],
      "pig:eligibleObjectClass": [
        "#RC-Actor",
        "#RC-State",
        "#RC-Event"
      ]
    },
    {
      "@id": "#SC-stores",
      "@type": "pig:relationshipClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:modifies",
      "dcterms:description": "Relation: Actor (Role, Function) writes and reads State (Information)",
      "pig:eligibleSubjectClass": [
        "#RC-Actor"
      ],
      "pig:eligibleObjectClass": [
        "#RC-State"
      ]
    },
    {
      "@id": "#SC-writes",
      "@type": "pig:relationshipClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:writes",
      "dcterms:description": "Relation: Actor (Role, Function) writes State (Information)",
      "pig:eligibleSubjectClass": [
        "#RC-Actor"
      ],
      "pig:eligibleObjectClass": [
        "#RC-State"
      ]
    },
    {
      "@id": "#SC-reads",
      "@type": "pig:relationshipClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:reads",
      "dcterms:description": "Relation: Actor (Role, Function) reads State (Information)",
      "pig:eligibleSubjectClass": [
        "#RC-Actor"
      ],
      "pig:eligibleObjectClass": [
        "#RC-State"
      ]
    },
    {
      "@id": "#SC-dependsOn",
      "@type": "pig:relationshipClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:dependsOn",
      "dcterms:description": "Relation: Requirement/Feature depends on Requirement/Feature",
      "pig:eligibleSubjectClass": [
        "#RC-Requirement"
      ],
      "pig:eligibleObjectClass": [
        "#RC-Requirement"
      ]
    },
    {
      "@id": "#SC-satisfies",
      "@type": "pig:relationshipClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "oslc_rm:satisfies",
      "dcterms:description": "Relation: Model-Element satisfies Requirement",
      "pig:eligibleSubjectClass": [
        "#RC-Actor",
        "#RC-State",
        "#RC-Event"
      ],
      "pig:eligibleObjectClass": [
        "#RC-Requirement"
      ]
    },
    {
      "@id": "#SC-concerns",
      "@type": "pig:relationshipClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "SpecIF:refersTo",
      "dcterms:description": "Relation: Open Issue concerns Plan/Model-Element/Requirement",
      "pig:eligibleSubjectClass": [
        "#RC-Issue"
      ],
      "pig:eligibleObjectClass": [
        "#RC-View",
        "#RC-Actor",
        "#RC-State",
        "#RC-Event",
        "#RC-Requirement"
      ]
    },
    {
      "@id": "#Fld-59c8a7730000bca80137509a49b1218b-info",
      "@type": "pig:Entity",
      "dcterms:modified": "2018-05-04T17:18:18+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Folder",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Project Information"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div> <p> <a href=\"https://enso-managers.de\" ><object data=\"files_and_images/enso-logo.png\" type=\"image/png\" >enso managers gmbh</object></a> </p> <p> This is a small show-case illustrating the basic concepts for integrated mechatronic system specification. In addition to the original text and diagrams you will find logical relations between the information elements. Most relations are derived automatically from the diagrams; the resulting semantic net lends itself for navigation, search and audit. </p> <p> The specification integrates and represents: </p><ul><li>processes, system composition and requirements (dynamic, static and detail views) </li><li>mechanic, electric and software components with their interfaces. </li></ul><p>It is an important characteristic, that all plans (diagrams) are views of a common system engineering model, sometimes called 'system repository'. Thus, consistency is always maintained. </p><p>The model elements are connected with relations, most of which are defined by positioning graph elements. For example, if a system component is drawn within another, a relationship 'contains' is created in the logic representation of the engineering model. Other relations, such as a system component 'satisfies' a requirement are created manually. </p><p>Also, the documents are generated from the system engineering model. The ordering is in most projects (it can be rearranged, however, if appropriate): </p><ul><li> All plans </li><li> A glossary with descriptions of all model elements appearing on one or more plans </li><li> A hierarchically ordered list of requirements </li> <li> A list of open issues. </li></ul><p> Please note that plans list related model elements and model elements list related requirements .. and vice versa. Active hyper-links are used, so that it is easy to jump between related model elements. </p><p><br/></p><p><strong>Stakeholders:</strong></p><table class=\"stdInlineWithBorder\"> <tbody> <tr> <th> Name </th><th>Organisation</th><th> Telephone </th> <th> Email </th> </tr> <tr> <td> Dr. Oskar v. Dungern </td> <td>enso managers GmbH</td> <td> </td> <td><a href=\"mailto:od@enso-managers.de\" >od@enso-managers.de</a></td> </tr> </tbody> </table> <p> <br /> </p> <p><strong>Legend:</strong> </p> <p> To distinguish their type, element names are preceded by one of the following symbols: </p> <table class=\"stdInlineWithBorder\"> <tbody> <tr> <td> ▣ </td><td> Plan </td> <td> A 'Diagram' is a graphical model view with a specific communication purpose, e.g. a business process or system composition. </td></tr><tr> <td> ■ </td><td> Actor (Role, Function) </td> <td> An 'Actor' is a fundamental model element type representing an active entity, be it an activity, a process step, a function, a system component or a role. </td> </tr> <tr> <td> ● </td> <td> State (Information) </td> <td> A 'State' is a fundamental model element type representing a passive entity, be it a value, a condition, an information storage or even a physical shape. </td> </tr> <tr> <td> ♦ </td> <td> Event </td> <td> An 'Event' is a fundamental model element type representing a time reference, a change in condition/value or more generally a synchronisation primitive. </td> </tr> <tr> <td> ✶ </td> <td> Feature </td> <td> A 'Feature' is an intentional distinguishing characteristic of a system, often a unique selling proposition. </td> </tr> <tr> <td> ↯ </td> <td> Requirement </td> <td> A 'Requirement' is a singular documented physical and functional need that a particular design, product or process must be able to perform. </td> </tr> </tbody> </table> <p class=\"sceditor-nlf\"> <br /> </p></div>"
          ]
        }
      ]
    },
    {
      "@id": "#Fld-5a5f54090000bca801375b04a668f1a7",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:02+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Folder",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "System Composition"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>.. showing the system and its composition of modules (at a higher level) and components (at a lower level). The relevant interfaces between the disciplines mechanical, electrical and software engineering are shown.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#Pln-27420ffc0000c3a8013ab527ca1b71f5",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:03+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-View",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Color coding"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Diagram",
          "@value": [
            "<div style=\"max-width: 480px;\" ><object data=\"files_and_images/27420ffc0000c3a8013ab527ca1b71f5.svg\" type=\"image/svg+xml\" >Color Coding</object></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Pln-Notation",
          "@value": [
            "FMC Block Diagram"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-5"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierStatus",
          "@value": [
            "#V-supplier-status-0"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-OemStatus",
          "@value": [
            "#V-oem-status-0"
          ]
        }
      ]
    },
    {
      "@id": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:03+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-View",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "SmartHome System"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The Smart-Home-System consists of sensors on the left side, the controller in the middle and the actuators on the right side. </p></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Diagram",
          "@value": [
            "<div style=\"max-width: 600px;\"><object data=\"files_and_images/5a4755dd0000bca801375293a62c90a8.svg\" type=\"image/svg+xml\" >files_and_images\\5a4755dd0000bca801375293a62c90a8.svg</object></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Pln-Notation",
          "@value": [
            "FMC Block Diagram"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierStatus",
          "@value": [
            "#V-supplier-status-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-OemStatus",
          "@value": [
            "#V-oem-status-1"
          ]
        }
      ]
    },
    {
      "@id": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:03+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-View",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Flush-mounted Dimmer"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p> .. showing the components of the device with their interfaces. </p></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Diagram",
          "@value": [
            "<div style=\"max-width: 600px;\"><object data=\"files_and_images/5a6cdea50000bca80137d6b2d6e8a3a0.svg\" type=\"image/svg+xml\" >files_and_images\\5a6cdea50000bca80137d6b2d6e8a3a0.svg</object></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Pln-Notation",
          "@value": [
            "FMC Block Diagram"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierStatus",
          "@value": [
            "#V-supplier-status-4"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-OemStatus",
          "@value": [
            "#V-oem-status-3"
          ]
        }
      ]
    },
    {
      "@id": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:04+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-View",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Dimmer Module"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Diagram",
          "@value": [
            "<div style=\"max-width: 600px;\"><object data=\"files_and_images/5a7f99af0000bca8013754f2ef12d3e5.svg\" type=\"image/svg+xml\" >files_and_images\\5a7f99af0000bca8013754f2ef12d3e5.svg</object></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Pln-Notation",
          "@value": [
            "FMC Block Diagram"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierStatus",
          "@value": [
            "#V-supplier-status-3"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-OemStatus",
          "@value": [
            "#V-oem-status-1"
          ]
        }
      ]
    },
    {
      "@id": "#Fld-5af3154d0000bca801379748537d7388",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:02+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Folder",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Scenarios"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>.. showing the behavioral aspects of system design, both from external user perspective ('black box') and from internal perspective ('white box').</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#Fld-5b6a99f10000bca80137b78cda65fc07",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:04+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Folder",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Dimming"
          ]
        }
      ]
    },
    {
      "@id": "#Pln-606e76c70000bca801376ec3133a1181",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:04+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-View",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "User Activity"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>This shows the defined sequences of manual operation to activate the device. </p></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Diagram",
          "@value": [
            "<div style=\"max-width: 600px;\"><object data=\"files_and_images/606e76c70000bca801376ec3133a1181.svg\" type=\"image/svg+xml\" >files_and_images\\606e76c70000bca801376ec3133a1181.svg</object></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Pln-Notation",
          "@value": [
            "BPMN Process Model"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-3"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierStatus",
          "@value": [
            "#V-supplier-status-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-OemStatus",
          "@value": [
            "#V-oem-status-2"
          ]
        }
      ]
    },
    {
      "@id": "#Pln-45a1c8930000c3a801414cd1eaa70b5a",
      "@type": "pig:Entity",
      "dcterms:modified": "2018-03-15T15:36:31+01:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-View",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Double-Button Observer Software"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>This software module discriminates the user's activity (operation sequence) and submits corresponding events/commands to the actuator. This software is generic with respect to the actuator, it can be used for [[dimmer]]s, [[shading]] devices and others. </p></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Diagram",
          "@value": [
            "<div style=\"max-width: 600px;\"><object type=\"image/svg+xml\" data=\"files_and_images/45a1c8930000c3a801414cd1eaa70b5a.svg\">files_and_images\\45a1c8930000c3a801414cd1eaa70b5a.svg</object></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Pln-Notation",
          "@value": [
            "BPMN Process Model"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-3"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierStatus",
          "@value": [
            "#V-supplier-status-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-OemStatus",
          "@value": [
            "#V-oem-status-2"
          ]
        }
      ]
    },
    {
      "@id": "#Pln-5af364560000bca80137b84017f4e832",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:06+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-View",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Dimmer Controller Software"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>This software decodes the commands and controls the timely behavior of the actuator. </p></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Diagram",
          "@value": [
            "<div style=\"max-width: 720px;\"><object data=\"files_and_images/5af364560000bca80137b84017f4e832.svg\" type=\"image/svg+xml\" >files_and_images\\5af364560000bca80137b84017f4e832.svg</object></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Pln-Notation",
          "@value": [
            "Petri Net"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-3"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierStatus",
          "@value": [
            "#V-supplier-status-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-OemStatus",
          "@value": [
            "#V-oem-status-2"
          ]
        }
      ]
    },
    {
      "@id": "#Fld-5b8e98550000bca801371afb0c7b671b",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:02+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Folder",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Requirements"
          ]
        }
      ]
    },
    {
      "@id": "#Fld-d1b1698a0000c3a801505b1b5698b7a1",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:06+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Folder",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Function"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The requirements related to the product function.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#Req-d1c895230000c3a80150f8afd049f738",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:06+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_014"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Dim an electric load"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p> The user can set the intensity level of an electric load such as a light [[bulb]]. Pressing a button 'up' or 'down', the intensity is increased or decreased following a quasi-stepless ramp. <br /></p></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-5"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-0",
            "#V-Discipline-1",
            "#V-Discipline-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierStatus",
          "@value": [
            "#V-supplier-status-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierComment",
          "@value": [
            "Our solution does this perfectly."
          ]
        }
      ]
    },
    {
      "@id": "#Req-d1d42a6a0000c3a8015091ec8d149b93",
      "@type": "pig:Entity",
      "dcterms:modified": "2018-02-13T12:22:44+01:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_016"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Switch an electric load"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p> The user can immediately switch 'on' or 'off' the electric load. The intensity set to the maximum resp. minimum level, as defined by installation parameters.</p></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-5"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-1",
            "#V-Discipline-2"
          ]
        }
      ]
    },
    {
      "@id": "#Req-d1cd7f370000c3a8015095e6ee21aab7",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:07+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_015"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Set dimming parameters"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p> During system setup, the installer can modify the following parameters: </p><ul> <li> maximum intensity </li> <li> minimum intensity </li> <li> dimming speed (intensity ramp when dimming) </li></ul></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-4"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-2"
          ]
        }
      ]
    },
    {
      "@id": "#Req-5ba3512b0000bca801371cc0617eb4c1",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:08+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_009"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Minimum button size"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The button size must not be less than 2 cm in diameter.</p> </div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-5"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-0"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-0"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierStatus",
          "@value": [
            "#V-supplier-status-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierComment",
          "@value": [
            "We did not find the actual minimum dimensions of the buttons."
          ]
        }
      ]
    },
    {
      "@id": "#Req-5b8fbb300000bca80137c73e3ce4c737",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:08+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_001"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Electric load is 120 W"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The power stage must allow an electric load of 120 W.</p> </div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-4"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-0"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierStatus",
          "@value": [
            "#V-supplier-status-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierComment",
          "@value": [
            "For which time period?  Permanent load?"
          ]
        }
      ]
    },
    {
      "@id": "#Fld-d1b1d6c60000c3a80150fe9ce40e6588",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:08+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Folder",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Quality"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The requirements related to quality characteristics of the product.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#Req-5b944fc70000bca8013763f44fdc0e03",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:09+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_003"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Instant use"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>85% of an arbitrarily selected group of test users understands and can use the system without reading a manual.</p> </div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-5"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-0",
            "#V-Discipline-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierStatus",
          "@value": [
            "#V-supplier-status-2"
          ]
        }
      ]
    },
    {
      "@id": "#Req-5ba140d60000bca801372b09f9888eca",
      "@type": "pig:Entity",
      "dcterms:modified": "2018-03-08T11:59:42+01:00",
      "dcterms:creator": "supplier",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_008"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Instantaneous reaction"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p> The reaction time of the system to user input is 'instantaneous' (&lt; 0,5 sec).</p></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-6"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-0"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierStatus",
          "@value": [
            "#V-supplier-status-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierComment",
          "@value": [
            "Mais bien sûr."
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-OemStatus",
          "@value": [
            "#V-oem-status-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-OemComment",
          "@value": [
            "Das ist ganz wichtig für uns."
          ]
        }
      ]
    },
    {
      "@id": "#Req-ee452cf20000c3a8014035290669304d",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:10+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_011"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Consistent system behavior"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The system's behavior must be consistent. For example, controlling a dimmer must correspond with controlling a shade.</p> </div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-5"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-0",
            "#V-Discipline-2"
          ]
        }
      ]
    },
    {
      "@id": "#Req-ee43fc4c0000c3a8014063d42c77767f",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:11+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_010"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "No dead-locks"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>Under no circumstances the system may get stuck in a dead-lock. I.e. every sequence of input stimulation must be supported, even arbitrary sequences. Input stimulation which is not supported in a given system state is either refused with an error message, if a feedback channel is available, or it is simply ignored, otherwise.</p> </div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-5"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-0"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-1",
            "#V-Discipline-2"
          ]
        }
      ]
    },
    {
      "@id": "#Req-5b9124bc0000bca80137fa2ce86f5eca",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:11+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_002"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Overload protection"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The dimmer unit is protected against resistive overload and against any capacitive or inductive loads.</p> </div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-4"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-1"
          ]
        }
      ]
    },
    {
      "@id": "#Req-5b9e68530000bca801371362c49d2d08",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:11+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_007"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Auto shut-off"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>In case of over-temperature the device is shut-off automatically by an electronic circuit.</p> </div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-4"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-1"
          ]
        }
      ]
    },
    {
      "@id": "#Fld-d1b314890000c3a80150b71a1473d374",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:12+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Folder",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Constraints"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The requirements related to constraints for product conception, such as regulations or technical choices made upfront.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#Req-eea1cd500000c3a80140fe00109eb7f4",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:12+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_012"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Compliance with industry standards"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The system must comply with industry standards. Besides legal and safety requirements, compatibility with existing electrical installations, tools and commercial components is desired.</p> </div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-5"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-0",
            "#V-Discipline-1",
            "#V-Discipline-3"
          ]
        }
      ]
    },
    {
      "@id": "#Req-5b95fae40000bca801372becc933682d",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:12+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_004"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Industry-standard mounting"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p> The product fits into an industry-standard [[housing]] for flush-mounted devices (diameter &#x2300;68 mm). It is fixed with two screw-activated claws.</p></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-4"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-0"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-0"
          ]
        }
      ]
    },
    {
      "@id": "#Req-5b9ab8a50000bca801377ad0be3bbc89",
      "@type": "pig:Entity",
      "dcterms:modified": "2018-02-16T10:29:48+01:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_005"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Fire protection"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p> The product must withstand 650°C (VDE 0606-1).</p></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-4"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-0"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-0",
            "#V-Discipline-1"
          ]
        }
      ]
    },
    {
      "@id": "#Req-728c69c80018b1a8014b974542c36edc",
      "@type": "pig:Entity",
      "dcterms:modified": "2018-02-28T13:16:17+01:00",
      "dcterms:creator": "supplier",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_013"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Galvanic Isolation"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The load circuit with power stage is galvanically isolated from the controller.</p> </div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-4"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-0"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-1"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-SupplierComment",
          "@value": [
            "This is standard for all our products: expensive, but effective."
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-OemStatus",
          "@value": [
            "#V-oem-status-1"
          ]
        }
      ]
    },
    {
      "@id": "#Req-5b9c950e0000bca801374f16615247b9",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-10-27T11:44:20+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Requirement",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "REQ_006"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Complete state-machine"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p> The system is controlled by a complete state-machine and must not have any dead-lock state.</p></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Status",
          "@value": [
            "#V-Status-5"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Perspective",
          "@value": [
            "#V-Perspective-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Discipline",
          "@value": [
            "#V-Discipline-2"
          ]
        }
      ]
    },
    {
      "@id": "#Fld-59c8a7730000bca80137509a49b1218b",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:02+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Folder",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Parts List"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div>This Parts List has been automatically generated from the model. </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5bd6bd890000bca8013739588a3f43d6",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-11-11T16:16:13+01:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Bulb"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p> Dimmable candescent light-bulb 230V.</p></div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5bcfb01d0000bca80137f303272a5557",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:19+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Shading"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>Window-shade with 2 degrees of freedom: It can be moved up/down and the elements can be set straight/tilted. Both movements can be made proportionally with an electric drive.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-803fd3750000c3a8013cf1fdb3b26d33",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:26+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "SmartHome System"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The new system for controlling all major functions of the private home:</p> <ul> <li>light/illumination</li> <li>window shades</li> <li>heating</li> <li>consumption meters for electricity, heat, gas and water.</li></ul> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a489c300000bca80137ee1373c16844",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:23+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Flush-mounted Dimmer"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<p>A dimmer for electric loads in an industry-standard mounting frame which is flush with the wall surface. In other words, the dimmer is sitting in the wall and just the buttons are visible.</p>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a7776c50000bca8013765ae93af9209",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:22+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Actuator Rods"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>Up to four actuator rods connecting the buttons to electrical contacts.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a76365c0000bca8013776e91afd1e8e",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:16+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Assembly Frame"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p> Mounting frame screwed to or into a wall.</p></div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a9ce0310000bca801378176dc4744e8",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:22+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Control Signals"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:17+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Dimmer Module"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The actuator module with dimmer function for resistive loads.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-12-09T10:38:29+01:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Dimmer Controller Software"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p> Input commands (events):</p><ul> <li> up-long → increase brightness </li> <li> down-long → decrease brightness </li> <li> release → stop dimming, keep brightness </li> <li> up-short → switch to maximum </li> <li> down-short → switch to minimum </li> <li> inappropriate commands are ignored (e.g. up-long when maximum is set). </li> <li> set parameters </li></ul><p> Four parameters influence the behavior of the particular device:</p><ul> <li> minimum value (default: 0%) </li> <li> maximum value (default: 100%) </li> <li> ramp-up speed (default: 10% per sec) </li> <li> ramp-down speed (default: 10% per sec) </li></ul></div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5b2f95ec0000bca8013709bfa81d701f",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:28+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Decreasing"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-45450be80000c3a801414f280f146c71",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:29+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "down-long!"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-4536b0350000c3a801415986f8ea806a",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:30+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "down-short!"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5b149eab0000bca80137aad99b6eea7b",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:30+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Increasing"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5b08ed8d0000bca8013719f554353b0e",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:30+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Intermediate"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-453dfb670000c3a8014191107df4565e",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:30+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "max-reached!"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5b094f8a0000bca801374c798a6587ad",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:30+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Maximum"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-45428b930000c3a80141e28b7d4b5ae5",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:30+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "min-reached!"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5b078fa50000bca80137f36ed05c43cb",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:31+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Minimum"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-453facbb0000c3a80141c43d2fb4f5e2",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:31+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "released!"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5b2d29070000bca801378a6c020cf8f5",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:19+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Start-decreasing"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5b1750f80000bca801373b2d143d7478",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:19+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Start-increasing"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5b2ddad80000bca80137c44d62ba97d8",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:20+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Stop-decreasing"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5b2449180000bca8013722c01c9d35a5",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:20+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Stop-increasing"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5b0839b90000bca801376dcca41ca7d0",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:20+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Switch-off"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>Switch to programmed min-value.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5b07e6aa0000bca8013797aad9be69ae",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:21+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Switch-on"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>Switch to programmed max-value.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-4543fe900000c3a80141f5253ff13c35",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:32+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "up-long!"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-453d34af0000c3a80141918f84641161",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:33+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "up-short!"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:17+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Dimmer Electronics"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The Dimmer Electronics is a printed circuit board with low-power micro-processor, memory, binary as well as analog I/O signals and a power stage supporting the specified electric load.</p></div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Diagram",
          "@value": [
            "<div><p class=\"inline-label\">Diagramm:</p><p><object data=\"files_and_images/Schaltplan.gif\" name=\"Schaltplan.gif\" type=\"image/gif\"/></p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a844d820000bca8013750b9a0410b6b",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:23+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Electro-Magnetic Resistance"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>Electromagnetic characteristics, especially EM-shielding.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a8009a00000bca80137ef95bc3f643f",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:18+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Housing"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Diagram",
          "@value": [
            "<div> <p class=\"inline-label\">Diagramm:</p><p><object data=\"files_and_images/UP-Dose.png\" name=\"UP-Dose.png\" type=\"image/png\"/></p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a87083e0000bca801379bb412523737",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:23+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "I/O Pins"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>per input and output signal:</p> <ul> <li>hardware-address</li> <li>number of significant bits</li></ul> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a82ec6f0000bca801372ef053a71bdf",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:25+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Physical Space"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>Effective 3D interior space and mounting for electronics.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a86b8980000bca80137ca6fde1a125e",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:25+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Processor RAM ROM"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>EPROM-Size</p> <p>RAM-Size</p> <p>Processor type with instruction set and speed (MIPS)</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a820a3c0000bca801378c9093fb7d80",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:27+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Thermal Resistance"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p> Thermal resistance and thermal capacity of the [[housing]].</p></div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a71c4800000bca80137f2aaa7b63000",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:17+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Double Button"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The Double Button (a sensor unit) is a versatile all-mechanical unit used for multiple purposes. The mechanical position is transferred with a rod per button to the next unit where it is converted to an electrical signal.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-606f16ac0000bca801373587fda932b3",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:18+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Double-Button Observer Software"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>This is an observer of the double-button sensor. It distinguishes short and long pressing in the 'up' and 'down' directions. A discriminator may send five events:</p> <ul> <li>up-short</li> <li>down-short</li> <li>up-long</li> <li>down-long and </li> <li>release.</li> </ul><p>The events are interpreted and actions are initiated accordingly by the target actuator unit. The double button sensor and the observer have no notion of the underlying function.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-45a236e00000c3a801410f6503287e16",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:21+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Wait for Activation"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The kind of activation is determined:</p> <ul> <li>Up- or Down-Button</li> <li>Short or long activation: 'Short' is &lt; 0,4 sec.</li> <li>Do only wait until the distinction between 'short' or 'long' can be made!</li></ul> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-45a3b13c0000c3a801415e97f5bc29d1",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:21+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Wait for Deactivation"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a4dd77b0000bca8013736c6912ad291",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:22+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "down"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The button to drive down the dimmer, shading or similar devices.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a99c89c0000bca801375d44cf9a50ca",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:23+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Ground Cable"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><ul> <li>Cable-diameter</li> <li>Wire-diameter</li> <li>Max-current</li></ul> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a9929510000bca80137d23c81f1ca54",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:24+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Load Cable"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><ul> <li>Cable-diameter</li> <li>Wire-diameter</li> <li>Max-current</li></ul> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5c29fb8e0000bca80137eb9734c99bfd",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:24+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Neutral Cable"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><ul> <li>Cable-diameter</li> <li>Wire-diameter</li> <li>Max-current</li></ul> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a77385f0000bca80137e1c7dc0b1721",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:26+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Spring Clips"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>Spring clips for mechanical connection.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a9888810000bca801375410ce1cc142",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:27+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Supply Cable"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><ul> <li>Cable-diameter</li> <li>Wire-diameter</li> <li>Max-current</li></ul> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a4d6dee0000bca80137c1caf2f42349",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:28+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "up"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The button to drive up the dimmer, shading or similar devices.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a9b7a9b0000bca80137d768644696b7",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:22+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Wireless Module"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>Receives control commands via radio signal or the mechanical position of a mounted sensor unit. Sends electrical control signals to the mounted actuator module.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-463289cd0000c3a80141be3fc417034a",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:28+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Wireless Network"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a4c80c20000bca8013753b6999a4da8",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:23+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Flush-mounted Shading Control"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a4cfa830000bca801370d837f761f3e",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:27+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "straighten"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The button to straighten the shading elements.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a4d2bd00000bca80137a3f233cdffeb",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:28+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "tilt"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The button to tilt the shading elements.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a52b50c0000bca801377e3d15255f98",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:24+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Intelligent Shading Drive"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>An intelligent shading actuator with 2 drives for up/down straight/tilt motion. The unit comprises the control unit and the motors.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5bcf35cf0000bca8013776d68023612a",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:24+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "M"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>Actuator Motor 230V.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a51dd920000bca8013770a4395c83fc",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:26+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-State",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Remote Control"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a50d5b60000bca8013781532547ce93",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:19+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "SmartHome Controller"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>The controller </p> <ul> <li>interconnects locally distributed sensors and actuators, </li> <li>coordinates different actuators where appropriate and </li> <li>performes automatic functions, such as switching external lamps dependend on ambient light.</li></ul> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:21+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "User"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-608177820000bca801379179ebf3b6aa",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:16+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Briefly press Down-button"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>Press down-button &lt;400 ms.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-611366530000bca80137a97f194e96a3",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:16+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Briefly press Up-button"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>Press up-button &lt;400 ms.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-453862540000c3a801419d91bef48cfd",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:29+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Dim-down!"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-45387c0b0000c3a801410aa03f6b9be4",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:29+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Dim-up!"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-4538920b0000c3a801415c67e334b8a1",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:29+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Done!"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-608239830000bca801373690c7d2af0f",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:18+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Press and hold Down-button"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>Press down-button &gt;400 ms.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-610b07100000bca80137c10f96c46247",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:18+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Press and hold Up-button"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>Press up-button &gt;400 ms.</p> </div>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-610e0b010000bca80137ac40800bb1b8",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:18+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Actor",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Release button"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-459b92580000c3a80141cb4acb521ab1",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:31+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Stop dimming!"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-45384cd10000c3a80141c1f85d7c26e6",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:32+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Switch-off!"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-607f13b50000bca80137ba95f11856ab",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:32+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Event",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Switch-on!"
          ]
        }
      ]
    },
    {
      "@id": "#Fld-ef47e6970000c3a80139dc747c5df319",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:02+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Folder",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Open Issues"
          ]
        }
      ]
    },
    {
      "@id": "#Fld-ee29463e0000c3a80139627bbced50ae",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:14+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Folder",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Mechanical"
          ]
        }
      ]
    },
    {
      "@id": "#Iss-ee2abb630000c3a8013987a750219659",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:15+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Issue",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "OPM_001"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "An open issue with respect to mechanics"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>This is the description of the issue and potential solution.</p> </div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-IssueStatus",
          "@value": [
            "#V-Iss-Status-3"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-4"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-DueDate",
          "@value": [
            "2012-09-30T12:00:00+02:00"
          ]
        }
      ]
    },
    {
      "@id": "#Fld-ee2a15040000c3a80139d27de6704f15",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:15+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Folder",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Software"
          ]
        }
      ]
    },
    {
      "@id": "#Iss-eee2d4e00000c3a801394148dcc58a52",
      "@type": "pig:Entity",
      "dcterms:modified": "2017-06-19T20:13:15+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#RC-Issue",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-VisibleId",
          "@value": [
            "OPS_001"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "An open issue concerning software"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Description",
          "@value": [
            "<div><p>A description.</p> </div>"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-IssueStatus",
          "@value": [
            "#V-Iss-Status-6"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Priority",
          "@value": [
            "#V-Priority-2"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Responsible",
          "@value": [
            "Vorname Nachname"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-DueDate",
          "@value": [
            "2012-09-30T12:00:00+02:00"
          ]
        }
      ]
    },
    {
      "@id": "#FolderGlossary-8001804519",
      "@type": "pig:Entity",
      "dcterms:modified": "2025-06-09T07:17:18.410Z",
      "pig.hasClass": "#RC-Folder",
      "pig:hasProperty": [
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Name",
          "@value": [
            "Model Elements (Glossary)"
          ]
        },
        {
          "@type": "pig:Property",
          "pig:hasClass": "#PC-Type",
          "@value": [
            "SpecIF:Glossary"
          ]
        }
      ]
    },
    {
      "@id": "#RVis-Pln-5a4755dd0000bca801375293a62c90a8-MEl-5bd6bd890000bca8013739588a3f43d6",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:33+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "pig:hasObject": "#MEl-5bd6bd890000bca8013739588a3f43d6"
    },
    {
      "@id": "#RVis-Pln-5a4755dd0000bca801375293a62c90a8-MEl-5a4dd77b0000bca8013736c6912ad291",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:33+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "pig:hasObject": "#MEl-5a4dd77b0000bca8013736c6912ad291"
    },
    {
      "@id": "#RVis-Pln-5a4755dd0000bca801375293a62c90a8-MEl-5a489c300000bca80137ee1373c16844",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:33+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "pig:hasObject": "#MEl-5a489c300000bca80137ee1373c16844"
    },
    {
      "@id": "#RVis-Pln-5a4755dd0000bca801375293a62c90a8-MEl-5a4c80c20000bca8013753b6999a4da8",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:34+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "pig:hasObject": "#MEl-5a4c80c20000bca8013753b6999a4da8"
    },
    {
      "@id": "#RVis-Pln-5a4755dd0000bca801375293a62c90a8-MEl-5bcf35cf0000bca8013776d68023612a",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:34+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "pig:hasObject": "#MEl-5bcf35cf0000bca8013776d68023612a"
    },
    {
      "@id": "#RVis-Pln-5a4755dd0000bca801375293a62c90a8-MEl-5a52b50c0000bca801377e3d15255f98",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:34+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "pig:hasObject": "#MEl-5a52b50c0000bca801377e3d15255f98"
    },
    {
      "@id": "#RVis-Pln-5a4755dd0000bca801375293a62c90a8-MEl-5a51dd920000bca8013770a4395c83fc",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:34+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "pig:hasObject": "#MEl-5a51dd920000bca8013770a4395c83fc"
    },
    {
      "@id": "#RVis-Pln-5a4755dd0000bca801375293a62c90a8-MEl-5a50d5b60000bca8013781532547ce93",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:35+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "pig:hasObject": "#MEl-5a50d5b60000bca8013781532547ce93"
    },
    {
      "@id": "#RVis-Pln-5a4755dd0000bca801375293a62c90a8-MEl-5bcfb01d0000bca80137f303272a5557",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:35+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "pig:hasObject": "#MEl-5bcfb01d0000bca80137f303272a5557"
    },
    {
      "@id": "#RVis-Pln-5a4755dd0000bca801375293a62c90a8-MEl-803fd3750000c3a8013cf1fdb3b26d33",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:35+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "pig:hasObject": "#MEl-803fd3750000c3a8013cf1fdb3b26d33"
    },
    {
      "@id": "#RVis-Pln-5a4755dd0000bca801375293a62c90a8-MEl-5a4cfa830000bca801370d837f761f3e",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:35+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "pig:hasObject": "#MEl-5a4cfa830000bca801370d837f761f3e"
    },
    {
      "@id": "#RVis-Pln-5a4755dd0000bca801375293a62c90a8-MEl-5a4d2bd00000bca80137a3f233cdffeb",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:35+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "pig:hasObject": "#MEl-5a4d2bd00000bca80137a3f233cdffeb"
    },
    {
      "@id": "#RVis-Pln-5a4755dd0000bca801375293a62c90a8-MEl-5a4d6dee0000bca80137c1caf2f42349",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:35+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "pig:hasObject": "#MEl-5a4d6dee0000bca80137c1caf2f42349"
    },
    {
      "@id": "#RVis-Pln-5a4755dd0000bca801375293a62c90a8-MEl-5a47935a0000bca801377c17f8cb25b0",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:36+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a4755dd0000bca801375293a62c90a8",
      "pig:hasObject": "#MEl-5a47935a0000bca801377c17f8cb25b0"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-5a7776c50000bca8013765ae93af9209",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:36+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-5a7776c50000bca8013765ae93af9209"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-5a76365c0000bca8013776e91afd1e8e",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:36+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-5a76365c0000bca8013776e91afd1e8e"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-5a9ce0310000bca801378176dc4744e8",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:36+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-5a9ce0310000bca801378176dc4744e8"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-5a752ccc0000bca80137479a2e8bab30",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:36+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-5a752ccc0000bca80137479a2e8bab30"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-5a71c4800000bca80137f2aaa7b63000",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:36+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-5a71c4800000bca80137f2aaa7b63000"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-5a4dd77b0000bca8013736c6912ad291",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:37+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-5a4dd77b0000bca8013736c6912ad291"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-5a489c300000bca80137ee1373c16844",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:37+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-5a489c300000bca80137ee1373c16844"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-5a99c89c0000bca801375d44cf9a50ca",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:37+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-5a99c89c0000bca801375d44cf9a50ca"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-5a9929510000bca80137d23c81f1ca54",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:37+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-5a9929510000bca80137d23c81f1ca54"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-5c29fb8e0000bca80137eb9734c99bfd",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:37+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-5c29fb8e0000bca80137eb9734c99bfd"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-5a77385f0000bca80137e1c7dc0b1721",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:38+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-5a77385f0000bca80137e1c7dc0b1721"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-5a9888810000bca801375410ce1cc142",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:38+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-5a9888810000bca801375410ce1cc142"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-5a4d6dee0000bca80137c1caf2f42349",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:38+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-5a4d6dee0000bca80137c1caf2f42349"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-5a9b7a9b0000bca80137d768644696b7",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:38+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-5a9b7a9b0000bca80137d768644696b7"
    },
    {
      "@id": "#RVis-Pln-5a6cdea50000bca80137d6b2d6e8a3a0-MEl-463289cd0000c3a80141be3fc417034a",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:38+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
      "pig:hasObject": "#MEl-463289cd0000c3a80141be3fc417034a"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5a9ce0310000bca801378176dc4744e8",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:39+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5a9ce0310000bca801378176dc4744e8"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5a85347c0000bca80137ad485c7cd330",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:39+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5a85347c0000bca80137ad485c7cd330"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5a808e2a0000bca80137bfd74268a84a",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:39+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5a808e2a0000bca80137bfd74268a84a"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5a752ccc0000bca80137479a2e8bab30",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:39+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5a752ccc0000bca80137479a2e8bab30"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5a844d820000bca8013750b9a0410b6b",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:40+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5a844d820000bca8013750b9a0410b6b"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5a99c89c0000bca801375d44cf9a50ca",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:40+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5a99c89c0000bca801375d44cf9a50ca"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5a8009a00000bca80137ef95bc3f643f",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:40+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5a8009a00000bca80137ef95bc3f643f"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5a87083e0000bca801379bb412523737",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:40+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5a87083e0000bca801379bb412523737"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5a9929510000bca80137d23c81f1ca54",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:40+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5a9929510000bca80137d23c81f1ca54"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5c29fb8e0000bca80137eb9734c99bfd",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:40+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5c29fb8e0000bca80137eb9734c99bfd"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5a82ec6f0000bca801372ef053a71bdf",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:41+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5a82ec6f0000bca801372ef053a71bdf"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5a86b8980000bca80137ca6fde1a125e",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:41+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5a86b8980000bca80137ca6fde1a125e"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5a77385f0000bca80137e1c7dc0b1721",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:41+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5a77385f0000bca80137e1c7dc0b1721"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5a9888810000bca801375410ce1cc142",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:42+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5a9888810000bca801375410ce1cc142"
    },
    {
      "@id": "#RVis-Pln-5a7f99af0000bca8013754f2ef12d3e5-MEl-5a820a3c0000bca801378c9093fb7d80",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:42+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5a7f99af0000bca8013754f2ef12d3e5",
      "pig:hasObject": "#MEl-5a820a3c0000bca801378c9093fb7d80"
    },
    {
      "@id": "#RVis-Pln-606e76c70000bca801376ec3133a1181-MEl-608177820000bca801379179ebf3b6aa",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:42+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-606e76c70000bca801376ec3133a1181",
      "pig:hasObject": "#MEl-608177820000bca801379179ebf3b6aa"
    },
    {
      "@id": "#RVis-Pln-606e76c70000bca801376ec3133a1181-MEl-611366530000bca80137a97f194e96a3",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:42+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-606e76c70000bca801376ec3133a1181",
      "pig:hasObject": "#MEl-611366530000bca80137a97f194e96a3"
    },
    {
      "@id": "#RVis-Pln-606e76c70000bca801376ec3133a1181-MEl-453862540000c3a801419d91bef48cfd",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:42+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-606e76c70000bca801376ec3133a1181",
      "pig:hasObject": "#MEl-453862540000c3a801419d91bef48cfd"
    },
    {
      "@id": "#RVis-Pln-606e76c70000bca801376ec3133a1181-MEl-45387c0b0000c3a801410aa03f6b9be4",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:42+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-606e76c70000bca801376ec3133a1181",
      "pig:hasObject": "#MEl-45387c0b0000c3a801410aa03f6b9be4"
    },
    {
      "@id": "#RVis-Pln-606e76c70000bca801376ec3133a1181-MEl-4538920b0000c3a801415c67e334b8a1",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:43+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-606e76c70000bca801376ec3133a1181",
      "pig:hasObject": "#MEl-4538920b0000c3a801415c67e334b8a1"
    },
    {
      "@id": "#RVis-Pln-606e76c70000bca801376ec3133a1181-MEl-608239830000bca801373690c7d2af0f",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:43+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-606e76c70000bca801376ec3133a1181",
      "pig:hasObject": "#MEl-608239830000bca801373690c7d2af0f"
    },
    {
      "@id": "#RVis-Pln-606e76c70000bca801376ec3133a1181-MEl-610b07100000bca80137c10f96c46247",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:43+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-606e76c70000bca801376ec3133a1181",
      "pig:hasObject": "#MEl-610b07100000bca80137c10f96c46247"
    },
    {
      "@id": "#RVis-Pln-606e76c70000bca801376ec3133a1181-MEl-610e0b010000bca80137ac40800bb1b8",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:43+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-606e76c70000bca801376ec3133a1181",
      "pig:hasObject": "#MEl-610e0b010000bca80137ac40800bb1b8"
    },
    {
      "@id": "#RVis-Pln-606e76c70000bca801376ec3133a1181-MEl-459b92580000c3a80141cb4acb521ab1",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:43+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-606e76c70000bca801376ec3133a1181",
      "pig:hasObject": "#MEl-459b92580000c3a80141cb4acb521ab1"
    },
    {
      "@id": "#RVis-Pln-606e76c70000bca801376ec3133a1181-MEl-45384cd10000c3a80141c1f85d7c26e6",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:43+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-606e76c70000bca801376ec3133a1181",
      "pig:hasObject": "#MEl-45384cd10000c3a80141c1f85d7c26e6"
    },
    {
      "@id": "#RVis-Pln-606e76c70000bca801376ec3133a1181-MEl-607f13b50000bca80137ba95f11856ab",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:44+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-606e76c70000bca801376ec3133a1181",
      "pig:hasObject": "#MEl-607f13b50000bca80137ba95f11856ab"
    },
    {
      "@id": "#RVis-Pln-606e76c70000bca801376ec3133a1181-MEl-5a47935a0000bca801377c17f8cb25b0",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:44+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-606e76c70000bca801376ec3133a1181",
      "pig:hasObject": "#MEl-5a47935a0000bca801377c17f8cb25b0"
    },
    {
      "@id": "#RVis-Pln-45a1c8930000c3a801414cd1eaa70b5a-MEl-606f16ac0000bca801373587fda932b3",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:44+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-45a1c8930000c3a801414cd1eaa70b5a",
      "pig:hasObject": "#MEl-606f16ac0000bca801373587fda932b3"
    },
    {
      "@id": "#RVis-Pln-45a1c8930000c3a801414cd1eaa70b5a-MEl-45450be80000c3a801414f280f146c71",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:44+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-45a1c8930000c3a801414cd1eaa70b5a",
      "pig:hasObject": "#MEl-45450be80000c3a801414f280f146c71"
    },
    {
      "@id": "#RVis-Pln-45a1c8930000c3a801414cd1eaa70b5a-MEl-4536b0350000c3a801415986f8ea806a",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:45+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-45a1c8930000c3a801414cd1eaa70b5a",
      "pig:hasObject": "#MEl-4536b0350000c3a801415986f8ea806a"
    },
    {
      "@id": "#RVis-Pln-45a1c8930000c3a801414cd1eaa70b5a-MEl-453facbb0000c3a80141c43d2fb4f5e2",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:45+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-45a1c8930000c3a801414cd1eaa70b5a",
      "pig:hasObject": "#MEl-453facbb0000c3a80141c43d2fb4f5e2"
    },
    {
      "@id": "#RVis-Pln-45a1c8930000c3a801414cd1eaa70b5a-MEl-4543fe900000c3a80141f5253ff13c35",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:45+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-45a1c8930000c3a801414cd1eaa70b5a",
      "pig:hasObject": "#MEl-4543fe900000c3a80141f5253ff13c35"
    },
    {
      "@id": "#RVis-Pln-45a1c8930000c3a801414cd1eaa70b5a-MEl-453d34af0000c3a80141918f84641161",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:45+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-45a1c8930000c3a801414cd1eaa70b5a",
      "pig:hasObject": "#MEl-453d34af0000c3a80141918f84641161"
    },
    {
      "@id": "#RVis-Pln-45a1c8930000c3a801414cd1eaa70b5a-MEl-45a236e00000c3a801410f6503287e16",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:45+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-45a1c8930000c3a801414cd1eaa70b5a",
      "pig:hasObject": "#MEl-45a236e00000c3a801410f6503287e16"
    },
    {
      "@id": "#RVis-Pln-45a1c8930000c3a801414cd1eaa70b5a-MEl-45a3b13c0000c3a801415e97f5bc29d1",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:45+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-45a1c8930000c3a801414cd1eaa70b5a",
      "pig:hasObject": "#MEl-45a3b13c0000c3a801415e97f5bc29d1"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-5b2f95ec0000bca8013709bfa81d701f",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:46+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-5b2f95ec0000bca8013709bfa81d701f"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-5a85347c0000bca80137ad485c7cd330",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:46+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-5a85347c0000bca80137ad485c7cd330"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-45450be80000c3a801414f280f146c71",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:46+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-45450be80000c3a801414f280f146c71"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-4536b0350000c3a801415986f8ea806a",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:46+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-4536b0350000c3a801415986f8ea806a"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-5b149eab0000bca80137aad99b6eea7b",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:47+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-5b149eab0000bca80137aad99b6eea7b"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-5b08ed8d0000bca8013719f554353b0e",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:47+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-5b08ed8d0000bca8013719f554353b0e"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-453dfb670000c3a8014191107df4565e",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:47+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-453dfb670000c3a8014191107df4565e"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-5b094f8a0000bca801374c798a6587ad",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:47+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-5b094f8a0000bca801374c798a6587ad"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-45428b930000c3a80141e28b7d4b5ae5",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:47+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-45428b930000c3a80141e28b7d4b5ae5"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-5b078fa50000bca80137f36ed05c43cb",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:47+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-5b078fa50000bca80137f36ed05c43cb"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-453facbb0000c3a80141c43d2fb4f5e2",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:48+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-453facbb0000c3a80141c43d2fb4f5e2"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-5b2d29070000bca801378a6c020cf8f5",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:48+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-5b2d29070000bca801378a6c020cf8f5"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-5b1750f80000bca801373b2d143d7478",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:48+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-5b1750f80000bca801373b2d143d7478"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-5b2ddad80000bca80137c44d62ba97d8",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:48+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-5b2ddad80000bca80137c44d62ba97d8"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-5b2449180000bca8013722c01c9d35a5",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:48+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-5b2449180000bca8013722c01c9d35a5"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-5b0839b90000bca801376dcca41ca7d0",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:49+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-5b0839b90000bca801376dcca41ca7d0"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-5b07e6aa0000bca8013797aad9be69ae",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:49+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-5b07e6aa0000bca8013797aad9be69ae"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-4543fe900000c3a80141f5253ff13c35",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:49+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-4543fe900000c3a80141f5253ff13c35"
    },
    {
      "@id": "#RVis-Pln-5af364560000bca80137b84017f4e832-MEl-453d34af0000c3a80141918f84641161",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:49+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-shows",
      "pig:hasSubject": "#Pln-5af364560000bca80137b84017f4e832",
      "pig:hasObject": "#MEl-453d34af0000c3a80141918f84641161"
    },
    {
      "@id": "#RSat-MEl-5a85347c0000bca80137ad485c7cd330-Req-d1c895230000c3a80150f8afd049f738",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:49+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#Req-d1c895230000c3a80150f8afd049f738"
    },
    {
      "@id": "#R-RpgwxaijQtHjsE71uYHiTJyJW79",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:49+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-dependsOn",
      "pig:hasSubject": "#Req-d1c895230000c3a80150f8afd049f738",
      "pig:hasObject": "#Req-d1cd7f370000c3a8015095e6ee21aab7"
    },
    {
      "@id": "#R-tA5fx5sgbN3nJReiqqzE6PvBhbt",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:50+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "pig:hasObject": "#Req-d1c895230000c3a80150f8afd049f738"
    },
    {
      "@id": "#R-2hkTtbuV2BjIYernvDaRZXDFV1Q",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:50+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#Req-d1c895230000c3a80150f8afd049f738"
    },
    {
      "@id": "#RSat-MEl-5a85347c0000bca80137ad485c7cd330-Req-d1d42a6a0000c3a8015091ec8d149b93",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:50+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#Req-d1d42a6a0000c3a8015091ec8d149b93"
    },
    {
      "@id": "#R-Ch6fs9eKiVNhSacQ72yIBhF0Q3W",
      "@type": "pig:Relationship",
      "dcterms:modified": "2018-11-15T15:46:00+01:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-concerns",
      "pig:hasSubject": "#Iss-ee2abb630000c3a8013987a750219659",
      "pig:hasObject": "#Req-d1d42a6a0000c3a8015091ec8d149b93"
    },
    {
      "@id": "#RSat-MEl-5a85347c0000bca80137ad485c7cd330-Req-d1cd7f370000c3a8015095e6ee21aab7",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:51+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#Req-d1cd7f370000c3a8015095e6ee21aab7"
    },
    {
      "@id": "#RSat-MEl-5a71c4800000bca80137f2aaa7b63000-Req-5ba3512b0000bca801371cc0617eb4c1",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:51+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a71c4800000bca80137f2aaa7b63000",
      "pig:hasObject": "#Req-5ba3512b0000bca801371cc0617eb4c1"
    },
    {
      "@id": "#RSat-MEl-5a808e2a0000bca80137bfd74268a84a-Req-5b8fbb300000bca80137c73e3ce4c737",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:51+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#Req-5b8fbb300000bca80137c73e3ce4c737"
    },
    {
      "@id": "#RSat-MEl-5a47935a0000bca801377c17f8cb25b0-Req-5b944fc70000bca8013763f44fdc0e03",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:51+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#Req-5b944fc70000bca8013763f44fdc0e03"
    },
    {
      "@id": "#RCnc-Iss-ee2abb630000c3a8013987a750219659-Req-5b944fc70000bca8013763f44fdc0e03",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:51+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-concerns",
      "pig:hasSubject": "#Iss-ee2abb630000c3a8013987a750219659",
      "pig:hasObject": "#Req-5b944fc70000bca8013763f44fdc0e03"
    },
    {
      "@id": "#RSat-MEl-5a752ccc0000bca80137479a2e8bab30-Req-5ba140d60000bca801372b09f9888eca",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:51+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "pig:hasObject": "#Req-5ba140d60000bca801372b09f9888eca"
    },
    {
      "@id": "#RSat-MEl-5a9b7a9b0000bca80137d768644696b7-Req-5ba140d60000bca801372b09f9888eca",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:52+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a9b7a9b0000bca80137d768644696b7",
      "pig:hasObject": "#Req-5ba140d60000bca801372b09f9888eca"
    },
    {
      "@id": "#RSat-MEl-803fd3750000c3a8013cf1fdb3b26d33-Req-ee452cf20000c3a8014035290669304d",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:52+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-803fd3750000c3a8013cf1fdb3b26d33",
      "pig:hasObject": "#Req-ee452cf20000c3a8014035290669304d"
    },
    {
      "@id": "#R-UZD4SQ8jYghL2Tsb4tZjoXDSYoM",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:52+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "pig:hasObject": "#Req-ee452cf20000c3a8014035290669304d"
    },
    {
      "@id": "#RSat-MEl-5a489c300000bca80137ee1373c16844-Req-ee43fc4c0000c3a8014063d42c77767f",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:52+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a489c300000bca80137ee1373c16844",
      "pig:hasObject": "#Req-ee43fc4c0000c3a8014063d42c77767f"
    },
    {
      "@id": "#RSat-MEl-5a4c80c20000bca8013753b6999a4da8-Req-ee43fc4c0000c3a8014063d42c77767f",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:52+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a4c80c20000bca8013753b6999a4da8",
      "pig:hasObject": "#Req-ee43fc4c0000c3a8014063d42c77767f"
    },
    {
      "@id": "#RSat-MEl-5a52b50c0000bca801377e3d15255f98-Req-ee43fc4c0000c3a8014063d42c77767f",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:53+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a52b50c0000bca801377e3d15255f98",
      "pig:hasObject": "#Req-ee43fc4c0000c3a8014063d42c77767f"
    },
    {
      "@id": "#RSat-MEl-5a50d5b60000bca8013781532547ce93-Req-ee43fc4c0000c3a8014063d42c77767f",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:53+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a50d5b60000bca8013781532547ce93",
      "pig:hasObject": "#Req-ee43fc4c0000c3a8014063d42c77767f"
    },
    {
      "@id": "#RDep-Req-ee43fc4c0000c3a8014063d42c77767f-Req-5b9c950e0000bca801374f16615247b9",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:53+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-dependsOn",
      "pig:hasSubject": "#Req-ee43fc4c0000c3a8014063d42c77767f",
      "pig:hasObject": "#Req-5b9c950e0000bca801374f16615247b9"
    },
    {
      "@id": "#RSat-MEl-5a808e2a0000bca80137bfd74268a84a-Req-5b9124bc0000bca80137fa2ce86f5eca",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:53+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#Req-5b9124bc0000bca80137fa2ce86f5eca"
    },
    {
      "@id": "#RSat-MEl-5a52b50c0000bca801377e3d15255f98-Req-5b9124bc0000bca80137fa2ce86f5eca",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:54+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a52b50c0000bca801377e3d15255f98",
      "pig:hasObject": "#Req-5b9124bc0000bca80137fa2ce86f5eca"
    },
    {
      "@id": "#RSat-MEl-5a808e2a0000bca80137bfd74268a84a-Req-5b9e68530000bca801371362c49d2d08",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:54+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#Req-5b9e68530000bca801371362c49d2d08"
    },
    {
      "@id": "#RSat-MEl-5a52b50c0000bca801377e3d15255f98-Req-5b9e68530000bca801371362c49d2d08",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:54+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a52b50c0000bca801377e3d15255f98",
      "pig:hasObject": "#Req-5b9e68530000bca801371362c49d2d08"
    },
    {
      "@id": "#RSat-MEl-803fd3750000c3a8013cf1fdb3b26d33-Req-eea1cd500000c3a80140fe00109eb7f4",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:54+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-803fd3750000c3a8013cf1fdb3b26d33",
      "pig:hasObject": "#Req-eea1cd500000c3a80140fe00109eb7f4"
    },
    {
      "@id": "#R-lELLVnNbbagfomwYyTBgGfXSalj",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:54+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "pig:hasObject": "#Req-eea1cd500000c3a80140fe00109eb7f4"
    },
    {
      "@id": "#RSat-MEl-5a489c300000bca80137ee1373c16844-Req-5b95fae40000bca801372becc933682d",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:54+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a489c300000bca80137ee1373c16844",
      "pig:hasObject": "#Req-5b95fae40000bca801372becc933682d"
    },
    {
      "@id": "#RSat-MEl-5a4c80c20000bca8013753b6999a4da8-Req-5b95fae40000bca801372becc933682d",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:55+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a4c80c20000bca8013753b6999a4da8",
      "pig:hasObject": "#Req-5b95fae40000bca801372becc933682d"
    },
    {
      "@id": "#RSat-MEl-5a489c300000bca80137ee1373c16844-Req-5b9ab8a50000bca801377ad0be3bbc89",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:55+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a489c300000bca80137ee1373c16844",
      "pig:hasObject": "#Req-5b9ab8a50000bca801377ad0be3bbc89"
    },
    {
      "@id": "#RSat-MEl-5a52b50c0000bca801377e3d15255f98-Req-5b9ab8a50000bca801377ad0be3bbc89",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:55+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a52b50c0000bca801377e3d15255f98",
      "pig:hasObject": "#Req-5b9ab8a50000bca801377ad0be3bbc89"
    },
    {
      "@id": "#R-NJ2iOLwt4CEpcf8IidN1z0P4d0m",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:55+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "pig:hasObject": "#Req-5b9ab8a50000bca801377ad0be3bbc89"
    },
    {
      "@id": "#RSat-MEl-5a808e2a0000bca80137bfd74268a84a-Req-728c69c80018b1a8014b974542c36edc",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:55+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#Req-728c69c80018b1a8014b974542c36edc"
    },
    {
      "@id": "#RSat-MEl-5a85347c0000bca80137ad485c7cd330-Req-5b9c950e0000bca801374f16615247b9",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:55+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-satisfies",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#Req-5b9c950e0000bca801374f16615247b9"
    },
    {
      "@id": "#RWri-MEl-5a76365c0000bca8013776e91afd1e8e-MEl-5a77385f0000bca80137e1c7dc0b1721",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:56+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a76365c0000bca8013776e91afd1e8e",
      "pig:hasObject": "#MEl-5a77385f0000bca80137e1c7dc0b1721"
    },
    {
      "@id": "#RRea-MEl-5a76365c0000bca8013776e91afd1e8e-MEl-5a77385f0000bca80137e1c7dc0b1721",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:57+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a76365c0000bca8013776e91afd1e8e",
      "pig:hasObject": "#MEl-5a77385f0000bca80137e1c7dc0b1721"
    },
    {
      "@id": "#RCtn-MEl-5a489c300000bca80137ee1373c16844-MEl-5a76365c0000bca8013776e91afd1e8e",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:57+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a489c300000bca80137ee1373c16844",
      "pig:hasObject": "#MEl-5a76365c0000bca8013776e91afd1e8e"
    },
    {
      "@id": "#RCtn-MEl-5a47935a0000bca801377c17f8cb25b0-MEl-608177820000bca801379179ebf3b6aa",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:57+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#MEl-608177820000bca801379179ebf3b6aa"
    },
    {
      "@id": "#RCtn-MEl-5a47935a0000bca801377c17f8cb25b0-MEl-611366530000bca80137a97f194e96a3",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:57+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#MEl-611366530000bca80137a97f194e96a3"
    },
    {
      "@id": "#RRea-MEl-5bd6bd890000bca8013739588a3f43d6-MEl-5a489c300000bca80137ee1373c16844",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:57+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5bd6bd890000bca8013739588a3f43d6",
      "pig:hasObject": "#MEl-5a489c300000bca80137ee1373c16844"
    },
    {
      "@id": "#RCtn-MEl-5a85347c0000bca80137ad485c7cd330-MEl-45450be80000c3a801414f280f146c71",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:57+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#MEl-45450be80000c3a801414f280f146c71"
    },
    {
      "@id": "#RCtn-MEl-5a85347c0000bca80137ad485c7cd330-MEl-4536b0350000c3a801415986f8ea806a",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:57+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#MEl-4536b0350000c3a801415986f8ea806a"
    },
    {
      "@id": "#RCtn-MEl-5a85347c0000bca80137ad485c7cd330-MEl-5b08ed8d0000bca8013719f554353b0e",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:58+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#MEl-5b08ed8d0000bca8013719f554353b0e"
    },
    {
      "@id": "#RCtn-MEl-5a85347c0000bca80137ad485c7cd330-MEl-453dfb670000c3a8014191107df4565e",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:58+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#MEl-453dfb670000c3a8014191107df4565e"
    },
    {
      "@id": "#RCtn-MEl-5a85347c0000bca80137ad485c7cd330-MEl-5b094f8a0000bca801374c798a6587ad",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:58+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#MEl-5b094f8a0000bca801374c798a6587ad"
    },
    {
      "@id": "#RCtn-MEl-5a85347c0000bca80137ad485c7cd330-MEl-45428b930000c3a80141e28b7d4b5ae5",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:58+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#MEl-45428b930000c3a80141e28b7d4b5ae5"
    },
    {
      "@id": "#RCtn-MEl-5a85347c0000bca80137ad485c7cd330-MEl-5b078fa50000bca80137f36ed05c43cb",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:58+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#MEl-5b078fa50000bca80137f36ed05c43cb"
    },
    {
      "@id": "#RCtn-MEl-5a85347c0000bca80137ad485c7cd330-MEl-453facbb0000c3a80141c43d2fb4f5e2",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:58+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#MEl-453facbb0000c3a80141c43d2fb4f5e2"
    },
    {
      "@id": "#RCtn-MEl-5a85347c0000bca80137ad485c7cd330-MEl-5b0839b90000bca801376dcca41ca7d0",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:59+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#MEl-5b0839b90000bca801376dcca41ca7d0"
    },
    {
      "@id": "#RCtn-MEl-5a85347c0000bca80137ad485c7cd330-MEl-5b07e6aa0000bca8013797aad9be69ae",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:59+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#MEl-5b07e6aa0000bca8013797aad9be69ae"
    },
    {
      "@id": "#RCtn-MEl-5a85347c0000bca80137ad485c7cd330-MEl-4543fe900000c3a80141f5253ff13c35",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:59+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#MEl-4543fe900000c3a80141f5253ff13c35"
    },
    {
      "@id": "#RCtn-MEl-5a85347c0000bca80137ad485c7cd330-MEl-453d34af0000c3a80141918f84641161",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:59+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#MEl-453d34af0000c3a80141918f84641161"
    },
    {
      "@id": "#RRea-MEl-5a85347c0000bca80137ad485c7cd330-MEl-5a87083e0000bca801379bb412523737",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:00+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#MEl-5a87083e0000bca801379bb412523737"
    },
    {
      "@id": "#RRea-MEl-5a85347c0000bca80137ad485c7cd330-MEl-5a86b8980000bca80137ca6fde1a125e",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:00+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a85347c0000bca80137ad485c7cd330",
      "pig:hasObject": "#MEl-5a86b8980000bca80137ca6fde1a125e"
    },
    {
      "@id": "#RCtn-MEl-5a752ccc0000bca80137479a2e8bab30-MEl-5a85347c0000bca80137ad485c7cd330",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:00+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "pig:hasObject": "#MEl-5a85347c0000bca80137ad485c7cd330"
    },
    {
      "@id": "#RWri-MEl-5a808e2a0000bca80137bfd74268a84a-MEl-5a99c89c0000bca801375d44cf9a50ca",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:00+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#MEl-5a99c89c0000bca801375d44cf9a50ca"
    },
    {
      "@id": "#RRea-MEl-5a808e2a0000bca80137bfd74268a84a-MEl-5a99c89c0000bca801375d44cf9a50ca",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:00+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#MEl-5a99c89c0000bca801375d44cf9a50ca"
    },
    {
      "@id": "#RWri-MEl-5a808e2a0000bca80137bfd74268a84a-MEl-5a9929510000bca80137d23c81f1ca54",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:01+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#MEl-5a9929510000bca80137d23c81f1ca54"
    },
    {
      "@id": "#RRea-MEl-5a808e2a0000bca80137bfd74268a84a-MEl-5a9929510000bca80137d23c81f1ca54",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:01+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#MEl-5a9929510000bca80137d23c81f1ca54"
    },
    {
      "@id": "#RWri-MEl-5a808e2a0000bca80137bfd74268a84a-MEl-5c29fb8e0000bca80137eb9734c99bfd",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:01+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#MEl-5c29fb8e0000bca80137eb9734c99bfd"
    },
    {
      "@id": "#RRea-MEl-5a808e2a0000bca80137bfd74268a84a-MEl-5c29fb8e0000bca80137eb9734c99bfd",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:01+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#MEl-5c29fb8e0000bca80137eb9734c99bfd"
    },
    {
      "@id": "#RWri-MEl-5a808e2a0000bca80137bfd74268a84a-MEl-5a9888810000bca801375410ce1cc142",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:01+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#MEl-5a9888810000bca801375410ce1cc142"
    },
    {
      "@id": "#RRea-MEl-5a808e2a0000bca80137bfd74268a84a-MEl-5a9888810000bca801375410ce1cc142",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:02+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#MEl-5a9888810000bca801375410ce1cc142"
    },
    {
      "@id": "#RWri-MEl-5a808e2a0000bca80137bfd74268a84a-MEl-5a86b8980000bca80137ca6fde1a125e",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:02+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#MEl-5a86b8980000bca80137ca6fde1a125e"
    },
    {
      "@id": "#RWri-MEl-5a808e2a0000bca80137bfd74268a84a-MEl-5a87083e0000bca801379bb412523737",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:02+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#MEl-5a87083e0000bca801379bb412523737"
    },
    {
      "@id": "#RRea-MEl-5a808e2a0000bca80137bfd74268a84a-MEl-5a9ce0310000bca801378176dc4744e8",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:02+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#MEl-5a9ce0310000bca801378176dc4744e8"
    },
    {
      "@id": "#RRea-MEl-5a808e2a0000bca80137bfd74268a84a-MEl-5a820a3c0000bca801378c9093fb7d80",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:03+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#MEl-5a820a3c0000bca801378c9093fb7d80"
    },
    {
      "@id": "#RRea-MEl-5a808e2a0000bca80137bfd74268a84a-MEl-5a844d820000bca8013750b9a0410b6b",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:03+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#MEl-5a844d820000bca8013750b9a0410b6b"
    },
    {
      "@id": "#RRea-MEl-5a808e2a0000bca80137bfd74268a84a-MEl-5a82ec6f0000bca801372ef053a71bdf",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:03+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a808e2a0000bca80137bfd74268a84a",
      "pig:hasObject": "#MEl-5a82ec6f0000bca801372ef053a71bdf"
    },
    {
      "@id": "#RCtn-MEl-5a752ccc0000bca80137479a2e8bab30-MEl-5a808e2a0000bca80137bfd74268a84a",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:04+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "pig:hasObject": "#MEl-5a808e2a0000bca80137bfd74268a84a"
    },
    {
      "@id": "#RCtn-MEl-5a752ccc0000bca80137479a2e8bab30-MEl-5a8009a00000bca80137ef95bc3f643f",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:04+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "pig:hasObject": "#MEl-5a8009a00000bca80137ef95bc3f643f"
    },
    {
      "@id": "#RCtn-MEl-5a752ccc0000bca80137479a2e8bab30-MEl-5a844d820000bca8013750b9a0410b6b",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:04+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "pig:hasObject": "#MEl-5a844d820000bca8013750b9a0410b6b"
    },
    {
      "@id": "#RCtn-MEl-5a752ccc0000bca80137479a2e8bab30-MEl-5a86b8980000bca80137ca6fde1a125e",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:04+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "pig:hasObject": "#MEl-5a86b8980000bca80137ca6fde1a125e"
    },
    {
      "@id": "#RCtn-MEl-5a752ccc0000bca80137479a2e8bab30-MEl-5a87083e0000bca801379bb412523737",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:04+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "pig:hasObject": "#MEl-5a87083e0000bca801379bb412523737"
    },
    {
      "@id": "#RCtn-MEl-5a752ccc0000bca80137479a2e8bab30-MEl-5a82ec6f0000bca801372ef053a71bdf",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:04+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "pig:hasObject": "#MEl-5a82ec6f0000bca801372ef053a71bdf"
    },
    {
      "@id": "#RCtn-MEl-5a752ccc0000bca80137479a2e8bab30-MEl-5a820a3c0000bca801378c9093fb7d80",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:05+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "pig:hasObject": "#MEl-5a820a3c0000bca801378c9093fb7d80"
    },
    {
      "@id": "#RRea-MEl-5a752ccc0000bca80137479a2e8bab30-MEl-5a9ce0310000bca801378176dc4744e8",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:05+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a752ccc0000bca80137479a2e8bab30",
      "pig:hasObject": "#MEl-5a9ce0310000bca801378176dc4744e8"
    },
    {
      "@id": "#RCtn-MEl-5a489c300000bca80137ee1373c16844-MEl-5a752ccc0000bca80137479a2e8bab30",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:05+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a489c300000bca80137ee1373c16844",
      "pig:hasObject": "#MEl-5a752ccc0000bca80137479a2e8bab30"
    },
    {
      "@id": "#RWri-MEl-5a71c4800000bca80137f2aaa7b63000-MEl-5a77385f0000bca80137e1c7dc0b1721",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:06+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a71c4800000bca80137f2aaa7b63000",
      "pig:hasObject": "#MEl-5a77385f0000bca80137e1c7dc0b1721"
    },
    {
      "@id": "#RRea-MEl-5a71c4800000bca80137f2aaa7b63000-MEl-5a77385f0000bca80137e1c7dc0b1721",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:06+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a71c4800000bca80137f2aaa7b63000",
      "pig:hasObject": "#MEl-5a77385f0000bca80137e1c7dc0b1721"
    },
    {
      "@id": "#RWri-MEl-5a71c4800000bca80137f2aaa7b63000-MEl-5a7776c50000bca8013765ae93af9209",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:06+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a71c4800000bca80137f2aaa7b63000",
      "pig:hasObject": "#MEl-5a7776c50000bca8013765ae93af9209"
    },
    {
      "@id": "#RRea-MEl-5a71c4800000bca80137f2aaa7b63000-MEl-5a4dd77b0000bca8013736c6912ad291",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:06+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a71c4800000bca80137f2aaa7b63000",
      "pig:hasObject": "#MEl-5a4dd77b0000bca8013736c6912ad291"
    },
    {
      "@id": "#RRea-MEl-5a71c4800000bca80137f2aaa7b63000-MEl-5a4d6dee0000bca80137c1caf2f42349",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:06+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a71c4800000bca80137f2aaa7b63000",
      "pig:hasObject": "#MEl-5a4d6dee0000bca80137c1caf2f42349"
    },
    {
      "@id": "#RCtn-MEl-5a489c300000bca80137ee1373c16844-MEl-5a71c4800000bca80137f2aaa7b63000",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:07+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a489c300000bca80137ee1373c16844",
      "pig:hasObject": "#MEl-5a71c4800000bca80137f2aaa7b63000"
    },
    {
      "@id": "#RCtn-MEl-606f16ac0000bca801373587fda932b3-MEl-45450be80000c3a801414f280f146c71",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:07+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-606f16ac0000bca801373587fda932b3",
      "pig:hasObject": "#MEl-45450be80000c3a801414f280f146c71"
    },
    {
      "@id": "#RCtn-MEl-606f16ac0000bca801373587fda932b3-MEl-4536b0350000c3a801415986f8ea806a",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:07+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-606f16ac0000bca801373587fda932b3",
      "pig:hasObject": "#MEl-4536b0350000c3a801415986f8ea806a"
    },
    {
      "@id": "#RCtn-MEl-606f16ac0000bca801373587fda932b3-MEl-453facbb0000c3a80141c43d2fb4f5e2",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:07+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-606f16ac0000bca801373587fda932b3",
      "pig:hasObject": "#MEl-453facbb0000c3a80141c43d2fb4f5e2"
    },
    {
      "@id": "#RCtn-MEl-606f16ac0000bca801373587fda932b3-MEl-4543fe900000c3a80141f5253ff13c35",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:08+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-606f16ac0000bca801373587fda932b3",
      "pig:hasObject": "#MEl-4543fe900000c3a80141f5253ff13c35"
    },
    {
      "@id": "#RCtn-MEl-606f16ac0000bca801373587fda932b3-MEl-453d34af0000c3a80141918f84641161",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:08+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-606f16ac0000bca801373587fda932b3",
      "pig:hasObject": "#MEl-453d34af0000c3a80141918f84641161"
    },
    {
      "@id": "#RCtn-MEl-606f16ac0000bca801373587fda932b3-MEl-45a236e00000c3a801410f6503287e16",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:08+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-606f16ac0000bca801373587fda932b3",
      "pig:hasObject": "#MEl-45a236e00000c3a801410f6503287e16"
    },
    {
      "@id": "#RCtn-MEl-606f16ac0000bca801373587fda932b3-MEl-45a3b13c0000c3a801415e97f5bc29d1",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:08+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-606f16ac0000bca801373587fda932b3",
      "pig:hasObject": "#MEl-45a3b13c0000c3a801415e97f5bc29d1"
    },
    {
      "@id": "#RCnc-Iss-ee2abb630000c3a8013987a750219659-MEl-5a8009a00000bca80137ef95bc3f643f",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:56+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-concerns",
      "pig:hasSubject": "#Iss-ee2abb630000c3a8013987a750219659",
      "pig:hasObject": "#MEl-5a8009a00000bca80137ef95bc3f643f"
    },
    {
      "@id": "#RWri-MEl-5a8009a00000bca80137ef95bc3f643f-MEl-5a77385f0000bca80137e1c7dc0b1721",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:08+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a8009a00000bca80137ef95bc3f643f",
      "pig:hasObject": "#MEl-5a77385f0000bca80137e1c7dc0b1721"
    },
    {
      "@id": "#RRea-MEl-5a8009a00000bca80137ef95bc3f643f-MEl-5a77385f0000bca80137e1c7dc0b1721",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:08+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a8009a00000bca80137ef95bc3f643f",
      "pig:hasObject": "#MEl-5a77385f0000bca80137e1c7dc0b1721"
    },
    {
      "@id": "#RWri-MEl-5a8009a00000bca80137ef95bc3f643f-MEl-5a844d820000bca8013750b9a0410b6b",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:09+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a8009a00000bca80137ef95bc3f643f",
      "pig:hasObject": "#MEl-5a844d820000bca8013750b9a0410b6b"
    },
    {
      "@id": "#RWri-MEl-5a8009a00000bca80137ef95bc3f643f-MEl-5a82ec6f0000bca801372ef053a71bdf",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:09+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a8009a00000bca80137ef95bc3f643f",
      "pig:hasObject": "#MEl-5a82ec6f0000bca801372ef053a71bdf"
    },
    {
      "@id": "#RWri-MEl-5a8009a00000bca80137ef95bc3f643f-MEl-5a820a3c0000bca801378c9093fb7d80",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:09+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a8009a00000bca80137ef95bc3f643f",
      "pig:hasObject": "#MEl-5a820a3c0000bca801378c9093fb7d80"
    },
    {
      "@id": "#RCtn-MEl-5a47935a0000bca801377c17f8cb25b0-MEl-608239830000bca801373690c7d2af0f",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:10+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#MEl-608239830000bca801373690c7d2af0f"
    },
    {
      "@id": "#RCtn-MEl-5a47935a0000bca801377c17f8cb25b0-MEl-610b07100000bca80137c10f96c46247",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:10+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#MEl-610b07100000bca80137c10f96c46247"
    },
    {
      "@id": "#RCtn-MEl-5a47935a0000bca801377c17f8cb25b0-MEl-610e0b010000bca80137ac40800bb1b8",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:10+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#MEl-610e0b010000bca80137ac40800bb1b8"
    },
    {
      "@id": "#RRea-MEl-5bcfb01d0000bca80137f303272a5557-MEl-5a52b50c0000bca801377e3d15255f98",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:10+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5bcfb01d0000bca80137f303272a5557",
      "pig:hasObject": "#MEl-5a52b50c0000bca801377e3d15255f98"
    },
    {
      "@id": "#RWri-MEl-5a50d5b60000bca8013781532547ce93-MEl-5a489c300000bca80137ee1373c16844",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:10+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a50d5b60000bca8013781532547ce93",
      "pig:hasObject": "#MEl-5a489c300000bca80137ee1373c16844"
    },
    {
      "@id": "#RRea-MEl-5a50d5b60000bca8013781532547ce93-MEl-5a489c300000bca80137ee1373c16844",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:11+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a50d5b60000bca8013781532547ce93",
      "pig:hasObject": "#MEl-5a489c300000bca80137ee1373c16844"
    },
    {
      "@id": "#RWri-MEl-5a50d5b60000bca8013781532547ce93-MEl-5a52b50c0000bca801377e3d15255f98",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:11+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a50d5b60000bca8013781532547ce93",
      "pig:hasObject": "#MEl-5a52b50c0000bca801377e3d15255f98"
    },
    {
      "@id": "#RRea-MEl-5a50d5b60000bca8013781532547ce93-MEl-5a4c80c20000bca8013753b6999a4da8",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:11+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a50d5b60000bca8013781532547ce93",
      "pig:hasObject": "#MEl-5a4c80c20000bca8013753b6999a4da8"
    },
    {
      "@id": "#RRea-MEl-5a50d5b60000bca8013781532547ce93-MEl-5a51dd920000bca8013770a4395c83fc",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:11+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a50d5b60000bca8013781532547ce93",
      "pig:hasObject": "#MEl-5a51dd920000bca8013770a4395c83fc"
    },
    {
      "@id": "#RCtn-MEl-803fd3750000c3a8013cf1fdb3b26d33-MEl-5a50d5b60000bca8013781532547ce93",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:11+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-803fd3750000c3a8013cf1fdb3b26d33",
      "pig:hasObject": "#MEl-5a50d5b60000bca8013781532547ce93"
    },
    {
      "@id": "#RCtn-MEl-5a47935a0000bca801377c17f8cb25b0-MEl-453862540000c3a801419d91bef48cfd",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:12+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#MEl-453862540000c3a801419d91bef48cfd"
    },
    {
      "@id": "#RCtn-MEl-5a47935a0000bca801377c17f8cb25b0-MEl-45387c0b0000c3a801410aa03f6b9be4",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:12+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#MEl-45387c0b0000c3a801410aa03f6b9be4"
    },
    {
      "@id": "#RCtn-MEl-5a47935a0000bca801377c17f8cb25b0-MEl-4538920b0000c3a801415c67e334b8a1",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:12+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#MEl-4538920b0000c3a801415c67e334b8a1"
    },
    {
      "@id": "#RCtn-MEl-5a47935a0000bca801377c17f8cb25b0-MEl-459b92580000c3a80141cb4acb521ab1",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:13+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#MEl-459b92580000c3a80141cb4acb521ab1"
    },
    {
      "@id": "#RCtn-MEl-5a47935a0000bca801377c17f8cb25b0-MEl-607f13b50000bca80137ba95f11856ab",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:13+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#MEl-607f13b50000bca80137ba95f11856ab"
    },
    {
      "@id": "#RCtn-MEl-5a47935a0000bca801377c17f8cb25b0-MEl-45384cd10000c3a80141c1f85d7c26e6",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:13+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#MEl-45384cd10000c3a80141c1f85d7c26e6"
    },
    {
      "@id": "#RWri-MEl-5a47935a0000bca801377c17f8cb25b0-MEl-5a51dd920000bca8013770a4395c83fc",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:14+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#MEl-5a51dd920000bca8013770a4395c83fc"
    },
    {
      "@id": "#RWri-MEl-5a47935a0000bca801377c17f8cb25b0-MEl-5a4c80c20000bca8013753b6999a4da8",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:14+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#MEl-5a4c80c20000bca8013753b6999a4da8"
    },
    {
      "@id": "#RWri-MEl-5a47935a0000bca801377c17f8cb25b0-MEl-5a489c300000bca80137ee1373c16844",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:14+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a47935a0000bca801377c17f8cb25b0",
      "pig:hasObject": "#MEl-5a489c300000bca80137ee1373c16844"
    },
    {
      "@id": "#RCtn-MEl-5a489c300000bca80137ee1373c16844-MEl-5a9b7a9b0000bca80137d768644696b7",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:14+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a489c300000bca80137ee1373c16844",
      "pig:hasObject": "#MEl-5a9b7a9b0000bca80137d768644696b7"
    },
    {
      "@id": "#RWri-MEl-5a9b7a9b0000bca80137d768644696b7-MEl-5a77385f0000bca80137e1c7dc0b1721",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:14+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a9b7a9b0000bca80137d768644696b7",
      "pig:hasObject": "#MEl-5a77385f0000bca80137e1c7dc0b1721"
    },
    {
      "@id": "#RRea-MEl-5a9b7a9b0000bca80137d768644696b7-MEl-5a77385f0000bca80137e1c7dc0b1721",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:15+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a9b7a9b0000bca80137d768644696b7",
      "pig:hasObject": "#MEl-5a77385f0000bca80137e1c7dc0b1721"
    },
    {
      "@id": "#RWri-MEl-5a9b7a9b0000bca80137d768644696b7-MEl-463289cd0000c3a80141be3fc417034a",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:15+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a9b7a9b0000bca80137d768644696b7",
      "pig:hasObject": "#MEl-463289cd0000c3a80141be3fc417034a"
    },
    {
      "@id": "#RRea-MEl-5a9b7a9b0000bca80137d768644696b7-MEl-463289cd0000c3a80141be3fc417034a",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:15+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a9b7a9b0000bca80137d768644696b7",
      "pig:hasObject": "#MEl-463289cd0000c3a80141be3fc417034a"
    },
    {
      "@id": "#RWri-MEl-5a9b7a9b0000bca80137d768644696b7-MEl-5a9ce0310000bca801378176dc4744e8",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:15+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-writes",
      "pig:hasSubject": "#MEl-5a9b7a9b0000bca80137d768644696b7",
      "pig:hasObject": "#MEl-5a9ce0310000bca801378176dc4744e8"
    },
    {
      "@id": "#RRea-MEl-5a9b7a9b0000bca80137d768644696b7-MEl-5a7776c50000bca8013765ae93af9209",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:16+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-reads",
      "pig:hasSubject": "#MEl-5a9b7a9b0000bca80137d768644696b7",
      "pig:hasObject": "#MEl-5a7776c50000bca8013765ae93af9209"
    },
    {
      "@id": "#RCtn-MEl-5a489c300000bca80137ee1373c16844-MEl-5a7776c50000bca8013765ae93af9209",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:16+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a489c300000bca80137ee1373c16844",
      "pig:hasObject": "#MEl-5a7776c50000bca8013765ae93af9209"
    },
    {
      "@id": "#RCtn-MEl-5a489c300000bca80137ee1373c16844-MEl-5a9ce0310000bca801378176dc4744e8",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:16+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a489c300000bca80137ee1373c16844",
      "pig:hasObject": "#MEl-5a9ce0310000bca801378176dc4744e8"
    },
    {
      "@id": "#RCtn-MEl-5a489c300000bca80137ee1373c16844-MEl-5a4dd77b0000bca8013736c6912ad291",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:16+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a489c300000bca80137ee1373c16844",
      "pig:hasObject": "#MEl-5a4dd77b0000bca8013736c6912ad291"
    },
    {
      "@id": "#RCtn-MEl-5a4c80c20000bca8013753b6999a4da8-MEl-5a4dd77b0000bca8013736c6912ad291",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:16+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a4c80c20000bca8013753b6999a4da8",
      "pig:hasObject": "#MEl-5a4dd77b0000bca8013736c6912ad291"
    },
    {
      "@id": "#RCtn-MEl-5a51dd920000bca8013770a4395c83fc-MEl-5a4dd77b0000bca8013736c6912ad291",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:16+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a51dd920000bca8013770a4395c83fc",
      "pig:hasObject": "#MEl-5a4dd77b0000bca8013736c6912ad291"
    },
    {
      "@id": "#RCtn-MEl-5a489c300000bca80137ee1373c16844-MEl-5a4d6dee0000bca80137c1caf2f42349",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:17+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a489c300000bca80137ee1373c16844",
      "pig:hasObject": "#MEl-5a4d6dee0000bca80137c1caf2f42349"
    },
    {
      "@id": "#RCtn-MEl-5a489c300000bca80137ee1373c16844-MEl-5a77385f0000bca80137e1c7dc0b1721",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:17+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a489c300000bca80137ee1373c16844",
      "pig:hasObject": "#MEl-5a77385f0000bca80137e1c7dc0b1721"
    },
    {
      "@id": "#RCtn-MEl-803fd3750000c3a8013cf1fdb3b26d33-MEl-5a489c300000bca80137ee1373c16844",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:17+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-803fd3750000c3a8013cf1fdb3b26d33",
      "pig:hasObject": "#MEl-5a489c300000bca80137ee1373c16844"
    },
    {
      "@id": "#RCtn-MEl-5a4c80c20000bca8013753b6999a4da8-MEl-5a4d6dee0000bca80137c1caf2f42349",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:18+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a4c80c20000bca8013753b6999a4da8",
      "pig:hasObject": "#MEl-5a4d6dee0000bca80137c1caf2f42349"
    },
    {
      "@id": "#RCtn-MEl-5a4c80c20000bca8013753b6999a4da8-MEl-5a4cfa830000bca801370d837f761f3e",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:18+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a4c80c20000bca8013753b6999a4da8",
      "pig:hasObject": "#MEl-5a4cfa830000bca801370d837f761f3e"
    },
    {
      "@id": "#RCtn-MEl-5a4c80c20000bca8013753b6999a4da8-MEl-5a4d2bd00000bca80137a3f233cdffeb",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:18+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a4c80c20000bca8013753b6999a4da8",
      "pig:hasObject": "#MEl-5a4d2bd00000bca80137a3f233cdffeb"
    },
    {
      "@id": "#RCtn-MEl-803fd3750000c3a8013cf1fdb3b26d33-MEl-5a4c80c20000bca8013753b6999a4da8",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:19+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-803fd3750000c3a8013cf1fdb3b26d33",
      "pig:hasObject": "#MEl-5a4c80c20000bca8013753b6999a4da8"
    },
    {
      "@id": "#RCtn-MEl-5a52b50c0000bca801377e3d15255f98-MEl-5bcf35cf0000bca8013776d68023612a",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:19+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a52b50c0000bca801377e3d15255f98",
      "pig:hasObject": "#MEl-5bcf35cf0000bca8013776d68023612a"
    },
    {
      "@id": "#RCtn-MEl-803fd3750000c3a8013cf1fdb3b26d33-MEl-5a52b50c0000bca801377e3d15255f98",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:19+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-803fd3750000c3a8013cf1fdb3b26d33",
      "pig:hasObject": "#MEl-5a52b50c0000bca801377e3d15255f98"
    },
    {
      "@id": "#R-vxkoenpgAX6s6PxskSWlYPN8e4y",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:13:56+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-concerns",
      "pig:hasSubject": "#Iss-eee2d4e00000c3a801394148dcc58a52",
      "pig:hasObject": "#MEl-5a51dd920000bca8013770a4395c83fc"
    },
    {
      "@id": "#RCtn-MEl-5a51dd920000bca8013770a4395c83fc-MEl-5a4d6dee0000bca80137c1caf2f42349",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:19+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-5a51dd920000bca8013770a4395c83fc",
      "pig:hasObject": "#MEl-5a4d6dee0000bca80137c1caf2f42349"
    },
    {
      "@id": "#RCtn-MEl-803fd3750000c3a8013cf1fdb3b26d33-MEl-5a51dd920000bca8013770a4395c83fc",
      "@type": "pig:Relationship",
      "dcterms:modified": "2017-06-19T20:14:19+02:00",
      "dcterms:creator": "od",
      "pig.hasClass": "#SC-contains",
      "pig:hasSubject": "#MEl-803fd3750000c3a8013cf1fdb3b26d33",
      "pig:hasObject": "#MEl-5a51dd920000bca8013770a4395c83fc"
    },
    {
      "@id": "#N-HierarchyRoot",
      "@type": "pig:Organizer",
      "pig:hasChild": [
        {
          "@id": "#SH-Fld-59c8a7730000bca80137509a49b1218b-info",
          "@type": "pig:Organizer",
          "dcterms:modified": "2017-06-19T20:14:48+02:00",
          "pig:hasElement": "#Fld-59c8a7730000bca80137509a49b1218b-info"
        },
        {
          "@id": "#SH-Fld-5a5f54090000bca801375b04a668f1a7",
          "@type": "pig:Organizer",
          "dcterms:modified": "2017-06-19T20:14:47+02:00",
          "pig:hasElement": "#Fld-5a5f54090000bca801375b04a668f1a7",
          "pig:hasChild": [
            {
              "@id": "#SH-Pln-27420ffc0000c3a8013ab527ca1b71f5",
              "@type": "pig:Organizer",
              "dcterms:modified": "2017-06-19T20:14:47+02:00",
              "pig:hasElement": "#Pln-27420ffc0000c3a8013ab527ca1b71f5"
            },
            {
              "@id": "#SH-Pln-5a4755dd0000bca801375293a62c90a8",
              "@type": "pig:Organizer",
              "dcterms:modified": "2017-06-19T20:14:47+02:00",
              "pig:hasElement": "#Pln-5a4755dd0000bca801375293a62c90a8"
            },
            {
              "@id": "#SH-Pln-5a6cdea50000bca80137d6b2d6e8a3a0",
              "@type": "pig:Organizer",
              "dcterms:modified": "2017-06-19T20:14:47+02:00",
              "pig:hasElement": "#Pln-5a6cdea50000bca80137d6b2d6e8a3a0"
            },
            {
              "@id": "#SH-Pln-5a7f99af0000bca8013754f2ef12d3e5",
              "@type": "pig:Organizer",
              "dcterms:modified": "2017-06-19T20:14:47+02:00",
              "pig:hasElement": "#Pln-5a7f99af0000bca8013754f2ef12d3e5"
            }
          ]
        },
        {
          "@id": "#SH-Fld-5af3154d0000bca801379748537d7388",
          "@type": "pig:Organizer",
          "dcterms:modified": "2017-06-19T20:14:46+02:00",
          "pig:hasElement": "#Fld-5af3154d0000bca801379748537d7388",
          "pig:hasChild": [
            {
              "@id": "#SH-Fld-5b6a99f10000bca80137b78cda65fc07",
              "@type": "pig:Organizer",
              "dcterms:modified": "2017-06-19T20:14:46+02:00",
              "pig:hasElement": "#Fld-5b6a99f10000bca80137b78cda65fc07",
              "pig:hasChild": [
                {
                  "@id": "#SH-Pln-606e76c70000bca801376ec3133a1181",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:46+02:00",
                  "pig:hasElement": "#Pln-606e76c70000bca801376ec3133a1181"
                },
                {
                  "@id": "#SH-Pln-45a1c8930000c3a801414cd1eaa70b5a",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:46+02:00",
                  "pig:hasElement": "#Pln-45a1c8930000c3a801414cd1eaa70b5a"
                },
                {
                  "@id": "#SH-Pln-5af364560000bca80137b84017f4e832",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:46+02:00",
                  "pig:hasElement": "#Pln-5af364560000bca80137b84017f4e832"
                }
              ]
            }
          ]
        },
        {
          "@id": "#SH-Fld-5b8e98550000bca801371afb0c7b671b",
          "@type": "pig:Organizer",
          "dcterms:modified": "2017-06-19T20:14:43+02:00",
          "pig:hasElement": "#Fld-5b8e98550000bca801371afb0c7b671b",
          "pig:hasChild": [
            {
              "@id": "#SH-Fld-d1b1698a0000c3a801505b1b5698b7a1",
              "@type": "pig:Organizer",
              "dcterms:modified": "2017-06-19T20:14:43+02:00",
              "pig:hasElement": "#Fld-d1b1698a0000c3a801505b1b5698b7a1",
              "pig:hasChild": [
                {
                  "@id": "#SH-Req-d1c895230000c3a80150f8afd049f738",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-d1c895230000c3a80150f8afd049f738"
                },
                {
                  "@id": "#SH-Req-d1d42a6a0000c3a8015091ec8d149b93",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-d1d42a6a0000c3a8015091ec8d149b93"
                },
                {
                  "@id": "#SH-Req-d1cd7f370000c3a8015095e6ee21aab7",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-d1cd7f370000c3a8015095e6ee21aab7"
                },
                {
                  "@id": "#SH-Req-5ba3512b0000bca801371cc0617eb4c1",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-5ba3512b0000bca801371cc0617eb4c1"
                },
                {
                  "@id": "#SH-Req-5b8fbb300000bca80137c73e3ce4c737",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-5b8fbb300000bca80137c73e3ce4c737"
                }
              ]
            },
            {
              "@id": "#SH-Fld-d1b1d6c60000c3a80150fe9ce40e6588",
              "@type": "pig:Organizer",
              "dcterms:modified": "2017-06-19T20:14:43+02:00",
              "pig:hasElement": "#Fld-d1b1d6c60000c3a80150fe9ce40e6588",
              "pig:hasChild": [
                {
                  "@id": "#SH-Req-5b944fc70000bca8013763f44fdc0e03",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-5b944fc70000bca8013763f44fdc0e03"
                },
                {
                  "@id": "#SH-Req-5ba140d60000bca801372b09f9888eca",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-5ba140d60000bca801372b09f9888eca"
                },
                {
                  "@id": "#SH-Req-ee452cf20000c3a8014035290669304d",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-ee452cf20000c3a8014035290669304d"
                },
                {
                  "@id": "#SH-Req-ee43fc4c0000c3a8014063d42c77767f",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-ee43fc4c0000c3a8014063d42c77767f"
                },
                {
                  "@id": "#SH-Req-5b9124bc0000bca80137fa2ce86f5eca",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-5b9124bc0000bca80137fa2ce86f5eca"
                },
                {
                  "@id": "#SH-Req-5b9e68530000bca801371362c49d2d08",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-5b9e68530000bca801371362c49d2d08"
                }
              ]
            },
            {
              "@id": "#SH-Fld-d1b314890000c3a80150b71a1473d374",
              "@type": "pig:Organizer",
              "dcterms:modified": "2017-06-19T20:14:43+02:00",
              "pig:hasElement": "#Fld-d1b314890000c3a80150b71a1473d374",
              "pig:hasChild": [
                {
                  "@id": "#SH-Req-eea1cd500000c3a80140fe00109eb7f4",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-eea1cd500000c3a80140fe00109eb7f4"
                },
                {
                  "@id": "#SH-Req-5b95fae40000bca801372becc933682d",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-5b95fae40000bca801372becc933682d"
                },
                {
                  "@id": "#SH-Req-5b9ab8a50000bca801377ad0be3bbc89",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-5b9ab8a50000bca801377ad0be3bbc89"
                },
                {
                  "@id": "#SH-Req-728c69c80018b1a8014b974542c36edc",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-728c69c80018b1a8014b974542c36edc"
                },
                {
                  "@id": "#SH-Req-5b9c950e0000bca801374f16615247b9",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:43+02:00",
                  "pig:hasElement": "#Req-5b9c950e0000bca801374f16615247b9"
                }
              ]
            }
          ]
        },
        {
          "@id": "#SH-Fld-59c8a7730000bca80137509a49b1218b",
          "@type": "pig:Organizer",
          "dcterms:modified": "2017-06-19T20:14:20+02:00",
          "pig:hasElement": "#Fld-59c8a7730000bca80137509a49b1218b",
          "pig:hasChild": [
            {
              "@id": "#SH-MEl-5bd6bd890000bca8013739588a3f43d6-1",
              "@type": "pig:Organizer",
              "dcterms:modified": "2017-06-19T20:14:20+02:00",
              "pig:hasElement": "#MEl-5bd6bd890000bca8013739588a3f43d6"
            },
            {
              "@id": "#SH-MEl-5bcfb01d0000bca80137f303272a5557-10",
              "@type": "pig:Organizer",
              "dcterms:modified": "2017-06-19T20:14:20+02:00",
              "pig:hasElement": "#MEl-5bcfb01d0000bca80137f303272a5557"
            },
            {
              "@id": "#SH-MEl-803fd3750000c3a8013cf1fdb3b26d33-11",
              "@type": "pig:Organizer",
              "dcterms:modified": "2017-06-19T20:14:20+02:00",
              "pig:hasElement": "#MEl-803fd3750000c3a8013cf1fdb3b26d33",
              "pig:hasChild": [
                {
                  "@id": "#SH-MEl-5a489c300000bca80137ee1373c16844-12",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:20+02:00",
                  "pig:hasElement": "#MEl-5a489c300000bca80137ee1373c16844",
                  "pig:hasChild": [
                    {
                      "@id": "#SH-MEl-5a7776c50000bca8013765ae93af9209-13",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:20+02:00",
                      "pig:hasElement": "#MEl-5a7776c50000bca8013765ae93af9209"
                    },
                    {
                      "@id": "#SH-MEl-5a76365c0000bca8013776e91afd1e8e-14",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:20+02:00",
                      "pig:hasElement": "#MEl-5a76365c0000bca8013776e91afd1e8e"
                    },
                    {
                      "@id": "#SH-MEl-5a9ce0310000bca801378176dc4744e8-15",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:20+02:00",
                      "pig:hasElement": "#MEl-5a9ce0310000bca801378176dc4744e8"
                    },
                    {
                      "@id": "#SH-MEl-5a752ccc0000bca80137479a2e8bab30-16",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:20+02:00",
                      "pig:hasElement": "#MEl-5a752ccc0000bca80137479a2e8bab30",
                      "pig:hasChild": [
                        {
                          "@id": "#SH-MEl-5a85347c0000bca80137ad485c7cd330-17",
                          "@type": "pig:Organizer",
                          "dcterms:modified": "2017-06-19T20:14:20+02:00",
                          "pig:hasElement": "#MEl-5a85347c0000bca80137ad485c7cd330",
                          "pig:hasChild": [
                            {
                              "@id": "#SH-MEl-5b2f95ec0000bca8013709bfa81d701f-18",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-5b2f95ec0000bca8013709bfa81d701f"
                            },
                            {
                              "@id": "#SH-MEl-45450be80000c3a801414f280f146c71-19",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-45450be80000c3a801414f280f146c71"
                            },
                            {
                              "@id": "#SH-MEl-4536b0350000c3a801415986f8ea806a-20",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-4536b0350000c3a801415986f8ea806a"
                            },
                            {
                              "@id": "#SH-MEl-5b149eab0000bca80137aad99b6eea7b-21",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-5b149eab0000bca80137aad99b6eea7b"
                            },
                            {
                              "@id": "#SH-MEl-5b08ed8d0000bca8013719f554353b0e-22",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-5b08ed8d0000bca8013719f554353b0e"
                            },
                            {
                              "@id": "#SH-MEl-453dfb670000c3a8014191107df4565e-23",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-453dfb670000c3a8014191107df4565e"
                            },
                            {
                              "@id": "#SH-MEl-5b094f8a0000bca801374c798a6587ad-24",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-5b094f8a0000bca801374c798a6587ad"
                            },
                            {
                              "@id": "#SH-MEl-45428b930000c3a80141e28b7d4b5ae5-25",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-45428b930000c3a80141e28b7d4b5ae5"
                            },
                            {
                              "@id": "#SH-MEl-5b078fa50000bca80137f36ed05c43cb-26",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-5b078fa50000bca80137f36ed05c43cb"
                            },
                            {
                              "@id": "#SH-MEl-453facbb0000c3a80141c43d2fb4f5e2-27",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-453facbb0000c3a80141c43d2fb4f5e2"
                            },
                            {
                              "@id": "#SH-MEl-5b2d29070000bca801378a6c020cf8f5-28",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-5b2d29070000bca801378a6c020cf8f5"
                            },
                            {
                              "@id": "#SH-MEl-5b1750f80000bca801373b2d143d7478-29",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-5b1750f80000bca801373b2d143d7478"
                            },
                            {
                              "@id": "#SH-MEl-5b2ddad80000bca80137c44d62ba97d8-30",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-5b2ddad80000bca80137c44d62ba97d8"
                            },
                            {
                              "@id": "#SH-MEl-5b2449180000bca8013722c01c9d35a5-31",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-5b2449180000bca8013722c01c9d35a5"
                            },
                            {
                              "@id": "#SH-MEl-5b0839b90000bca801376dcca41ca7d0-32",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-5b0839b90000bca801376dcca41ca7d0"
                            },
                            {
                              "@id": "#SH-MEl-5b07e6aa0000bca8013797aad9be69ae-33",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-5b07e6aa0000bca8013797aad9be69ae"
                            },
                            {
                              "@id": "#SH-MEl-4543fe900000c3a80141f5253ff13c35-34",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-4543fe900000c3a80141f5253ff13c35"
                            },
                            {
                              "@id": "#SH-MEl-453d34af0000c3a80141918f84641161-35",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-453d34af0000c3a80141918f84641161"
                            }
                          ]
                        },
                        {
                          "@id": "#SH-MEl-5a808e2a0000bca80137bfd74268a84a-36",
                          "@type": "pig:Organizer",
                          "dcterms:modified": "2017-06-19T20:14:21+02:00",
                          "pig:hasElement": "#MEl-5a808e2a0000bca80137bfd74268a84a"
                        },
                        {
                          "@id": "#SH-MEl-5a844d820000bca8013750b9a0410b6b-37",
                          "@type": "pig:Organizer",
                          "dcterms:modified": "2017-06-19T20:14:21+02:00",
                          "pig:hasElement": "#MEl-5a844d820000bca8013750b9a0410b6b"
                        },
                        {
                          "@id": "#SH-MEl-5a8009a00000bca80137ef95bc3f643f-38",
                          "@type": "pig:Organizer",
                          "dcterms:modified": "2017-06-19T20:14:21+02:00",
                          "pig:hasElement": "#MEl-5a8009a00000bca80137ef95bc3f643f"
                        },
                        {
                          "@id": "#SH-MEl-5a87083e0000bca801379bb412523737-39",
                          "@type": "pig:Organizer",
                          "dcterms:modified": "2017-06-19T20:14:21+02:00",
                          "pig:hasElement": "#MEl-5a87083e0000bca801379bb412523737"
                        },
                        {
                          "@id": "#SH-MEl-5a82ec6f0000bca801372ef053a71bdf-40",
                          "@type": "pig:Organizer",
                          "dcterms:modified": "2017-06-19T20:14:21+02:00",
                          "pig:hasElement": "#MEl-5a82ec6f0000bca801372ef053a71bdf"
                        },
                        {
                          "@id": "#SH-MEl-5a86b8980000bca80137ca6fde1a125e-41",
                          "@type": "pig:Organizer",
                          "dcterms:modified": "2017-06-19T20:14:21+02:00",
                          "pig:hasElement": "#MEl-5a86b8980000bca80137ca6fde1a125e"
                        },
                        {
                          "@id": "#SH-MEl-5a820a3c0000bca801378c9093fb7d80-42",
                          "@type": "pig:Organizer",
                          "dcterms:modified": "2017-06-19T20:14:21+02:00",
                          "pig:hasElement": "#MEl-5a820a3c0000bca801378c9093fb7d80"
                        }
                      ]
                    },
                    {
                      "@id": "#SH-MEl-5a71c4800000bca80137f2aaa7b63000-43",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5a71c4800000bca80137f2aaa7b63000",
                      "pig:hasChild": [
                        {
                          "@id": "#SH-FQgXJn1XkNFtoJfzE9INisIYifq",
                          "@type": "pig:Organizer",
                          "dcterms:modified": "2017-06-19T20:14:21+02:00",
                          "pig:hasElement": "#MEl-606f16ac0000bca801373587fda932b3",
                          "pig:hasChild": [
                            {
                              "@id": "#SH-uCdHBtCyX6hvm29RQnGo9zcd3OI",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-45450be80000c3a801414f280f146c71"
                            },
                            {
                              "@id": "#SH-O797STWMNt59GjyRpy8CQgp6Deo",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-4536b0350000c3a801415986f8ea806a"
                            },
                            {
                              "@id": "#SH-pkrTYLvHEXGE5n3XT3kwOzWpRPr",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-453facbb0000c3a80141c43d2fb4f5e2"
                            },
                            {
                              "@id": "#SH-wRzqOjw6Ob6TAfaCorCQ2BicqM3",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-4543fe900000c3a80141f5253ff13c35"
                            },
                            {
                              "@id": "#SH-pRuyfnegfxL7Pfq3S4HyInkjJLS",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-453d34af0000c3a80141918f84641161"
                            },
                            {
                              "@id": "#SH-54q5IJNgLaHAFR03snGsSWwcCfm",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-45a236e00000c3a801410f6503287e16"
                            },
                            {
                              "@id": "#SH-dUbVcCseAuR93ODSCP2VFObou2U",
                              "@type": "pig:Organizer",
                              "dcterms:modified": "2017-06-19T20:14:21+02:00",
                              "pig:hasElement": "#MEl-45a3b13c0000c3a801415e97f5bc29d1"
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "@id": "#SH-MEl-5a4dd77b0000bca8013736c6912ad291-44",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5a4dd77b0000bca8013736c6912ad291"
                    },
                    {
                      "@id": "#SH-MEl-5a99c89c0000bca801375d44cf9a50ca-45",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5a99c89c0000bca801375d44cf9a50ca"
                    },
                    {
                      "@id": "#SH-MEl-5a9929510000bca80137d23c81f1ca54-46",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5a9929510000bca80137d23c81f1ca54"
                    },
                    {
                      "@id": "#SH-MEl-5c29fb8e0000bca80137eb9734c99bfd-47",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5c29fb8e0000bca80137eb9734c99bfd"
                    },
                    {
                      "@id": "#SH-MEl-5a77385f0000bca80137e1c7dc0b1721-48",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5a77385f0000bca80137e1c7dc0b1721"
                    },
                    {
                      "@id": "#SH-MEl-5a9888810000bca801375410ce1cc142-49",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5a9888810000bca801375410ce1cc142"
                    },
                    {
                      "@id": "#SH-MEl-5a4d6dee0000bca80137c1caf2f42349-50",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5a4d6dee0000bca80137c1caf2f42349"
                    },
                    {
                      "@id": "#SH-MEl-5a9b7a9b0000bca80137d768644696b7-51",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5a9b7a9b0000bca80137d768644696b7"
                    },
                    {
                      "@id": "#SH-MEl-463289cd0000c3a80141be3fc417034a-52",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-463289cd0000c3a80141be3fc417034a"
                    }
                  ]
                },
                {
                  "@id": "#SH-MEl-5a4c80c20000bca8013753b6999a4da8-53",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-5a4c80c20000bca8013753b6999a4da8",
                  "pig:hasChild": [
                    {
                      "@id": "#SH-MEl-5a4dd77b0000bca8013736c6912ad291-54",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5a4dd77b0000bca8013736c6912ad291"
                    },
                    {
                      "@id": "#SH-MEl-5a4cfa830000bca801370d837f761f3e-55",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5a4cfa830000bca801370d837f761f3e"
                    },
                    {
                      "@id": "#SH-MEl-5a4d2bd00000bca80137a3f233cdffeb-56",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5a4d2bd00000bca80137a3f233cdffeb"
                    },
                    {
                      "@id": "#SH-MEl-5a4d6dee0000bca80137c1caf2f42349-57",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5a4d6dee0000bca80137c1caf2f42349"
                    }
                  ]
                },
                {
                  "@id": "#SH-MEl-5a52b50c0000bca801377e3d15255f98-58",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-5a52b50c0000bca801377e3d15255f98",
                  "pig:hasChild": [
                    {
                      "@id": "#SH-MEl-5bcf35cf0000bca8013776d68023612a-59",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5bcf35cf0000bca8013776d68023612a"
                    }
                  ]
                },
                {
                  "@id": "#SH-MEl-5a51dd920000bca8013770a4395c83fc-60",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-5a51dd920000bca8013770a4395c83fc",
                  "pig:hasChild": [
                    {
                      "@id": "#SH-MEl-5a4dd77b0000bca8013736c6912ad291-61",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5a4dd77b0000bca8013736c6912ad291"
                    },
                    {
                      "@id": "#SH-MEl-5a4d6dee0000bca80137c1caf2f42349-62",
                      "@type": "pig:Organizer",
                      "dcterms:modified": "2017-06-19T20:14:21+02:00",
                      "pig:hasElement": "#MEl-5a4d6dee0000bca80137c1caf2f42349"
                    }
                  ]
                },
                {
                  "@id": "#SH-MEl-5a50d5b60000bca8013781532547ce93-63",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-5a50d5b60000bca8013781532547ce93"
                }
              ]
            },
            {
              "@id": "#SH-MEl-5a47935a0000bca801377c17f8cb25b0-64",
              "@type": "pig:Organizer",
              "dcterms:modified": "2017-06-19T20:14:21+02:00",
              "pig:hasElement": "#MEl-5a47935a0000bca801377c17f8cb25b0",
              "pig:hasChild": [
                {
                  "@id": "#SH-MEl-608177820000bca801379179ebf3b6aa-65",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-608177820000bca801379179ebf3b6aa"
                },
                {
                  "@id": "#SH-MEl-611366530000bca80137a97f194e96a3-66",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-611366530000bca80137a97f194e96a3"
                },
                {
                  "@id": "#SH-MEl-453862540000c3a801419d91bef48cfd-67",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-453862540000c3a801419d91bef48cfd"
                },
                {
                  "@id": "#SH-MEl-45387c0b0000c3a801410aa03f6b9be4-68",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-45387c0b0000c3a801410aa03f6b9be4"
                },
                {
                  "@id": "#SH-MEl-4538920b0000c3a801415c67e334b8a1-69",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-4538920b0000c3a801415c67e334b8a1"
                },
                {
                  "@id": "#SH-MEl-608239830000bca801373690c7d2af0f-70",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-608239830000bca801373690c7d2af0f"
                },
                {
                  "@id": "#SH-MEl-610b07100000bca80137c10f96c46247-71",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-610b07100000bca80137c10f96c46247"
                },
                {
                  "@id": "#SH-MEl-610e0b010000bca80137ac40800bb1b8-72",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-610e0b010000bca80137ac40800bb1b8"
                },
                {
                  "@id": "#SH-MEl-459b92580000c3a80141cb4acb521ab1-73",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-459b92580000c3a80141cb4acb521ab1"
                },
                {
                  "@id": "#SH-MEl-45384cd10000c3a80141c1f85d7c26e6-74",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-45384cd10000c3a80141c1f85d7c26e6"
                },
                {
                  "@id": "#SH-MEl-607f13b50000bca80137ba95f11856ab-75",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2017-06-19T20:14:21+02:00",
                  "pig:hasElement": "#MEl-607f13b50000bca80137ba95f11856ab"
                }
              ]
            }
          ]
        },
        {
          "@id": "#N-k9qMB6fnxPTk942dvPKdyvnwnoQ",
          "@type": "pig:Organizer",
          "dcterms:modified": "2018-05-08T13:06:13+02:00",
          "pig:hasElement": "#Fld-ef47e6970000c3a80139dc747c5df319",
          "pig:hasChild": [
            {
              "@id": "#N-MEqCD8nv2O5KMxX6aRPiL1yvFjO",
              "@type": "pig:Organizer",
              "dcterms:modified": "2018-05-08T13:06:13+02:00",
              "pig:hasElement": "#Fld-ee29463e0000c3a80139627bbced50ae",
              "pig:hasChild": [
                {
                  "@id": "#N-dFKUyr9Ol35NJuTx6Eru1xqUQoP",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2018-05-08T13:06:13+02:00",
                  "pig:hasElement": "#Iss-ee2abb630000c3a8013987a750219659"
                }
              ]
            },
            {
              "@id": "#N-6WphHL275dOAkBU1GxMTrKQ83rV",
              "@type": "pig:Organizer",
              "dcterms:modified": "2018-05-08T13:06:13+02:00",
              "pig:hasElement": "#Fld-ee2a15040000c3a80139d27de6704f15",
              "pig:hasChild": [
                {
                  "@id": "#N-0YdQoA5LUWfaG8QElShFdROs667",
                  "@type": "pig:Organizer",
                  "dcterms:modified": "2018-05-08T13:06:13+02:00",
                  "pig:hasElement": "#Iss-eee2d4e00000c3a801394148dcc58a52"
                }
              ]
            }
          ]
        },
        {
          "@id": "#N-FolderGlossary-8001804519",
          "@type": "pig:Organizer",
          "dcterms:modified": "2025-06-09T07:17:18.410Z",
          "pig:hasElement": "#FolderGlossary-8001804519",
          "pig:hasChild": [
            {
              "@id": "#N-11992826682",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a7776c50000bca8013765ae93af9209"
            },
            {
              "@id": "#N-11698393655",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a76365c0000bca8013776e91afd1e8e"
            },
            {
              "@id": "#N-9509306014",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-608177820000bca801379179ebf3b6aa"
            },
            {
              "@id": "#N-11325426083",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-611366530000bca80137a97f194e96a3"
            },
            {
              "@id": "#N-8496575153",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5bd6bd890000bca8013739588a3f43d6"
            },
            {
              "@id": "#N-10335555685",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a9ce0310000bca801378176dc4744e8"
            },
            {
              "@id": "#N-10246963513",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5b2f95ec0000bca8013709bfa81d701f"
            },
            {
              "@id": "#N-11264518815",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-453862540000c3a801419d91bef48cfd"
            },
            {
              "@id": "#N-9160779324",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-45387c0b0000c3a801410aa03f6b9be4"
            },
            {
              "@id": "#N-10632367516",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a85347c0000bca80137ad485c7cd330"
            },
            {
              "@id": "#N-11985572692",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a808e2a0000bca80137bfd74268a84a"
            },
            {
              "@id": "#N-11883342810",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a752ccc0000bca80137479a2e8bab30"
            },
            {
              "@id": "#N-9244525526",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-4538920b0000c3a801415c67e334b8a1"
            },
            {
              "@id": "#N-10798294875",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a71c4800000bca80137f2aaa7b63000"
            },
            {
              "@id": "#N-11439696753",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-606f16ac0000bca801373587fda932b3"
            },
            {
              "@id": "#N-11359729878",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a4dd77b0000bca8013736c6912ad291"
            },
            {
              "@id": "#N-8149704192",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-45450be80000c3a801414f280f146c71"
            },
            {
              "@id": "#N-10286201224",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-4536b0350000c3a801415986f8ea806a"
            },
            {
              "@id": "#N-10770729255",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a844d820000bca8013750b9a0410b6b"
            },
            {
              "@id": "#N-8165948670",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a489c300000bca80137ee1373c16844"
            },
            {
              "@id": "#N-12138919772",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a4c80c20000bca8013753b6999a4da8"
            },
            {
              "@id": "#N-11028593111",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a99c89c0000bca801375d44cf9a50ca"
            },
            {
              "@id": "#N-10217328855",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a8009a00000bca80137ef95bc3f643f"
            },
            {
              "@id": "#N-10525716415",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a87083e0000bca801379bb412523737"
            },
            {
              "@id": "#N-11929615658",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5b149eab0000bca80137aad99b6eea7b"
            },
            {
              "@id": "#N-8708504350",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a52b50c0000bca801377e3d15255f98"
            },
            {
              "@id": "#N-8947132181",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5b08ed8d0000bca8013719f554353b0e"
            },
            {
              "@id": "#N-11899911847",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a9929510000bca80137d23c81f1ca54"
            },
            {
              "@id": "#N-8706154690",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5bcf35cf0000bca8013776d68023612a"
            },
            {
              "@id": "#N-11110633939",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-453dfb670000c3a8014191107df4565e"
            },
            {
              "@id": "#N-10422773061",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5b094f8a0000bca801374c798a6587ad"
            },
            {
              "@id": "#N-9207557458",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-45428b930000c3a80141e28b7d4b5ae5"
            },
            {
              "@id": "#N-8475769123",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5b078fa50000bca80137f36ed05c43cb"
            },
            {
              "@id": "#N-9488170768",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5c29fb8e0000bca80137eb9734c99bfd"
            },
            {
              "@id": "#N-10961176369",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a82ec6f0000bca801372ef053a71bdf"
            },
            {
              "@id": "#N-10222646501",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-608239830000bca801373690c7d2af0f"
            },
            {
              "@id": "#N-9870789565",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-610b07100000bca80137c10f96c46247"
            },
            {
              "@id": "#N-10780505608",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a86b8980000bca80137ca6fde1a125e"
            },
            {
              "@id": "#N-7987935753",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-610e0b010000bca80137ac40800bb1b8"
            },
            {
              "@id": "#N-10742722363",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-453facbb0000c3a80141c43d2fb4f5e2"
            },
            {
              "@id": "#N-11576683570",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a51dd920000bca8013770a4395c83fc"
            },
            {
              "@id": "#N-12103498960",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5bcfb01d0000bca80137f303272a5557"
            },
            {
              "@id": "#N-9767419742",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a50d5b60000bca8013781532547ce93"
            },
            {
              "@id": "#N-11624385924",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-803fd3750000c3a8013cf1fdb3b26d33"
            },
            {
              "@id": "#N-10581808145",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a77385f0000bca80137e1c7dc0b1721"
            },
            {
              "@id": "#N-12070675378",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5b2d29070000bca801378a6c020cf8f5"
            },
            {
              "@id": "#N-10254678604",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5b1750f80000bca801373b2d143d7478"
            },
            {
              "@id": "#N-11318840750",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-459b92580000c3a80141cb4acb521ab1"
            },
            {
              "@id": "#N-10697245591",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5b2ddad80000bca80137c44d62ba97d8"
            },
            {
              "@id": "#N-9425292180",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5b2449180000bca8013722c01c9d35a5"
            },
            {
              "@id": "#N-10690146030",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a4cfa830000bca801370d837f761f3e"
            },
            {
              "@id": "#N-10305579835",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a9888810000bca801375410ce1cc142"
            },
            {
              "@id": "#N-8693729440",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5b0839b90000bca801376dcca41ca7d0"
            },
            {
              "@id": "#N-9531538611",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-45384cd10000c3a80141c1f85d7c26e6"
            },
            {
              "@id": "#N-10437899675",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5b07e6aa0000bca8013797aad9be69ae"
            },
            {
              "@id": "#N-11635797126",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-607f13b50000bca80137ba95f11856ab"
            },
            {
              "@id": "#N-8254619229",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a820a3c0000bca801378c9093fb7d80"
            },
            {
              "@id": "#N-10074645837",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a4d2bd00000bca80137a3f233cdffeb"
            },
            {
              "@id": "#N-10455795887",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a4d6dee0000bca80137c1caf2f42349"
            },
            {
              "@id": "#N-9563063161",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-4543fe900000c3a80141f5253ff13c35"
            },
            {
              "@id": "#N-10872481972",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-453d34af0000c3a80141918f84641161"
            },
            {
              "@id": "#N-11412566754",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a47935a0000bca801377c17f8cb25b0"
            },
            {
              "@id": "#N-10637362482",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-45a236e00000c3a801410f6503287e16"
            },
            {
              "@id": "#N-8326605989",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-45a3b13c0000c3a801415e97f5bc29d1"
            },
            {
              "@id": "#N-10093957736",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-5a9b7a9b0000bca80137d768644696b7"
            },
            {
              "@id": "#N-10031576033",
              "@type": "pig:Organizer",
              "dcterms:modified": "2025-06-09T07:17:18.410Z",
              "pig:hasElement": "#MEl-463289cd0000c3a80141be3fc417034a"
            }
          ]
        }
      ]
    }
  ]
}