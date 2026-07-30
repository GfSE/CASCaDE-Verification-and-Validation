// CASCaRA/Cascara -> Neo4j Cypher export

// Generated 2026-07-30T08:40:46.277Z

CREATE CONSTRAINT package_id_unique IF NOT EXISTS FOR (n:Package) REQUIRE n.id IS UNIQUE;

CREATE CONSTRAINT cascaraitem_id_unique IF NOT EXISTS FOR (n:CascaraItem) REQUIRE n.id IS UNIQUE;

MERGE (n:CascaraItem:Package:aPackage {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
SET n += { hasClass: "cas:Package", title: "Very Simple Model (FMC) with Requirements", modified: "2026-01-17T22:38:19.595Z" };

MERGE (n:CascaraItem:Entity {id: "cas:Package"})
SET n += { hasClass: "owl:Class", title: "Package", definition: "A CASCaRA meta-model item used for packages comprising entities, relationships and potentially nested packages, both classes and instances." };

MERGE (n:CascaraItem:Entity {id: "cas:Organizer"})
SET n += { hasClass: "owl:Class", title: "Organizer", definition: "An element organizing model elements. An example is a list of requirements or a diagram using a certain notation." };

MERGE (n:CascaraItem:Entity {id: "cas:Root"})
SET n += { hasClass: "owl:Class", title: "Hierarchy Root", definition: "A root for hierarchically organized graph elements." };

MERGE (n:CascaraItem:Entity {id: "cas:Outline"})
SET n += { hasClass: "owl:Class", title: "Outline", definition: "Comprises all information items of a human-readable document. As usual, the outline is hierarchically organized." };

MERGE (n:CascaraItem:Entity {id: "cas:View"})
SET n += { hasClass: "owl:Class", title: "View", definition: "Represents a model view (diagram) using a certain notation showing selected model elements." };

MERGE (n:CascaraItem:Property {id: "cas:Category"})
SET n += { hasClass: "owl:DatatypeProperty", title: "has category", definition: "Specifies a category for an element (entity, relationship or organizer).", datatype: "xs:string", minCount: 0, maxCount: 1, maxLength: 32 };

MERGE (n:CascaraItem:Link {id: "cas:linksSource"})
SET n += { hasClass: "owl:ObjectProperty", title: "to source", definition: "Connects the source of a reified relationship." };

MERGE (n:CascaraItem:Link {id: "cas:linksTarget"})
SET n += { hasClass: "owl:ObjectProperty", title: "to target", definition: "Connects the target of a reified relationship or an organizer." };

MERGE (n:CascaraItem:Link {id: "cas:lists"})
SET n += { hasClass: "owl:ObjectProperty", title: "lists", definition: "Lists an entity, a relationship or a subordinated organizer." };

MERGE (n:CascaraItem:Link {id: "cas:shows"})
SET n += { hasClass: "owl:ObjectProperty", title: "shows", definition: "Shows an entity or a relationship." };

MERGE (n:CascaraItem:Link {id: "cas:depicts"})
SET n += { hasClass: "owl:ObjectProperty", title: "depicts", definition: "Depicts an entity; inverse of uml:ownedDiagram." };

MERGE (n:CascaraItem:Property {id: "cas:Diagram"})
SET n += { hasClass: "owl:DatatypeProperty", title: "Diagram | Diagramm | Diagramme", definition: "A diagram illustrating the resource or a link to a diagram.", datatype: "xs:string" };

MERGE (n:CascaraItem:Entity {id: "FMC:Actor"})
SET n += { hasClass: "owl:Class", title: "Actor | Akteur | Acteur", description: "<p>An 'Actor' is a fundamental model element type representing an active entity, be it an activity, a process step, a function, a system component or a role.</p><p>The particular use or original type is specified with a [[dcterms:type]] property of the 'FMC:Actor'. A value of that property should be an ontology-term, such as [[bpmn:processStep]].</p> | <p>Ein 'Akteur' ist ein fundamentaler Modellelementtyp, der eine aktive Entität darstellt, sei es eine Aktivität, ein Prozessschritt, eine Funktion, eine Systemkomponente oder eine Rolle.</p><p>Die spezielle Verwendung oder der ursprüngliche Typ wird mit einer [[dcterms:type]] Eigenschaft von 'FMC:Actor' spezifiziert. Die Werte dieser Eigenschaft können Ontologiebegriffe sein, wie z.B. [[bpmn:timer]].</p> | <p>Un 'Acteur' est un type d'élément de modèle fondamental représentant une entité active, qu'il s'agisse d'une activité, d'une étape de processus, d'une fonction, d'un composant de système ou d'un rôle.</p><p>L'utilisation particulière ou le type original est spécifié avec une propriété [[dcterms:type]] de 'FMC:Actor'. Les valeurs de cette propriété peuvent être des termes d'ontologie, tels que [[bpmn:timer]].</p>", icon: "{\"value\":\"□\"}" };

MERGE (n:CascaraItem:Entity {id: "FMC:State"})
SET n += { hasClass: "owl:Class", title: "State | Zustand | État", description: "<p>A 'State' is a fundamental model element type representing a passive entity, be it a value, a condition, an information storage or even a physical shape.</p><p>The particular use or the original type is specified with a [[dcterms:type]] property of the 'FMC:State'. A value of that property should bean ontology-term, such as [[bpmn:dataObject]].</p> | <p>Ein 'Zustand' ist ein fundamentaler Modellelementtyp, der eine passive Entität darstellt, sei es ein Wert, ein Dokument, ein Informationsspeicher, eine Bedingung oder eine physische Beschaffenheit.</p><p>Die spezielle Verwendung oder der ursprüngliche Typ wird mit einer [[dcterms:type]] Eigenschaft von 'FMC:State' spezifiziert. Die Werte dieser Eigenschaft können Ontologiebegriffe sein, wie z.B. [[ArchiMate:DataObject]].</p> | <p>Un 'État' est un type d'élément de modèle fondamental représentant une entité passive, qu'il s'agisse d'une valeur, d'une condition, d'un stockage d'informations ou même d'une forme physique.</p><p>L'utilisation particulière ou le type original est spécifié avec une propriété [[dcterms:type]] de 'FMC:State'. Les valeurs de cette propriété peuvent être des termes d'ontologie, tels que [[ArchiMate:DataObject]].</p>", icon: "{\"value\":\"○\"}" };

MERGE (n:CascaraItem:Entity {id: "FMC:Event"})
SET n += { hasClass: "owl:Class", title: "Event | Ereignis | Évenement", description: "<p>An 'Event' is a fundamental model element type representing a time reference, a change in condition/value or more generally a synchronization primitive.</p><p>The particular use or the original type is specified with a [[dcterms:type]] property of the 'FMC:Event'. A value of that property should be an ontology-term, such as [[bpmn:startEvent]].</p> | <p>Ein 'Ereignis' ist ein fundamentaler Modellelementtyp, der eine Zeitreferenz, eine Änderung einer Bedingung/eines Wertes oder allgemeiner ein Synchronisationsmittel darstellt.</p><p>Die spezielle Verwendung oder der ursprüngliche Typ wird mit einer [[dcterms:type]] Eigenschaft von 'FMC:Event' spezifiziert. Die Werte dieser Eigenschaft sollen Ontologiebegriffe sein, wie z.B. [[bpmn:startEvent]].</p> | <p>Un 'Événement' est un type d'élément de modèle fondamental représentant une référence temporelle, un changement de condition/valeur ou plus généralement une primitive de synchronisation.</p><p>L'utilisation particulière ou le type original est spécifié avec une propriété [[dcterms:type]] de 'FMC:Event'. Les valeurs de cette propriété peuvent être des termes d'ontologie, tels que [[bpmn:startEvent]].</p>", icon: "{\"value\":\"♢\"}" };

MERGE (n:CascaraItem:Entity {id: "IREB:Requirement"})
SET n += { hasClass: "owl:Class", title: "Requirement | Anforderung | Exigence", description: "<p> A 'Requirement' is a singular documented physical and functional need that a particular design, product or process must be able to perform. <small> (<i> source: <a href=\"https://en.wikipedia.org/wiki/Requirement\">Wikipedia</a></i>) </small></p><p>Definition:</p><ol><li>A condition or capability needed by a user to solve a problem or achieve an objective.</li><li>A condition or capability that must be met or possessed by a system or system component to satisfy a contract, standard, specification, or other formally imposed documents.</li><li>A documented representation of a condition or capability as in (1) or (2).</li></ol><p>Note: The definition above is the classic one from IEEE Std 610.12 of 1990. Alternatively, we also give a more modern definition:</p><ol><li>A need perceived by a stakeholder.</li><li>A capability or property that a system shall have.</li><li>A documented representation of a need, capability or property.</li></ol> | <p> Eine 'Anforderung' ist ein einzelnes dokumentiertes physisches und funktionales Bedürfnis, das ein bestimmter Entwurf, ein Produkt oder ein Prozess erfüllen muss. <small> (<i> source: <a href=\"https://en.wikipedia.org/wiki/Requirement\">Wikipedia</a></i>) </small></p><p>Definition:</p><ol><li>Eine Bedingung oder Fähigkeit, die ein Benutzer benötigt, um ein Problem zu lösen oder ein Ziel zu erreichen.</li><li>Eine Bedingung oder Fähigkeit, die ein System oder eine Systemkomponente erfüllen oder besitzen muss, um einen Vertrag, eine Norm, eine Spezifikation oder ein anderes formal vorgeschriebenes Dokument zu erfüllen.</li><li>Eine dokumentierte Darstellung einer Bedingung oder Fähigkeit wie in (1) oder (2).</li></ol><p>Anmerkung: Die obige Definition ist die klassische Definition aus IEEE Std 610.12 von 1990. Alternativ geben wir auch eine modernere Definition an:</p><ol><li>Ein von einem Stakeholder wahrgenommener Bedarf.</li><li>Eine Fähigkeit oder Eigenschaft, die ein System haben soll.</li><li>Eine dokumentierte Darstellung eines Bedarfs, einer Fähigkeit oder Eigenschaft.</li></ol> | <p> Une 'Exigence' est un besoin physique et fonctionnel unique et documenté qu'une conception, un produit ou un processus particulier doit pouvoir satisfaire. <small> (<i> source: <a href=\"https://en.wikipedia.org/wiki/Requirement\">Wikipedia</a></i>) </small></p><p>Définition:</p><ol><li>Condition ou capacité dont un utilisateur a besoin pour résoudre un problème ou atteindre un objectif.</li><li>Condition ou capacité qui doit être remplie ou possédée par un système ou un composant de système pour satisfaire à un contrat, à une norme, à une spécification ou à d'autres documents imposés officiellement.</li><li>Une représentation documentée d'une condition ou d'une capacité comme dans (1) ou (2).</li></ol><p>Remarque: La définition ci-dessus est la définition classique de la norme IEEE 610.12 de 1990. Nous donnons également une définition plus moderne:</p><ol><li>Un besoin perçu par une partie prenante;</li><li>Une capacité ou une propriété qu'un système doit avoir.</li><li>Une représentation documentée d'un besoin, d'une capacité ou d'une propriété.</li></ol>", icon: "{\"value\":\"↯\"}" };

MERGE (n:CascaraItem:Relationship {id: "SpecIF:writes"})
SET n += { hasClass: "owl:Class", title: "writes | schreibt | écrit", description: "A [[FMC:Actor]] 'writes' (changes) a [[FMC:State]]." };

MERGE (n:CascaraItem:Link {id: "SpecIF:writes-toSource"})
SET n += { hasClass: "owl:ObjectProperty", title: "SpecIF:writes to source", definition: "Connects the source of SpecIF:writes" };

MERGE (n:CascaraItem:Link {id: "SpecIF:writes-toTarget"})
SET n += { hasClass: "owl:ObjectProperty", title: "SpecIF:writes to target", definition: "Connects the target of SpecIF:writes" };

MERGE (n:CascaraItem:Relationship {id: "SpecIF:reads"})
SET n += { hasClass: "owl:Class", title: "reads | liest | lit", description: "A [[FMC:Actor]] 'reads' a [[FMC:State]]." };

MERGE (n:CascaraItem:Link {id: "SpecIF:reads-toSource"})
SET n += { hasClass: "owl:ObjectProperty", title: "SpecIF:reads to source", definition: "Connects the source of SpecIF:reads" };

MERGE (n:CascaraItem:Link {id: "SpecIF:reads-toTarget"})
SET n += { hasClass: "owl:ObjectProperty", title: "SpecIF:reads to target", definition: "Connects the target of SpecIF:reads" };

MERGE (n:CascaraItem:Relationship {id: "oslc_rm:satisfies"})
SET n += { hasClass: "owl:Class", title: "satisfies | erfüllt | satisfait", description: "<p>The object is satisfied by the subject. <small>(<i>source: <a href=\"http://open-services.net/\">OSLC</a></i>)</small></p><p>SpecIF suggests that the subject is confined to a model element, e.g, a [[FMC:Actor]] or [[FMC:State]], and the object is confined to a [[IREB:Requirement]]. More concretely, an example for this type of statement is 'Component-X <em>satisfies</em> 'Requirement-4711'.</p>" };

MERGE (n:CascaraItem:Link {id: "oslc_rm:satisfies-toSource"})
SET n += { hasClass: "owl:ObjectProperty", title: "oslc_rm:satisfies to source", definition: "Connects the source of oslc_rm:satisfies" };

MERGE (n:CascaraItem:Link {id: "oslc_rm:satisfies-toTarget"})
SET n += { hasClass: "owl:ObjectProperty", title: "oslc_rm:satisfies to target", definition: "Connects the target of oslc_rm:satisfies" };

MERGE (n:CascaraItem:Enumeration {id: "SpecIF:Priority-Value"})
SET n += { hasClass: "owl:Class", title: "Priority | Priorität | Priorité", definition: "Enumerated values for the 'Priority' of the resource.", modified: "2020-03-26T22:59:00+02:00", datatype: "xs:string" };

MERGE (n:CascaraItem:Link {id: "SpecIF:Priority"})
SET n += { hasClass: "owl:ObjectProperty", title: "Priority | Priorität | Priorité", definition: "Enumerated values for the 'Priority' of the resource.", modified: "2020-03-26T22:59:00+02:00" };

MERGE (n:CascaraItem:anEntity {id: "d:Req-1a8016e2872e78ecadc50feddc00029b"})
SET n += { hasClass: "IREB:Requirement", title: "Data Volume", description: "<p>The data store MUST support a total volume up to 850 GB.</p>", modified: "2020-10-17T10:00:00+01:00" };

MERGE (n:CascaraItem:anEntity {id: "d:Req-0Z7916e2872e78ecadc50feddc00918a"})
SET n += { hasClass: "IREB:Requirement", title: "Consistency", description: "<p>The data store MUST be consistent at all times.</p>", modified: "2020-10-17T10:00:00+01:00" };

MERGE (n:CascaraItem:anEntity {id: "d:Req-2b9016e2872e78ecadc50feddc0013Ac"})
SET n += { hasClass: "IREB:Requirement", title: "Response Time", description: "<p>The system SHOULD respond on user queries within 300 ms.</p>", modified: "2020-10-17T10:00:00+01:00" };

MERGE (n:CascaraItem:anEntity {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
SET n += { hasClass: "cas:View", title: "FiCo-Architecure Diagram", modified: "2020-03-06T08:32:00+01:00" };

MERGE (n:CascaraItem:anEntity {id: "d:Actor-50fbfe8f0029b1a8016ea86245a9d83a"})
SET n += { hasClass: "FMC:Actor", title: "FiCo-Application", description: "<p>IT-Application for Finance and Controlling.</p>", modified: "2020-03-06T09:04:00+01:00" };

MERGE (n:CascaraItem:anEntity {id: "d:State-50feddc00029b1a8016e2872e78ecadc"})
SET n += { hasClass: "FMC:State", title: "FiCo-Data", description: "<p>Finance and Controlling Data, such as cost-units per project with budget, accrued cost etc.</p>", modified: "2020-03-06T09:03:00+01:00" };

MERGE (n:CascaraItem:aRelationship {id: "d:Writes-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
SET n += { hasClass: "SpecIF:writes", description: "'FiCo-Application' writes 'FiCo-Data'", modified: "2020-03-06T09:05:00+01:00" };

MERGE (n:CascaraItem:aRelationship {id: "d:Reads--50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
SET n += { hasClass: "SpecIF:reads", description: "'FiCo-Application' reads 'FiCo-Data'", modified: "2020-03-06T09:05:00+01:00" };

MERGE (n:CascaraItem:aRelationship {id: "d:Satisfies-50feddc00029b1a8016e2872e78ecadc-1a8016e2872e78ecadc50feddc00029b"})
SET n += { hasClass: "oslc_rm:satisfies", description: "'FiCo-Data' satisfies 'Data Volume'", modified: "2020-10-17T10:00:00+01:00" };

MERGE (n:CascaraItem:aRelationship {id: "d:Satisfies-50feddc00029b1a8016e2872e78ecadc-0Z7916e2872e78ecadc50feddc00918a"})
SET n += { hasClass: "oslc_rm:satisfies", description: "'FiCo-Data' satisfies 'Consistency'", modified: "2020-10-17T10:00:00+01:00" };

MERGE (n:CascaraItem:aRelationship {id: "d:Satisfies-50fbfe8f0029b1a8016ea86245a9d83a-2b9016e2872e78ecadc50feddc0013Ac"})
SET n += { hasClass: "oslc_rm:satisfies", description: "'FiCo-Application' satisfies 'Response Time'", modified: "2020-10-17T10:00:00+01:00" };

MERGE (n:CascaraItem:anEntity {id: "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"})
SET n += { hasClass: "cas:Root", title: "Hierarchy Root", description: "... anchoring all hierarchies of this graph (package)", modified: "2026-01-17T22:38:20.041Z" };

MERGE (n:CascaraItem:anEntity {id: "d:Folder-Introduction"})
SET n += { hasClass: "cas:Outline", title: "Introduction", description: "<p>This is a minimal showcase of a model with model-elements and related requirements. It covers pretty much all characteristics neeeded in such cases (including 'statements on statements'), so that transformations and expressive power of other data formats can be evaluated.</p>", modified: "2025-02-07T08:32:00+01:00" };

MERGE (n:CascaraItem:anEntity {id: "d:Folder-Requirements"})
SET n += { hasClass: "cas:Outline", title: "Requirements", modified: "2020-03-06T08:32:00+01:00" };

MERGE (n:CascaraItem:anEntity {id: "d:Folder-SystemDiagrams"})
SET n += { hasClass: "cas:Outline", title: "System Diagrams", modified: "2020-03-06T08:32:00+01:00" };

MERGE (n:CascaraItem:anEntity {id: "d:FolderGlossary-10875487071"})
SET n += { hasClass: "cas:Outline", title: "Glossary", modified: "2026-01-17T22:38:13.953Z" };

MERGE (n:CascaraItem:EnumerationValue {id: "SpecIF:priorityHigh"})
SET n += { title: "high | hoch | haut" };

MERGE (n:CascaraItem:EnumerationValue {id: "SpecIF:priorityRatherHigh"})
SET n += { title: "rather high | eher hoch | plutôt haut" };

MERGE (n:CascaraItem:EnumerationValue {id: "SpecIF:priorityMedium"})
SET n += { title: "medium | mittel | moyen" };

MERGE (n:CascaraItem:EnumerationValue {id: "SpecIF:priorityRatherLow"})
SET n += { title: "rather low | eher niedrig | plutôt bas" };

MERGE (n:CascaraItem:EnumerationValue {id: "SpecIF:priorityLow"})
SET n += { title: "low | niedrig | bas" };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "cas:Package"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "cas:Package"})
MERGE (target:CascaraItem {id: "cas:Entity"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "cas:Package"})
MERGE (target:CascaraItem {id: "dcterms:contributor"})
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY]->(target);

MERGE (source:CascaraItem {id: "cas:Package"})
MERGE (target:CascaraItem {id: "dcterms:license"})
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "cas:Organizer"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "cas:Organizer"})
MERGE (target:CascaraItem {id: "cas:Entity"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "cas:Organizer"})
MERGE (target:CascaraItem {id: "cas:Category"})
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "cas:Root"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "cas:Root"})
MERGE (target:CascaraItem {id: "cas:Organizer"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "cas:Root"})
MERGE (target:CascaraItem {id: "cas:lists"})
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "cas:Outline"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "cas:Outline"})
MERGE (target:CascaraItem {id: "cas:Organizer"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "cas:Outline"})
MERGE (target:CascaraItem {id: "cas:Category"})
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY]->(target);

