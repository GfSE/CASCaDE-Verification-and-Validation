{
  "@context": {
    "@base": "https://specif.de/examples/09_Very-Simple-Model-FMC-with-Requirements.specif.zip",
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
  "@id": "#ACP-Very-Simple-Model-FMC-with-Requirements",
  "dcterms:modified": "2025-06-06T09:26:56.193Z",
  "@graph": [
    {
      "@id": "#PC-Name",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2018-05-10T11:54:00+01:00",
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
      "dcterms:modified": "2021-02-23T08:59:00+02:00",
      "dcterms:title": "rdfs:comment",
      "dcterms:description": "An account of the resource (source: http://dublincore.org/documents/dcmi-terms/). Descriptive text represented in plain or rich text using XHTML or Markdown. SHOULD include only content that is valid and suitable inside an XHTML &lt;div&gt; element (source: http://open-services.net/).",
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
      "@id": "#PC-Priority",
      "@type": "pig:propertyClass",
      "dcterms:modified": "2020-03-26T22:59:00+02:00",
      "dcterms:title": "SpecIF:Priority",
      "dcterms:description": "The 'Priority' of the resource.",
      "sh:datatype": "xs:string",
      "sh:minCount": "0",
      "sh:maxCount": "1"
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
      "@id": "#RC-View",
      "@type": "pig:organizerClass",
      "dcterms:modified": "2018-05-10T11:54:00+01:00",
      "dcterms:title": "pig:View",
      "dcterms:description": "A 'View' is a graphical model view with a specific communication purpose, e.g. a business process or system composition.",
      "pig:eligiblePropertyClass": [
        "#PC-Name",
        "#PC-Description",
        "#PC-Diagram",
        "#PC-Type"
      ]
    },
    {
      "@id": "#RC-Actor",
      "@type": "pig:entityClass",
      "dcterms:modified": "2018-05-10T11:54:00+01:00",
      "dcterms:title": "FMC:Actor",
      "dcterms:description": "An 'Actor' is a fundamental model element type representing an active entity, be it an activity, a process step, a function, a system component or a role.",
      "pig:eligiblePropertyClass": [
        "#PC-Name",
        "#PC-Description",
        "#PC-Type"
      ]
    },
    {
      "@id": "#RC-State",
      "@type": "pig:entityClass",
      "dcterms:modified": "2018-05-10T11:54:00+01:00",
      "dcterms:title": "FMC:State",
      "dcterms:description": "A 'State' is a fundamental model element type representing a passive entity, be it a value, a document, an information storage or even a physical shape.",
      "pig:eligiblePropertyClass": [
        "#PC-Name",
        "#PC-Description",
        "#PC-Type"
      ]
    },
    {
      "@id": "#RC-Event",
      "@type": "pig:entityClass",
      "dcterms:modified": "2018-05-10T11:54:00+01:00",
      "dcterms:title": "FMC:Event",
      "dcterms:description": "An 'Event' is a fundamental model element type representing a time reference, a change in condition/value or more generally a synchronisation primitive.",
      "pig:eligiblePropertyClass": [
        "#PC-Name",
        "#PC-Description",
        "#PC-Type"
      ]
    },
    {
      "@id": "#RC-Requirement",
      "@type": "pig:entityClass",
      "dcterms:modified": "2021-02-22T08:59:00+02:00",
      "dcterms:title": "IREB:Requirement",
      "dcterms:description": "A 'Requirement' is a singular documented physical and functional need that a particular design, product or process must be able to perform.",
      "pig:eligiblePropertyClass": [
        "#PC-Name",
        "#PC-Description",
        "#PC-Priority"
      ]
    },
    {
      "@id": "#SC-shows",
      "@type": "pig:relationshipClass",
      "dcterms:modified": "2018-05-10T11:54:00+01:00",
      "dcterms:title": "SpecIF:shows",
      "dcterms:description": "'View' shows 'Model-Element'",
      "pig:eligiblePropertyClass": [
        "#PC-Name",
        "#PC-Description"
      ],
      "pig:eligibleSubjectClass": [
        "#RC-View"
      ],
      "pig:eligibleObjectClass": "all"
    },
    {
      "@id": "#SC-writes",
      "@type": "pig:relationshipClass",
      "dcterms:modified": "2018-05-10T11:54:00+01:00",
      "dcterms:title": "SpecIF:writes",
      "dcterms:description": "'Actor' (Role, Function) writes 'State' (Information)",
      "pig:eligiblePropertyClass": [
        "#PC-Description"
      ],
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
      "dcterms:modified": "2018-05-10T11:54:00+01:00",
      "dcterms:title": "SpecIF:reads",
      "dcterms:description": "'Actor' (Role, Function) reads 'State' (Information)",
      "pig:eligiblePropertyClass": [
        "#PC-Description"
      ],
      "pig:eligibleSubjectClass": [
        "#RC-Actor"
      ],
      "pig:eligibleObjectClass": [
        "#RC-State"
      ]
    },
    {
      "@id": "#SC-satisfies",
      "@type": "pig:relationshipClass",
      "dcterms:modified": "2016-05-26T08:59:00+02:00",
      "dcterms:title": "oslc_rm:satisfies",
      "dcterms:description": "Statement: Model-Element satisfies Requirement",
      "pig:eligiblePropertyClass": [
        "#PC-Description"
      ],
      "pig:eligibleSubjectClass": [
        "#RC-Actor",
        "#RC-State"
      ],
      "pig:eligibleObjectClass": [
        "#RC-Requirement"
      ]
    },
    {
      "@id": "#Folder-Introduction",
      "@type": "pig:entity",
      "dcterms:modified": "2025-02-07T08:32:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Name",
          "@value": [
            "Introduction"
          ]
        },
        {
          "@type": "#PC-Description",
          "@value": [
            "<p>This is a minimal showcase for a model with model-elements and related requirements. It covers pretty much all characteristics neeeded in such cases (including 'statements on statements'), so that transformations and expressive power of other data formats can be evaluated. The example and its representation in SpecIF format is discussed in <a href=\"https://specif.de/Tutorials/06_Very-Simple-Model-FMC.html\" target=\"_blank\">Tutorial 6: Very Simple Model (FMC)</a> and <a href=\"https://specif.de/Tutorials/09_Very-Simple-Model-FMC-with-Requirements.html\" target=\"_blank\">Tutorial 9: Very Simple Model (FMC) with Requirements</a>.</p>"
          ]
        }
      ]
    },
    {
      "@id": "#Folder-Requirements",
      "@type": "pig:entity",
      "dcterms:modified": "2020-03-06T08:32:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Name",
          "@value": [
            "Requirements"
          ]
        }
      ]
    },
    {
      "@id": "#Req-1a8016e2872e78ecadc50feddc00029b",
      "@type": "pig:entity",
      "dcterms:modified": "2020-10-17T10:00:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Name",
          "@value": [
            "Data Volume"
          ]
        },
        {
          "@type": "#PC-Description",
          "@value": [
            "<p>The data store MUST support a total volume up to 850 GB.</p>"
          ]
        },
        {
          "@type": "#PC-Priority",
          "@value": [
            "#V-Prio-1"
          ]
        }
      ]
    },
    {
      "@id": "#Req-0Z7916e2872e78ecadc50feddc00918a",
      "@type": "pig:entity",
      "dcterms:modified": "2020-10-17T10:00:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Name",
          "@value": [
            "Consistency"
          ]
        },
        {
          "@type": "#PC-Description",
          "@value": [
            "<p>The data store MUST be consistent at all times.</p>"
          ]
        },
        {
          "@type": "#PC-Priority",
          "@value": [
            "#V-Prio-0"
          ]
        }
      ]
    },
    {
      "@id": "#Req-2b9016e2872e78ecadc50feddc0013Ac",
      "@type": "pig:entity",
      "dcterms:modified": "2020-10-17T10:00:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Name",
          "@value": [
            "Response Time"
          ]
        },
        {
          "@type": "#PC-Description",
          "@value": [
            "<p>The system SHOULD respond on user queries within 300 ms.</p>"
          ]
        },
        {
          "@type": "#PC-Priority",
          "@value": [
            "#V-Prio-2"
          ]
        }
      ]
    },
    {
      "@id": "#Folder-SystemModel",
      "@type": "pig:entity",
      "dcterms:modified": "2020-03-06T08:32:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Name",
          "@value": [
            "System Model"
          ]
        }
      ]
    },
    {
      "@id": "#Diagram-aec0df7900010000017001eaf53e8876",
      "@type": "pig:entity",
      "dcterms:modified": "2020-03-06T08:32:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Name",
          "@value": [
            "IT-Integration: FiCo-Application and FiCo-Data"
          ]
        },
        {
          "@type": "#PC-Diagram",
          "@value": [
            "<p class=\"inline-label\">Model Diagram:</p><p><object type=\"image/svg+xml\" data=\"files_and_images/Very-Simple-Model-FMC.svg\">Notation: FMC Block Diagram</object></p>"
          ]
        },
        {
          "@type": "#PC-Type",
          "@value": [
            "FMC Block Diagram"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-50fbfe8f0029b1a8016ea86245a9d83a",
      "@type": "pig:entity",
      "dcterms:modified": "2020-03-06T09:04:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Name",
          "@value": [
            "FiCo-Application"
          ]
        },
        {
          "@type": "#PC-Description",
          "@value": [
            "<p>IT-Application for Finance and Controlling.</p>"
          ]
        }
      ]
    },
    {
      "@id": "#MEl-50feddc00029b1a8016e2872e78ecadc",
      "@type": "pig:entity",
      "dcterms:modified": "2020-03-06T09:03:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Name",
          "@value": [
            "FiCo-Data"
          ]
        },
        {
          "@type": "#PC-Description",
          "@value": [
            "<p>Finance and Controlling Data, such as cost-units per project with budget, accrued cost etc.</p>"
          ]
        }
      ]
    },
    {
      "@id": "#FolderGlossary-10875487071",
      "@type": "pig:entity",
      "dcterms:modified": "2025-06-06T08:45:56.203Z",
      "pig:hasProperty": [
        {
          "@type": "#PC-Name",
          "@value": [
            "Model Elements (Glossary)"
          ]
        },
        {
          "@type": "#PC-Type",
          "@value": [
            "SpecIF:Glossary"
          ]
        }
      ]
    },
    {
      "@id": "#SVis-aec0df7900010000017001eaf53e8876-50fbfe8f0029b1a8016ea86245a9d83a",
      "@type": "pig:relationship",
      "dcterms:modified": "2020-03-06T08:32:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Description",
          "@value": [
            "'FMC Block Diagram' shows 'FiCo-Application'"
          ]
        }
      ]
    },
    {
      "@id": "#SVis-aec0df7900010000017001eaf53e8876-50feddc00029b1a8016e2872e78ecadc",
      "@type": "pig:relationship",
      "dcterms:modified": "2020-03-06T08:32:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Description",
          "@value": [
            "'FMC Block Diagram' shows 'FiCo-Data'"
          ]
        }
      ]
    },
    {
      "@id": "#SWri-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc",
      "@type": "pig:relationship",
      "dcterms:modified": "2020-03-06T09:05:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Description",
          "@value": [
            "'FiCo-Application' writes 'FiCo-Data'"
          ]
        }
      ]
    },
    {
      "@id": "#SRea-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc",
      "@type": "pig:relationship",
      "dcterms:modified": "2020-03-06T09:05:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Description",
          "@value": [
            "'FiCo-Application' reads 'FiCo-Data'"
          ]
        }
      ]
    },
    {
      "@id": "#Ssat-50feddc00029b1a8016e2872e78ecadc-1a8016e2872e78ecadc50feddc00029b",
      "@type": "pig:relationship",
      "dcterms:modified": "2020-10-17T10:00:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Description",
          "@value": [
            "'FiCo-Data' satisfies 'Data Volume'"
          ]
        }
      ]
    },
    {
      "@id": "#Ssat-50feddc00029b1a8016e2872e78ecadc-0Z7916e2872e78ecadc50feddc00918a",
      "@type": "pig:relationship",
      "dcterms:modified": "2020-10-17T10:00:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Description",
          "@value": [
            "'FiCo-Data' satisfies 'Consistency'"
          ]
        }
      ]
    },
    {
      "@id": "#Ssat-50fbfe8f0029b1a8016ea86245a9d83a-2b9016e2872e78ecadc50feddc0013Ac",
      "@type": "pig:relationship",
      "dcterms:modified": "2020-10-17T10:00:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Description",
          "@value": [
            "'FiCo-Application' satisfies 'Response Time'"
          ]
        }
      ]
    },
    {
      "@id": "#SVis-aec0df7900010000017001eaf53e8876-SWri-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc",
      "@type": "pig:relationship",
      "dcterms:modified": "2025-01-26T08:32:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Name",
          "@value": [
            "SpecIF:shows"
          ]
        },
        {
          "@type": "#PC-Description",
          "@value": [
            "'FMC Block Diagram' shows 'FiCo-Application writes FiCo-Data'"
          ]
        }
      ]
    },
    {
      "@id": "#SVis-aec0df7900010000017001eaf53e8876-SRea-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc",
      "@type": "pig:relationship",
      "dcterms:modified": "2025-01-26T08:32:00+01:00",
      "pig:hasProperty": [
        {
          "@type": "#PC-Name",
          "@value": [
            "SpecIF:shows"
          ]
        },
        {
          "@type": "#PC-Description",
          "@value": [
            "'FMC Block Diagram' shows 'FiCo-Application reads FiCo-Data'"
          ]
        }
      ]
    },
    [
      {
        "@id": "#N-Folder-Introduction",
        "@type": "pig:Outline",
        "dcterms:modified": "2025-02-07T10:00:00+01:00",
        "pig:hasElement": "#Folder-Introduction"
      },
      {
        "@id": "#N-Folder-Requirements",
        "@type": "pig:Outline",
        "dcterms:modified": "2020-10-17T10:00:00+01:00",
        "pig:hasElement": "#Folder-Requirements",
        "pig:hasChild": [
          {
            "@id": "#N-1a8016e2872e78ecadc50feddc00029b",
            "@type": "pig:Outline",
            "dcterms:modified": "2020-10-17T10:00:00+01:00",
            "pig:hasElement": "#Req-1a8016e2872e78ecadc50feddc00029b"
          },
          {
            "@id": "#N-0Z7916e2872e78ecadc50feddc00918a",
            "@type": "pig:Outline",
            "dcterms:modified": "2020-10-17T10:00:00+01:00",
            "pig:hasElement": "#Req-0Z7916e2872e78ecadc50feddc00918a"
          },
          {
            "@id": "#N-2b9016e2872e78ecadc50feddc0013Ac",
            "@type": "pig:Outline",
            "dcterms:modified": "2020-10-17T10:00:00+01:00",
            "pig:hasElement": "#Req-2b9016e2872e78ecadc50feddc0013Ac"
          }
        ]
      },
      {
        "@id": "#N-Folder-SystemModel",
        "@type": "pig:Outline",
        "dcterms:modified": "2020-10-17T10:00:00+01:00",
        "pig:hasElement": "#Folder-SystemModel",
        "pig:hasChild": [
          {
            "@id": "#N-Diagram-aec0df7900010000017001eaf53e8876",
            "@type": "pig:Outline",
            "dcterms:modified": "2020-10-17T10:00:00+01:00",
            "pig:hasElement": "#Diagram-aec0df7900010000017001eaf53e8876",
            "pig:hasChild": [
              {
                "@id": "#N-50fbfe8f0029b1a8016ea86245a9d83a",
                "@type": "pig:Outline",
                "dcterms:modified": "2020-03-06T09:05:00+01:00",
                "pig:hasElement": "#MEl-50fbfe8f0029b1a8016ea86245a9d83a"
              },
              {
                "@id": "#N-50feddc00029b1a8016e2872e78ecadc",
                "@type": "pig:Outline",
                "dcterms:modified": "2020-03-06T09:05:00+01:00",
                "pig:hasElement": "#MEl-50feddc00029b1a8016e2872e78ecadc"
              }
            ]
          }
        ]
      },
      {
        "@id": "#N-FolderGlossary-10875487071",
        "@type": "pig:Outline",
        "dcterms:modified": "2025-06-06T08:45:56.203Z",
        "pig:hasElement": "#FolderGlossary-10875487071",
        "pig:hasChild": [
          {
            "@id": "#N-9559304043",
            "@type": "pig:Outline",
            "dcterms:modified": "2025-06-06T08:45:56.203Z",
            "pig:hasElement": "#MEl-50fbfe8f0029b1a8016ea86245a9d83a"
          },
          {
            "@id": "#N-12075661949",
            "@type": "pig:Outline",
            "dcterms:modified": "2025-06-06T08:45:56.203Z",
            "pig:hasElement": "#MEl-50feddc00029b1a8016e2872e78ecadc"
          }
        ]
      }
    ]
  ]
}