MERGE (source:CascaraItem {id: "cas:Outline"})
MERGE (target:CascaraItem {id: "cas:lists"})
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "cas:View"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "cas:View"})
MERGE (target:CascaraItem {id: "cas:Organizer"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "cas:View"})
MERGE (target:CascaraItem {id: "cas:Category"})
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY]->(target);

MERGE (source:CascaraItem {id: "cas:View"})
MERGE (target:CascaraItem {id: "cas:Diagram"})
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY]->(target);

MERGE (source:CascaraItem {id: "cas:View"})
MERGE (target:CascaraItem {id: "cas:shows"})
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK]->(target);

MERGE (source:CascaraItem {id: "cas:View"})
MERGE (target:CascaraItem {id: "cas:depicts"})
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "cas:Category"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "cas:Category"})
MERGE (target:CascaraItem {id: "cas:Property"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "cas:linksSource"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "cas:linksSource"})
MERGE (target:CascaraItem {id: "cas:Link"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "cas:linksSource"})
MERGE (target:CascaraItem {id: "cas:Entity"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "cas:linksSource"})
MERGE (target:CascaraItem {id: "cas:Relationship"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "cas:linksTarget"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "cas:linksTarget"})
MERGE (target:CascaraItem {id: "cas:Link"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "cas:linksTarget"})
MERGE (target:CascaraItem {id: "cas:Entity"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "cas:linksTarget"})
MERGE (target:CascaraItem {id: "cas:Relationship"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "cas:lists"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "cas:lists"})
MERGE (target:CascaraItem {id: "cas:linksTarget"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "cas:lists"})
MERGE (target:CascaraItem {id: "cas:Entity"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "cas:lists"})
MERGE (target:CascaraItem {id: "cas:Relationship"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "cas:lists"})
MERGE (target:CascaraItem {id: "cas:Organizer"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "cas:shows"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "cas:shows"})
MERGE (target:CascaraItem {id: "cas:linksTarget"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "cas:shows"})
MERGE (target:CascaraItem {id: "cas:Entity"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "cas:shows"})
MERGE (target:CascaraItem {id: "cas:Relationship"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "cas:depicts"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "cas:depicts"})
MERGE (target:CascaraItem {id: "cas:linksTarget"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "cas:depicts"})
MERGE (target:CascaraItem {id: "cas:Entity"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "cas:Diagram"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "FMC:Actor"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "FMC:Actor"})
MERGE (target:CascaraItem {id: "cas:Entity"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "FMC:Actor"})
MERGE (target:CascaraItem {id: "cas:Category"})
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "FMC:State"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "FMC:State"})
MERGE (target:CascaraItem {id: "cas:Entity"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "FMC:State"})
MERGE (target:CascaraItem {id: "cas:Category"})
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "FMC:Event"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "FMC:Event"})
MERGE (target:CascaraItem {id: "cas:Entity"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "FMC:Event"})
MERGE (target:CascaraItem {id: "cas:Category"})
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "IREB:Requirement"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "IREB:Requirement"})
MERGE (target:CascaraItem {id: "cas:Entity"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "IREB:Requirement"})
MERGE (target:CascaraItem {id: "SpecIF:Priority"})
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "SpecIF:writes"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "SpecIF:writes"})
MERGE (target:CascaraItem {id: "cas:Relationship"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "SpecIF:writes"})
MERGE (target:CascaraItem {id: "SpecIF:writes-toSource"})
MERGE (source)-[r:HAS_ENUMERATED_SOURCE_LINK]->(target);

MERGE (source:CascaraItem {id: "SpecIF:writes"})
MERGE (target:CascaraItem {id: "SpecIF:writes-toTarget"})
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "SpecIF:writes-toSource"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "SpecIF:writes-toSource"})
MERGE (target:CascaraItem {id: "cas:linksSource"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "SpecIF:writes-toSource"})
MERGE (target:CascaraItem {id: "FMC:Actor"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "SpecIF:writes-toTarget"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "SpecIF:writes-toTarget"})
MERGE (target:CascaraItem {id: "cas:linksTarget"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "SpecIF:writes-toTarget"})
MERGE (target:CascaraItem {id: "FMC:State"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "SpecIF:reads"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "SpecIF:reads"})
MERGE (target:CascaraItem {id: "cas:Relationship"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "SpecIF:reads"})
MERGE (target:CascaraItem {id: "SpecIF:reads-toSource"})
MERGE (source)-[r:HAS_ENUMERATED_SOURCE_LINK]->(target);

MERGE (source:CascaraItem {id: "SpecIF:reads"})
MERGE (target:CascaraItem {id: "SpecIF:reads-toTarget"})
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "SpecIF:reads-toSource"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "SpecIF:reads-toSource"})
MERGE (target:CascaraItem {id: "cas:linksSource"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "SpecIF:reads-toSource"})
MERGE (target:CascaraItem {id: "FMC:Actor"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "SpecIF:reads-toTarget"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "SpecIF:reads-toTarget"})
MERGE (target:CascaraItem {id: "cas:linksTarget"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "SpecIF:reads-toTarget"})
MERGE (target:CascaraItem {id: "FMC:State"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "oslc_rm:satisfies"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "oslc_rm:satisfies"})
MERGE (target:CascaraItem {id: "cas:Relationship"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "oslc_rm:satisfies"})
MERGE (target:CascaraItem {id: "oslc_rm:satisfies-toSource"})
MERGE (source)-[r:HAS_ENUMERATED_SOURCE_LINK]->(target);

MERGE (source:CascaraItem {id: "oslc_rm:satisfies"})
MERGE (target:CascaraItem {id: "oslc_rm:satisfies-toTarget"})
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "oslc_rm:satisfies-toSource"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "oslc_rm:satisfies-toSource"})
MERGE (target:CascaraItem {id: "cas:linksSource"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "oslc_rm:satisfies-toSource"})
MERGE (target:CascaraItem {id: "FMC:Actor"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "oslc_rm:satisfies-toSource"})
MERGE (target:CascaraItem {id: "FMC:State"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "oslc_rm:satisfies-toTarget"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "oslc_rm:satisfies-toTarget"})
MERGE (target:CascaraItem {id: "cas:linksTarget"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "oslc_rm:satisfies-toTarget"})
MERGE (target:CascaraItem {id: "IREB:Requirement"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "SpecIF:Priority-Value"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "SpecIF:Priority-Value"})
MERGE (target:CascaraItem {id: "cas:Enumeration"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "SpecIF:Priority-Value"})
MERGE (target:CascaraItem {id: "SpecIF:priorityHigh"})
MERGE (source)-[r:HAS_ENUMERATED_VALUE]->(target);

MERGE (source:CascaraItem {id: "SpecIF:Priority-Value"})
MERGE (target:CascaraItem {id: "SpecIF:priorityRatherHigh"})
MERGE (source)-[r:HAS_ENUMERATED_VALUE]->(target);

MERGE (source:CascaraItem {id: "SpecIF:Priority-Value"})
MERGE (target:CascaraItem {id: "SpecIF:priorityMedium"})
MERGE (source)-[r:HAS_ENUMERATED_VALUE]->(target);

MERGE (source:CascaraItem {id: "SpecIF:Priority-Value"})
MERGE (target:CascaraItem {id: "SpecIF:priorityRatherLow"})
MERGE (source)-[r:HAS_ENUMERATED_VALUE]->(target);

MERGE (source:CascaraItem {id: "SpecIF:Priority-Value"})
MERGE (target:CascaraItem {id: "SpecIF:priorityLow"})
MERGE (source)-[r:HAS_ENUMERATED_VALUE]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "SpecIF:Priority"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "SpecIF:Priority"})
MERGE (target:CascaraItem {id: "cas:linksTarget"})
MERGE (source)-[r:SPECIALIZES]->(target);

MERGE (source:CascaraItem {id: "SpecIF:Priority"})
MERGE (target:CascaraItem {id: "SpecIF:Priority-Value"})
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Req-1a8016e2872e78ecadc50feddc00029b"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:Req-1a8016e2872e78ecadc50feddc00029b"})
MERGE (target:CascaraItem {id: "SpecIF:priorityHigh"})
MERGE (source)-[r:SPECIF_PRIORITY]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Req-0Z7916e2872e78ecadc50feddc00918a"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:Req-0Z7916e2872e78ecadc50feddc00918a"})
MERGE (target:CascaraItem {id: "SpecIF:priorityHigh"})
MERGE (source)-[r:SPECIF_PRIORITY]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Req-2b9016e2872e78ecadc50feddc0013Ac"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:Req-2b9016e2872e78ecadc50feddc0013Ac"})
MERGE (target:CascaraItem {id: "SpecIF:priorityMedium"})
MERGE (source)-[r:SPECIF_PRIORITY]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
MERGE (target:CascaraItem {id: "d:Actor-50fbfe8f0029b1a8016ea86245a9d83a"})
MERGE (source)-[r:CAS_SHOWS]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
MERGE (target:CascaraItem {id: "d:State-50feddc00029b1a8016e2872e78ecadc"})
MERGE (source)-[r:CAS_SHOWS]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
MERGE (target:CascaraItem {id: "d:Writes-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
MERGE (source)-[r:CAS_SHOWS]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
MERGE (target:CascaraItem {id: "d:Reads--50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
MERGE (source)-[r:CAS_SHOWS]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
MERGE (target:CascaraItem {id: "cas:Diagram"})
MERGE (source)-[r:HAS_PROPERTY]->(target)
SET r += { value: "\n                    <p class=\"inline-label\">Model Diagram:</p>\n                    <p><object type=\"image/svg+xml\" data=\"files_and_images/Very-Simple-Model-FMC.svg\">Notation: FMC Block Diagram</object></p>\n                ", itemType: "cas:aProperty" };

MERGE (source:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
MERGE (target:CascaraItem {id: "cas:Category"})
MERGE (source)-[r:HAS_PROPERTY]->(target)
SET r += { value: "FMC Block Diagram", itemType: "cas:aProperty" };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Actor-50fbfe8f0029b1a8016ea86245a9d83a"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:State-50feddc00029b1a8016e2872e78ecadc"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Writes-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:Writes-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
MERGE (target:CascaraItem {id: "d:Actor-50fbfe8f0029b1a8016ea86245a9d83a"})
MERGE (source)-[r:SPECIF_WRITES_TOSOURCE]->(target)
SET r += { linkDirection: "hasSourceLink" };

MERGE (source:CascaraItem {id: "d:Writes-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
MERGE (target:CascaraItem {id: "d:State-50feddc00029b1a8016e2872e78ecadc"})
MERGE (source)-[r:SPECIF_WRITES_TOTARGET]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Reads--50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:Reads--50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
MERGE (target:CascaraItem {id: "d:Actor-50fbfe8f0029b1a8016ea86245a9d83a"})
MERGE (source)-[r:SPECIF_READS_TOSOURCE]->(target)
SET r += { linkDirection: "hasSourceLink" };

MERGE (source:CascaraItem {id: "d:Reads--50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
MERGE (target:CascaraItem {id: "d:State-50feddc00029b1a8016e2872e78ecadc"})
MERGE (source)-[r:SPECIF_READS_TOTARGET]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Satisfies-50feddc00029b1a8016e2872e78ecadc-1a8016e2872e78ecadc50feddc00029b"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:Satisfies-50feddc00029b1a8016e2872e78ecadc-1a8016e2872e78ecadc50feddc00029b"})
MERGE (target:CascaraItem {id: "d:State-50feddc00029b1a8016e2872e78ecadc"})
MERGE (source)-[r:OSLC_RM_SATISFIES_TOSOURCE]->(target)
SET r += { linkDirection: "hasSourceLink" };

MERGE (source:CascaraItem {id: "d:Satisfies-50feddc00029b1a8016e2872e78ecadc-1a8016e2872e78ecadc50feddc00029b"})
MERGE (target:CascaraItem {id: "d:Req-1a8016e2872e78ecadc50feddc00029b"})
MERGE (source)-[r:OSLC_RM_SATISFIES_TOTARGET]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Satisfies-50feddc00029b1a8016e2872e78ecadc-0Z7916e2872e78ecadc50feddc00918a"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:Satisfies-50feddc00029b1a8016e2872e78ecadc-0Z7916e2872e78ecadc50feddc00918a"})
MERGE (target:CascaraItem {id: "d:State-50feddc00029b1a8016e2872e78ecadc"})
MERGE (source)-[r:OSLC_RM_SATISFIES_TOSOURCE]->(target)
SET r += { linkDirection: "hasSourceLink" };

MERGE (source:CascaraItem {id: "d:Satisfies-50feddc00029b1a8016e2872e78ecadc-0Z7916e2872e78ecadc50feddc00918a"})
MERGE (target:CascaraItem {id: "d:Req-0Z7916e2872e78ecadc50feddc00918a"})
MERGE (source)-[r:OSLC_RM_SATISFIES_TOTARGET]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Satisfies-50fbfe8f0029b1a8016ea86245a9d83a-2b9016e2872e78ecadc50feddc0013Ac"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:Satisfies-50fbfe8f0029b1a8016ea86245a9d83a-2b9016e2872e78ecadc50feddc0013Ac"})
MERGE (target:CascaraItem {id: "d:Actor-50fbfe8f0029b1a8016ea86245a9d83a"})
MERGE (source)-[r:OSLC_RM_SATISFIES_TOSOURCE]->(target)
SET r += { linkDirection: "hasSourceLink" };

MERGE (source:CascaraItem {id: "d:Satisfies-50fbfe8f0029b1a8016ea86245a9d83a-2b9016e2872e78ecadc50feddc0013Ac"})
MERGE (target:CascaraItem {id: "d:Req-2b9016e2872e78ecadc50feddc0013Ac"})
MERGE (source)-[r:OSLC_RM_SATISFIES_TOTARGET]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Folder-Introduction"})
MERGE (source)-[r:CAS_LISTS]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Folder-Requirements"})
MERGE (source)-[r:CAS_LISTS]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Folder-SystemDiagrams"})
MERGE (source)-[r:CAS_LISTS]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:FolderGlossary-10875487071"})
MERGE (source)-[r:CAS_LISTS]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Folder-Introduction"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Folder-Requirements"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:Folder-Requirements"})
MERGE (target:CascaraItem {id: "d:Req-1a8016e2872e78ecadc50feddc00029b"})
MERGE (source)-[r:CAS_LISTS]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:Folder-Requirements"})
MERGE (target:CascaraItem {id: "d:Req-0Z7916e2872e78ecadc50feddc00918a"})
MERGE (source)-[r:CAS_LISTS]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:Folder-Requirements"})
MERGE (target:CascaraItem {id: "d:Req-2b9016e2872e78ecadc50feddc0013Ac"})
MERGE (source)-[r:CAS_LISTS]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:Folder-SystemDiagrams"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:Folder-SystemDiagrams"})
MERGE (target:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
MERGE (source)-[r:CAS_LISTS]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
MERGE (target:CascaraItem {id: "d:FolderGlossary-10875487071"})
MERGE (source)-[r:CONTAINS]->(target);

MERGE (source:CascaraItem {id: "d:FolderGlossary-10875487071"})
MERGE (target:CascaraItem {id: "d:Actor-50fbfe8f0029b1a8016ea86245a9d83a"})
MERGE (source)-[r:CAS_LISTS]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:FolderGlossary-10875487071"})
MERGE (target:CascaraItem {id: "d:State-50feddc00029b1a8016e2872e78ecadc"})
MERGE (source)-[r:CAS_LISTS]->(target)
SET r += { linkDirection: "hasTargetLink" };

MERGE (source:CascaraItem {id: "d:FolderGlossary-10875487071"})
MERGE (target:CascaraItem {id: "cas:Category"})
MERGE (source)-[r:HAS_PROPERTY]->(target)
SET r += { value: "SpecIF:Glossary", itemType: "cas:aProperty" };