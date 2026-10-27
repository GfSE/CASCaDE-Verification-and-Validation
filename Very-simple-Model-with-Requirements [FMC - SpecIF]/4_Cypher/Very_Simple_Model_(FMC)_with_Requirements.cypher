// CASCaRA/Cascara -> Neo4j Cypher export

// Generated 2026-10-27T20:43:41.521Z

CREATE CONSTRAINT package_id_unique IF NOT EXISTS FOR (n:Package) REQUIRE n.id IS UNIQUE;

CREATE CONSTRAINT cascaraitem_id_unique IF NOT EXISTS FOR (n:CascaraItem) REQUIRE n.id IS UNIQUE;

MERGE (n:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
SET n:CascaraItem:Package:aPackage
SET n = { id: "d:ACP-Very-Simple-Model-FMC-with-Requirements", itemType: "cas:aPackage", instanceOf: "cas:Package", title: "Very Simple Model (FMC) with Requirements", titleJson: "[{\"value\":\"Very Simple Model (FMC) with Requirements\"}]", modified: "2026-09-30T10:23:15.010Z", contextJson: "[{\"tag\":\"FMC:\",\"uri\":\"http://fmc-modeling.org#\"},{\"tag\":\"IREB:\",\"uri\":\"https://cpre.ireb.org/en/downloads-and-resources/glossary#\"},{\"tag\":\"SpecIF:\",\"uri\":\"https://specif.de/v1.2/schema#\"},{\"tag\":\"cas:\",\"uri\":\"https://product-information-graph.org/v0.2/metamodel#\"},{\"tag\":\"d:\",\"uri\":\"https://product-information-graph.org/examples/09_Very-Simple-Model-FMC-with-Requirements.specif.zip#\"},{\"tag\":\"dcterms:\",\"uri\":\"http://purl.org/dc/terms/\"},{\"tag\":\"o:\",\"uri\":\"https://product-information-graph.org/v0.2/ontology#\"},{\"tag\":\"oslc_rm:\",\"uri\":\"http://open-services.net/ns/rm#\"},{\"tag\":\"owl:\",\"uri\":\"http://www.w3.org/2002/07/owl#\"},{\"tag\":\"rdf:\",\"uri\":\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"},{\"tag\":\"rdfs:\",\"uri\":\"http://www.w3.org/2000/01/rdf-schema#\"},{\"tag\":\"sh:\",\"uri\":\"http://www.w3.org/ns/shacl#\"},{\"tag\":\"skos:\",\"uri\":\"https://www.w3.org/TR/skos-reference/\"},{\"tag\":\"xs:\",\"uri\":\"http://www.w3.org/2001/XMLSchema#\"}]" };

MERGE (n:CascaraItem {id: "cas:Organizer"})
SET n:CascaraItem:Entity
SET n = { id: "cas:Organizer", itemType: "cas:Entity", instanceOf: "owl:Class", title: "Organizer", titleJson: "[{\"value\":\"Organizer\"}]", definition: "A CASCaRA meta-model item for organizing model-elements. An example is a list of requirements or a diagram using a certain notation.", definitionJson: "[{\"value\":\"A CASCaRA meta-model item for organizing model-elements. An example is a list of requirements or a diagram using a certain notation.\"}]" };

MERGE (n:CascaraItem {id: "cas:Package"})
SET n:CascaraItem:Entity
SET n = { id: "cas:Package", itemType: "cas:Entity", instanceOf: "owl:Class", title: "Package", titleJson: "[{\"value\":\"Package\"}]", definition: "A subclass of cas:Organizer used for a partial graph selected for exchange or access permissions.", definitionJson: "[{\"value\":\"A subclass of cas:Organizer used for a partial graph selected for exchange or access permissions.\"}]" };

MERGE (n:CascaraItem {id: "cas:Root"})
SET n:CascaraItem:Entity
SET n = { id: "cas:Root", itemType: "cas:Entity", instanceOf: "owl:Class", title: "Root", titleJson: "[{\"value\":\"Root\"}]", definition: "A subclass of cas:Organizer serving as a root for trees and tables.", definitionJson: "[{\"value\":\"A subclass of cas:Organizer serving as a root for trees and tables.\"}]" };

MERGE (n:CascaraItem {id: "cas:Tree"})
SET n:CascaraItem:Entity
SET n = { id: "cas:Tree", itemType: "cas:Entity", instanceOf: "owl:Class", title: "Tree", titleJson: "[{\"value\":\"Tree\"}]", definition: "A subclass of cas:Organizer for strictly hierarchical data structures referencing entities and relationships.", definitionJson: "[{\"value\":\"A subclass of cas:Organizer for strictly hierarchical data structures referencing entities and relationships.\"}]" };

MERGE (n:CascaraItem {id: "cas:Outline"})
SET n:CascaraItem:Entity
SET n = { id: "cas:Outline", itemType: "cas:Entity", instanceOf: "owl:Class", title: "Outline", titleJson: "[{\"value\":\"Outline\"}]", definition: "A subclass of cas:Tree comprising all information items of a human-readable document. As usual, the outline is hierarchically organized.", definitionJson: "[{\"value\":\"A subclass of cas:Tree comprising all information items of a human-readable document. As usual, the outline is hierarchically organized.\"}]" };

MERGE (n:CascaraItem {id: "cas:Table"})
SET n:CascaraItem:Entity
SET n = { id: "cas:Table", itemType: "cas:Entity", instanceOf: "owl:Class", title: "Table", titleJson: "[{\"value\":\"Table\"}]", definition: "A subclass of cas:Organizer representing a table showing selected model elements.", definitionJson: "[{\"value\":\"A subclass of cas:Organizer representing a table showing selected model elements.\"}]" };

MERGE (n:CascaraItem {id: "cas:Diagram"})
SET n:CascaraItem:Property
SET n = { id: "cas:Diagram", itemType: "cas:Property", instanceOf: "owl:DatatypeProperty", title: "Diagram", titleJson: "[{\"value\":\"Diagram\"}]", definition: "A diagram illustrating the resource or a link to a diagram.", definitionJson: "[{\"value\":\"A diagram illustrating the resource or a link to a diagram.\"}]", datatype: "xs:string" };

MERGE (n:CascaraItem {id: "cas:Category"})
SET n:CascaraItem:Property
SET n = { id: "cas:Category", itemType: "cas:Property", instanceOf: "owl:DatatypeProperty", title: "has category", titleJson: "[{\"value\":\"has category\"}]", definition: "Specifies a category for an element (entity, relationship or organizer).", definitionJson: "[{\"value\":\"Specifies a category for an element (entity, relationship or organizer).\"}]", datatype: "xs:string", minCount: 0, maxCount: 1, maxLength: 32 };

MERGE (n:CascaraItem {id: "cas:Notation"})
SET n:CascaraItem:Property
SET n = { id: "cas:Notation", itemType: "cas:Property", instanceOf: "owl:DatatypeProperty", title: "Notation", titleJson: "[{\"value\":\"Notation\"}]", definition: "A reference to a notation defining the syntax and semantics of a diagram.", definitionJson: "[{\"value\":\"A reference to a notation defining the syntax and semantics of a diagram.\"}]", datatype: "xs:string", minCount: 0, maxCount: 1 };

MERGE (n:CascaraItem {id: "cas:linksSource"})
SET n:CascaraItem:Link
SET n = { id: "cas:linksSource", itemType: "cas:Link", instanceOf: "owl:ObjectProperty", title: "to source", titleJson: "[{\"value\":\"to source\"}]", definition: "Connects the source of a reified relationship.", definitionJson: "[{\"value\":\"Connects the source of a reified relationship.\"}]" };

MERGE (n:CascaraItem {id: "cas:linksTarget"})
SET n:CascaraItem:Link
SET n = { id: "cas:linksTarget", itemType: "cas:Link", instanceOf: "owl:ObjectProperty", title: "to target", titleJson: "[{\"value\":\"to target\"}]", definition: "Connects the target of a reified relationship or an organizer.", definitionJson: "[{\"value\":\"Connects the target of a reified relationship or an organizer.\"}]" };

MERGE (n:CascaraItem {id: "cas:lists"})
SET n:CascaraItem:Link
SET n = { id: "cas:lists", itemType: "cas:Link", instanceOf: "owl:ObjectProperty", title: "lists", titleJson: "[{\"value\":\"lists\"}]", definition: "Lists an entity, a relationship or a subordinated organizer.", definitionJson: "[{\"value\":\"Lists an entity, a relationship or a subordinated organizer.\"}]" };

MERGE (n:CascaraItem {id: "cas:shows"})
SET n:CascaraItem:Link
SET n = { id: "cas:shows", itemType: "cas:Link", instanceOf: "owl:ObjectProperty", title: "shows", titleJson: "[{\"value\":\"shows\"}]", definition: "Shows an entity or a relationship.", definitionJson: "[{\"value\":\"Shows an entity or a relationship.\"}]" };

MERGE (n:CascaraItem {id: "cas:depicts"})
SET n:CascaraItem:Link
SET n = { id: "cas:depicts", itemType: "cas:Link", instanceOf: "owl:ObjectProperty", title: "depicts", titleJson: "[{\"value\":\"depicts\"}]", definition: "Depicts an entity; inverse of uml:ownedDiagram.", definitionJson: "[{\"value\":\"Depicts an entity; inverse of uml:ownedDiagram.\"}]" };

MERGE (n:CascaraItem {id: "SpecIF:Priority-Enumeration"})
SET n:CascaraItem:Enumeration
SET n = { id: "SpecIF:Priority-Enumeration", itemType: "cas:Enumeration", instanceOf: "owl:Class", title: "Priority | Priorität | Priorité", titleJson: "[{\"value\":\"Priority\",\"lang\":\"en\"},{\"value\":\"Priorität\",\"lang\":\"de\"},{\"value\":\"Priorité\",\"lang\":\"fr\"}]", definition: "Enumerated values for the 'Priority' of the resource.", definitionJson: "[{\"value\":\"Enumerated values for the 'Priority' of the resource.\",\"lang\":\"en\"}]", modified: "2016-05-26T08:59:00+02:00", datatype: "xs:string" };

MERGE (n:CascaraItem {id: "SpecIF:Priority"})
SET n:CascaraItem:Link
SET n = { id: "SpecIF:Priority", itemType: "cas:Link", instanceOf: "owl:ObjectProperty", title: "Priority | Priorität | Priorité", titleJson: "[{\"value\":\"Priority\",\"lang\":\"en\"},{\"value\":\"Priorität\",\"lang\":\"de\"},{\"value\":\"Priorité\",\"lang\":\"fr\"}]", definition: "Enumerated values for the 'Priority' of the resource.", definitionJson: "[{\"value\":\"Enumerated values for the 'Priority' of the resource.\",\"lang\":\"en\"}]", modified: "2020-03-26T22:59:00+02:00" };

MERGE (n:CascaraItem {id: "SpecIF:Paragraph"})
SET n:CascaraItem:Entity
SET n = { id: "SpecIF:Paragraph", itemType: "cas:Entity", instanceOf: "owl:Class", title: "Paragraph | Textabsatz | Paragraphe", titleJson: "[{\"value\":\"Paragraph\",\"lang\":\"en\"},{\"value\":\"Textabsatz\",\"lang\":\"de\"},{\"value\":\"Paragraphe\",\"lang\":\"fr\"}]", definition: "<p>A 'Paragraph' is an unspecified information in a document at any level.</p> | <p>Ein 'Textabschnitt' in einem Dokument auf beliebiger Ebene.</p>", definitionJson: "[{\"value\":\"<p>A 'Paragraph' is an unspecified information in a document at any level.</p>\",\"lang\":\"en\"},{\"value\":\"<p>Ein 'Textabschnitt' in einem Dokument auf beliebiger Ebene.</p>\",\"lang\":\"de\"}]", modified: "2023-07-16T09:30:25.850Z" };

MERGE (n:CascaraItem {id: "cas:View"})
SET n:CascaraItem:Entity
SET n = { id: "cas:View", itemType: "cas:Entity", instanceOf: "owl:Class", title: "View", titleJson: "[{\"value\":\"View\"}]", definition: "A PIG organizer class representing a diagram with certain model-elements for a given communication purpose.", definitionJson: "[{\"value\":\"A PIG organizer class representing a diagram with certain model-elements for a given communication purpose.\"}]", modified: "2018-05-10T11:54:00+01:00", icon: "{\"value\":\"▣\"}" };

MERGE (n:CascaraItem {id: "FMC:Actor"})
SET n:CascaraItem:Entity
SET n = { id: "FMC:Actor", itemType: "cas:Entity", instanceOf: "owl:Class", title: "Actor | Akteur | Acteur", titleJson: "[{\"value\":\"Actor\",\"lang\":\"en\"},{\"value\":\"Akteur\",\"lang\":\"de\"},{\"value\":\"Acteur\",\"lang\":\"fr\"}]", definition: "<p>An 'Actor' is a fundamental model element type representing an active entity, be it an activity, a process step, a function, a system component or a role.</p><p>The particular use or original type is specified with a [[dcterms:type]] property of the 'FMC:Actor'. A value of that property should be an ontology-term, such as [[bpmn:processStep]].</p> | <p>Ein 'Akteur' ist ein fundamentaler Modellelementtyp, der eine aktive Entität darstellt, sei es eine Aktivität, ein Prozessschritt, eine Funktion, eine Systemkomponente oder eine Rolle.</p><p>Die spezielle Verwendung oder der ursprüngliche Typ wird mit einer [[dcterms:type]] Eigenschaft von 'FMC:Actor' spezifiziert. Die Werte dieser Eigenschaft können Ontologiebegriffe sein, wie z.B. [[bpmn:timer]].</p> | <p>Un 'Acteur' est un type d'élément de modèle fondamental représentant une entité active, qu'il s'agisse d'une activité, d'une étape de processus, d'une fonction, d'un composant de système ou d'un rôle.</p><p>L'utilisation particulière ou le type original est spécifié avec une propriété [[dcterms:type]] de 'FMC:Actor'. Les valeurs de cette propriété peuvent être des termes d'ontologie, tels que [[bpmn:timer]].</p>", definitionJson: "[{\"value\":\"<p>An 'Actor' is a fundamental model element type representing an active entity, be it an activity, a process step, a function, a system component or a role.</p><p>The particular use or original type is specified with a [[dcterms:type]] property of the 'FMC:Actor'. A value of that property should be an ontology-term, such as [[bpmn:processStep]].</p>\",\"lang\":\"en\"},{\"value\":\"<p>Ein 'Akteur' ist ein fundamentaler Modellelementtyp, der eine aktive Entität darstellt, sei es eine Aktivität, ein Prozessschritt, eine Funktion, eine Systemkomponente oder eine Rolle.</p><p>Die spezielle Verwendung oder der ursprüngliche Typ wird mit einer [[dcterms:type]] Eigenschaft von 'FMC:Actor' spezifiziert. Die Werte dieser Eigenschaft können Ontologiebegriffe sein, wie z.B. [[bpmn:timer]].</p>\",\"lang\":\"de\"},{\"value\":\"<p>Un 'Acteur' est un type d'élément de modèle fondamental représentant une entité active, qu'il s'agisse d'une activité, d'une étape de processus, d'une fonction, d'un composant de système ou d'un rôle.</p><p>L'utilisation particulière ou le type original est spécifié avec une propriété [[dcterms:type]] de 'FMC:Actor'. Les valeurs de cette propriété peuvent être des termes d'ontologie, tels que [[bpmn:timer]].</p>\",\"lang\":\"fr\"}]", modified: "2018-05-10T11:54:00+01:00", icon: "{\"value\":\"&#x25A1;\"}" };

MERGE (n:CascaraItem {id: "FMC:State"})
SET n:CascaraItem:Entity
SET n = { id: "FMC:State", itemType: "cas:Entity", instanceOf: "owl:Class", title: "State | Zustand | État", titleJson: "[{\"value\":\"State\",\"lang\":\"en\"},{\"value\":\"Zustand\",\"lang\":\"de\"},{\"value\":\"État\",\"lang\":\"fr\"}]", definition: "<p>A 'State' is a fundamental model element type representing a passive entity, be it a value, a condition, an information storage or even a physical shape.</p><p>The particular use or the original type is specified with a [[dcterms:type]] property of the 'FMC:State'. A value of that property should bean ontology-term, such as [[bpmn:dataObject]].</p> | <p>Ein 'Zustand' ist ein fundamentaler Modellelementtyp, der eine passive Entität darstellt, sei es ein Wert, ein Dokument, ein Informationsspeicher, eine Bedingung oder eine physische Beschaffenheit.</p><p>Die spezielle Verwendung oder der ursprüngliche Typ wird mit einer [[dcterms:type]] Eigenschaft von 'FMC:State' spezifiziert. Die Werte dieser Eigenschaft können Ontologiebegriffe sein, wie z.B. [[ArchiMate:DataObject]].</p> | <p>Un 'État' est un type d'élément de modèle fondamental représentant une entité passive, qu'il s'agisse d'une valeur, d'une condition, d'un stockage d'informations ou même d'une forme physique.</p><p>L'utilisation particulière ou le type original est spécifié avec une propriété [[dcterms:type]] de 'FMC:State'. Les valeurs de cette propriété peuvent être des termes d'ontologie, tels que [[ArchiMate:DataObject]].</p>", definitionJson: "[{\"value\":\"<p>A 'State' is a fundamental model element type representing a passive entity, be it a value, a condition, an information storage or even a physical shape.</p><p>The particular use or the original type is specified with a [[dcterms:type]] property of the 'FMC:State'. A value of that property should bean ontology-term, such as [[bpmn:dataObject]].</p>\",\"lang\":\"en\"},{\"value\":\"<p>Ein 'Zustand' ist ein fundamentaler Modellelementtyp, der eine passive Entität darstellt, sei es ein Wert, ein Dokument, ein Informationsspeicher, eine Bedingung oder eine physische Beschaffenheit.</p><p>Die spezielle Verwendung oder der ursprüngliche Typ wird mit einer [[dcterms:type]] Eigenschaft von 'FMC:State' spezifiziert. Die Werte dieser Eigenschaft können Ontologiebegriffe sein, wie z.B. [[ArchiMate:DataObject]].</p>\",\"lang\":\"de\"},{\"value\":\"<p>Un 'État' est un type d'élément de modèle fondamental représentant une entité passive, qu'il s'agisse d'une valeur, d'une condition, d'un stockage d'informations ou même d'une forme physique.</p><p>L'utilisation particulière ou le type original est spécifié avec une propriété [[dcterms:type]] de 'FMC:State'. Les valeurs de cette propriété peuvent être des termes d'ontologie, tels que [[ArchiMate:DataObject]].</p>\",\"lang\":\"fr\"}]", modified: "2018-05-10T11:54:00+01:00", icon: "{\"value\":\"&#x25CB;\"}" };

MERGE (n:CascaraItem {id: "FMC:Event"})
SET n:CascaraItem:Entity
SET n = { id: "FMC:Event", itemType: "cas:Entity", instanceOf: "owl:Class", title: "Event | Ereignis | Évenement", titleJson: "[{\"value\":\"Event\",\"lang\":\"en\"},{\"value\":\"Ereignis\",\"lang\":\"de\"},{\"value\":\"Évenement\",\"lang\":\"fr\"}]", definition: "<p>An 'Event' is a fundamental model element type representing a time reference, a change in condition/value or more generally a synchronization primitive.</p><p>The particular use or the original type is specified with a [[dcterms:type]] property of the 'FMC:Event'. A value of that property should be an ontology-term, such as [[bpmn:startEvent]].</p> | <p>Ein 'Ereignis' ist ein fundamentaler Modellelementtyp, der eine Zeitreferenz, eine Änderung einer Bedingung/eines Wertes oder allgemeiner ein Synchronisationsmittel darstellt.</p><p>Die spezielle Verwendung oder der ursprüngliche Typ wird mit einer [[dcterms:type]] Eigenschaft von 'FMC:Event' spezifiziert. Die Werte dieser Eigenschaft sollen Ontologiebegriffe sein, wie z.B. [[bpmn:startEvent]].</p> | <p>Un 'Événement' est un type d'élément de modèle fondamental représentant une référence temporelle, un changement de condition/valeur ou plus généralement une primitive de synchronisation.</p><p>L'utilisation particulière ou le type original est spécifié avec une propriété [[dcterms:type]] de 'FMC:Event'. Les valeurs de cette propriété peuvent être des termes d'ontologie, tels que [[bpmn:startEvent]].</p>", definitionJson: "[{\"value\":\"<p>An 'Event' is a fundamental model element type representing a time reference, a change in condition/value or more generally a synchronization primitive.</p><p>The particular use or the original type is specified with a [[dcterms:type]] property of the 'FMC:Event'. A value of that property should be an ontology-term, such as [[bpmn:startEvent]].</p>\",\"lang\":\"en\"},{\"value\":\"<p>Ein 'Ereignis' ist ein fundamentaler Modellelementtyp, der eine Zeitreferenz, eine Änderung einer Bedingung/eines Wertes oder allgemeiner ein Synchronisationsmittel darstellt.</p><p>Die spezielle Verwendung oder der ursprüngliche Typ wird mit einer [[dcterms:type]] Eigenschaft von 'FMC:Event' spezifiziert. Die Werte dieser Eigenschaft sollen Ontologiebegriffe sein, wie z.B. [[bpmn:startEvent]].</p>\",\"lang\":\"de\"},{\"value\":\"<p>Un 'Événement' est un type d'élément de modèle fondamental représentant une référence temporelle, un changement de condition/valeur ou plus généralement une primitive de synchronisation.</p><p>L'utilisation particulière ou le type original est spécifié avec une propriété [[dcterms:type]] de 'FMC:Event'. Les valeurs de cette propriété peuvent être des termes d'ontologie, tels que [[bpmn:startEvent]].</p>\",\"lang\":\"fr\"}]", modified: "2018-05-10T11:54:00+01:00", icon: "{\"value\":\"&#x2662;\"}" };

MERGE (n:CascaraItem {id: "IREB:Requirement"})
SET n:CascaraItem:Entity
SET n = { id: "IREB:Requirement", itemType: "cas:Entity", instanceOf: "owl:Class", title: "Requirement | Anforderung | Exigence", titleJson: "[{\"value\":\"Requirement\",\"lang\":\"en\"},{\"value\":\"Anforderung\",\"lang\":\"de\"},{\"value\":\"Exigence\",\"lang\":\"fr\"}]", definition: "<p>A 'Requirement' is a singular documented physical and functional need that a particular design, product or process must be able to perform. <small>(<i>source: <a href=\"https://en.wikipedia.org/wiki/Requirement\">Wikipedia</a></i>)</small></p><p>Definition:</p><ol><li>A condition or capability needed by a user to solve a problem or achieve an objective.</li><li>A condition or capability that must be met or possessed by a system or system component to satisfy a contract, standard, specification, or other formally imposed documents.</li><li>A documented representation of a condition or capability as in (1) or (2).</li></ol><p>Note: The definition above is the classic one from IEEE Std 610.12 of 1990. Alternatively, we also give a more modern definition:</p><ol><li>A need perceived by a stakeholder.</li><li>A capability or property that a system shall have.</li><li>A documented representation of a need, capability or property.</li></ol> | <p>Eine 'Anforderung' ist ein einzelnes dokumentiertes physisches und funktionales Bedürfnis, das ein bestimmter Entwurf, ein Produkt oder ein Prozess erfüllen muss. <small>(<i>source: <a href=\"https://en.wikipedia.org/wiki/Requirement\">Wikipedia</a></i>)</small></p><p>Definition:</p><ol><li>Eine Bedingung oder Fähigkeit, die ein Benutzer benötigt, um ein Problem zu lösen oder ein Ziel zu erreichen.</li><li>Eine Bedingung oder Fähigkeit, die ein System oder eine Systemkomponente erfüllen oder besitzen muss, um einen Vertrag, eine Norm, eine Spezifikation oder ein anderes formal vorgeschriebenes Dokument zu erfüllen.</li><li>Eine dokumentierte Darstellung einer Bedingung oder Fähigkeit wie in (1) oder (2).</li></ol><p>Anmerkung: Die obige Definition ist die klassische Definition aus IEEE Std 610.12 von 1990. Alternativ geben wir auch eine modernere Definition an:</p><ol><li>Ein von einem Stakeholder wahrgenommener Bedarf.</li><li>Eine Fähigkeit oder Eigenschaft, die ein System haben soll.</li><li>Eine dokumentierte Darstellung eines Bedarfs, einer Fähigkeit oder Eigenschaft.</li></ol> | <p>Une 'Exigence' est un besoin physique et fonctionnel unique et documenté qu'une conception, un produit ou un processus particulier doit pouvoir satisfaire. <small>(<i>source: <a href=\"https://en.wikipedia.org/wiki/Requirement\">Wikipedia</a></i>)</small></p><p>Définition:</p><ol><li>Condition ou capacité dont un utilisateur a besoin pour résoudre un problème ou atteindre un objectif.</li><li>Condition ou capacité qui doit être remplie ou possédée par un système ou un composant de système pour satisfaire à un contrat, à une norme, à une spécification ou à d'autres documents imposés officiellement.</li><li>Une représentation documentée d'une condition ou d'une capacité comme dans (1) ou (2).</li></ol><p>Remarque: La définition ci-dessus est la définition classique de la norme IEEE 610.12 de 1990. Nous donnons également une définition plus moderne:</p><ol><li>Un besoin perçu par une partie prenante;</li><li>Une capacité ou une propriété qu'un système doit avoir.</li><li>Une représentation documentée d'un besoin, d'une capacité ou d'une propriété.</li></ol>", definitionJson: "[{\"value\":\"<p>A 'Requirement' is a singular documented physical and functional need that a particular design, product or process must be able to perform. <small>(<i>source: <a href=\\\"https://en.wikipedia.org/wiki/Requirement\\\">Wikipedia</a></i>)</small></p><p>Definition:</p><ol><li>A condition or capability needed by a user to solve a problem or achieve an objective.</li><li>A condition or capability that must be met or possessed by a system or system component to satisfy a contract, standard, specification, or other formally imposed documents.</li><li>A documented representation of a condition or capability as in (1) or (2).</li></ol><p>Note: The definition above is the classic one from IEEE Std 610.12 of 1990. Alternatively, we also give a more modern definition:</p><ol><li>A need perceived by a stakeholder.</li><li>A capability or property that a system shall have.</li><li>A documented representation of a need, capability or property.</li></ol>\",\"lang\":\"en\"},{\"value\":\"<p>Eine 'Anforderung' ist ein einzelnes dokumentiertes physisches und funktionales Bedürfnis, das ein bestimmter Entwurf, ein Produkt oder ein Prozess erfüllen muss. <small>(<i>source: <a href=\\\"https://en.wikipedia.org/wiki/Requirement\\\">Wikipedia</a></i>)</small></p><p>Definition:</p><ol><li>Eine Bedingung oder Fähigkeit, die ein Benutzer benötigt, um ein Problem zu lösen oder ein Ziel zu erreichen.</li><li>Eine Bedingung oder Fähigkeit, die ein System oder eine Systemkomponente erfüllen oder besitzen muss, um einen Vertrag, eine Norm, eine Spezifikation oder ein anderes formal vorgeschriebenes Dokument zu erfüllen.</li><li>Eine dokumentierte Darstellung einer Bedingung oder Fähigkeit wie in (1) oder (2).</li></ol><p>Anmerkung: Die obige Definition ist die klassische Definition aus IEEE Std 610.12 von 1990. Alternativ geben wir auch eine modernere Definition an:</p><ol><li>Ein von einem Stakeholder wahrgenommener Bedarf.</li><li>Eine Fähigkeit oder Eigenschaft, die ein System haben soll.</li><li>Eine dokumentierte Darstellung eines Bedarfs, einer Fähigkeit oder Eigenschaft.</li></ol>\",\"lang\":\"de\"},{\"value\":\"<p>Une 'Exigence' est un besoin physique et fonctionnel unique et documenté qu'une conception, un produit ou un processus particulier doit pouvoir satisfaire. <small>(<i>source: <a href=\\\"https://en.wikipedia.org/wiki/Requirement\\\">Wikipedia</a></i>)</small></p><p>Définition:</p><ol><li>Condition ou capacité dont un utilisateur a besoin pour résoudre un problème ou atteindre un objectif.</li><li>Condition ou capacité qui doit être remplie ou possédée par un système ou un composant de système pour satisfaire à un contrat, à une norme, à une spécification ou à d'autres documents imposés officiellement.</li><li>Une représentation documentée d'une condition ou d'une capacité comme dans (1) ou (2).</li></ol><p>Remarque: La définition ci-dessus est la définition classique de la norme IEEE 610.12 de 1990. Nous donnons également une définition plus moderne:</p><ol><li>Un besoin perçu par une partie prenante;</li><li>Une capacité ou une propriété qu'un système doit avoir.</li><li>Une représentation documentée d'un besoin, d'une capacité ou d'une propriété.</li></ol>\",\"lang\":\"fr\"}]", modified: "2021-02-22T08:59:00+02:00", icon: "{\"value\":\"&#8623;\"}" };

MERGE (n:CascaraItem {id: "SpecIF:writes"})
SET n:CascaraItem:Relationship
SET n = { id: "SpecIF:writes", itemType: "cas:Relationship", instanceOf: "owl:Class", title: "writes | schreibt | écrit", titleJson: "[{\"value\":\"writes\",\"lang\":\"en\"},{\"value\":\"schreibt\",\"lang\":\"de\"},{\"value\":\"écrit\",\"lang\":\"fr\"}]", definition: "A [[FMC:Actor]] 'writes' (changes) a [[FMC:State]].", definitionJson: "[{\"value\":\"A [[FMC:Actor]] 'writes' (changes) a [[FMC:State]].\",\"lang\":\"en\"}]", modified: "2018-05-10T11:54:00+01:00" };

MERGE (n:CascaraItem {id: "SpecIF:writes-toSource"})
SET n:CascaraItem:Link
SET n = { id: "SpecIF:writes-toSource", itemType: "cas:Link", instanceOf: "owl:ObjectProperty", title: "writes to source", titleJson: "[{\"value\":\"writes to source\"}]", description: "Connects the source of SpecIF:writes", descriptionJson: "[{\"value\":\"Connects the source of SpecIF:writes\"}]" };

MERGE (n:CascaraItem {id: "SpecIF:writes-toTarget"})
SET n:CascaraItem:Link
SET n = { id: "SpecIF:writes-toTarget", itemType: "cas:Link", instanceOf: "owl:ObjectProperty", title: "writes to target", titleJson: "[{\"value\":\"writes to target\"}]", description: "Connects the target of SpecIF:writes", descriptionJson: "[{\"value\":\"Connects the target of SpecIF:writes\"}]" };

MERGE (n:CascaraItem {id: "SpecIF:reads"})
SET n:CascaraItem:Relationship
SET n = { id: "SpecIF:reads", itemType: "cas:Relationship", instanceOf: "owl:Class", title: "reads | liest | lit", titleJson: "[{\"value\":\"reads\",\"lang\":\"en\"},{\"value\":\"liest\",\"lang\":\"de\"},{\"value\":\"lit\",\"lang\":\"fr\"}]", definition: "A [[FMC:Actor]] 'reads' a [[FMC:State]].", definitionJson: "[{\"value\":\"A [[FMC:Actor]] 'reads' a [[FMC:State]].\",\"lang\":\"en\"}]", modified: "2018-05-10T11:54:00+01:00" };

MERGE (n:CascaraItem {id: "SpecIF:reads-toSource"})
SET n:CascaraItem:Link
SET n = { id: "SpecIF:reads-toSource", itemType: "cas:Link", instanceOf: "owl:ObjectProperty", title: "reads to source", titleJson: "[{\"value\":\"reads to source\"}]", description: "Connects the source of SpecIF:reads", descriptionJson: "[{\"value\":\"Connects the source of SpecIF:reads\"}]" };

MERGE (n:CascaraItem {id: "SpecIF:reads-toTarget"})
SET n:CascaraItem:Link
SET n = { id: "SpecIF:reads-toTarget", itemType: "cas:Link", instanceOf: "owl:ObjectProperty", title: "reads to target", titleJson: "[{\"value\":\"reads to target\"}]", description: "Connects the target of SpecIF:reads", descriptionJson: "[{\"value\":\"Connects the target of SpecIF:reads\"}]" };

MERGE (n:CascaraItem {id: "oslc_rm:satisfies"})
SET n:CascaraItem:Relationship
SET n = { id: "oslc_rm:satisfies", itemType: "cas:Relationship", instanceOf: "owl:Class", title: "satisfies | erfüllt | satisfait", titleJson: "[{\"value\":\"satisfies\",\"lang\":\"en\"},{\"value\":\"erfüllt\",\"lang\":\"de\"},{\"value\":\"satisfait\",\"lang\":\"fr\"}]", definition: "<p>The object is satisfied by the subject. <small>(<i>source: <a href=\"http://open-services.net/\">OSLC</a></i>)</small></p><p>SpecIF suggests that the subject is confined to a model element, e.g, a [[FMC:Actor]] or [[FMC:State]], and the object is confined to a [[IREB:Requirement]]. More concretely, an example for this type of statement is 'Component-X <em>satisfies</em> 'Requirement-4711'.</p>", definitionJson: "[{\"value\":\"<p>The object is satisfied by the subject. <small>(<i>source: <a href=\\\"http://open-services.net/\\\">OSLC</a></i>)</small></p><p>SpecIF suggests that the subject is confined to a model element, e.g, a [[FMC:Actor]] or [[FMC:State]], and the object is confined to a [[IREB:Requirement]]. More concretely, an example for this type of statement is 'Component-X <em>satisfies</em> 'Requirement-4711'.</p>\",\"lang\":\"en\"}]", modified: "2016-05-26T08:59:00+02:00" };

MERGE (n:CascaraItem {id: "oslc_rm:satisfies-toSource"})
SET n:CascaraItem:Link
SET n = { id: "oslc_rm:satisfies-toSource", itemType: "cas:Link", instanceOf: "owl:ObjectProperty", title: "satisfies to source", titleJson: "[{\"value\":\"satisfies to source\"}]", description: "Connects the source of oslc_rm:satisfies", descriptionJson: "[{\"value\":\"Connects the source of oslc_rm:satisfies\"}]" };

MERGE (n:CascaraItem {id: "oslc_rm:satisfies-toTarget"})
SET n:CascaraItem:Link
SET n = { id: "oslc_rm:satisfies-toTarget", itemType: "cas:Link", instanceOf: "owl:ObjectProperty", title: "satisfies to target", titleJson: "[{\"value\":\"satisfies to target\"}]", description: "Connects the target of oslc_rm:satisfies", descriptionJson: "[{\"value\":\"Connects the target of oslc_rm:satisfies\"}]" };

MERGE (n:CascaraItem {id: "d:Req-1a8016e2872e78ecadc50feddc00029b"})
SET n:CascaraItem:anEntity
SET n = { id: "d:Req-1a8016e2872e78ecadc50feddc00029b", itemType: "cas:anEntity", instanceOf: "IREB:Requirement", title: "Data Volume", titleJson: "[{\"value\":\"Data Volume\"}]", description: "<p>The data store MUST support a total volume up to 850 GB.</p>", descriptionJson: "[{\"value\":\"<p>The data store MUST support a total volume up to 850 GB.</p>\"}]", modified: "2020-10-17T10:00:00+01:00" };

MERGE (n:CascaraItem {id: "d:Req-0Z7916e2872e78ecadc50feddc00918a"})
SET n:CascaraItem:anEntity
SET n = { id: "d:Req-0Z7916e2872e78ecadc50feddc00918a", itemType: "cas:anEntity", instanceOf: "IREB:Requirement", title: "Consistency", titleJson: "[{\"value\":\"Consistency\"}]", description: "<p>The data store MUST be consistent at all times.</p>", descriptionJson: "[{\"value\":\"<p>The data store MUST be consistent at all times.</p>\"}]", modified: "2020-10-17T10:00:00+01:00" };

MERGE (n:CascaraItem {id: "d:Req-2b9016e2872e78ecadc50feddc0013Ac"})
SET n:CascaraItem:anEntity
SET n = { id: "d:Req-2b9016e2872e78ecadc50feddc0013Ac", itemType: "cas:anEntity", instanceOf: "IREB:Requirement", title: "Response Time", titleJson: "[{\"value\":\"Response Time\"}]", description: "<p>The system SHOULD respond on user queries within 300 ms.</p>", descriptionJson: "[{\"value\":\"<p>The system SHOULD respond on user queries within 300 ms.</p>\"}]", modified: "2020-10-17T10:00:00+01:00" };

MERGE (n:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
SET n:CascaraItem:anEntity
SET n = { id: "d:Diagram-aec0df7900010000017001eaf53e8876", itemType: "cas:anEntity", instanceOf: "cas:View", title: "IT-Integration: FiCo-Application and FiCo-Data", titleJson: "[{\"value\":\"IT-Integration: FiCo-Application and FiCo-Data\"}]", modified: "2020-03-06T08:32:00+01:00" };

MERGE (n:CascaraItem {id: "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a"})
SET n:CascaraItem:anEntity
SET n = { id: "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a", itemType: "cas:anEntity", instanceOf: "FMC:Actor", title: "FiCo-Application", titleJson: "[{\"value\":\"FiCo-Application\"}]", description: "<p>IT-Application for Finance and Controlling.</p>", descriptionJson: "[{\"value\":\"<p>IT-Application for Finance and Controlling.</p>\"}]", modified: "2020-03-06T09:04:00+01:00" };

MERGE (n:CascaraItem {id: "d:MEl-50feddc00029b1a8016e2872e78ecadc"})
SET n:CascaraItem:anEntity
SET n = { id: "d:MEl-50feddc00029b1a8016e2872e78ecadc", itemType: "cas:anEntity", instanceOf: "FMC:State", title: "FiCo-Data", titleJson: "[{\"value\":\"FiCo-Data\"}]", description: "<p>Finance and Controlling Data, such as cost-units per project with budget, accrued cost etc.</p>", descriptionJson: "[{\"value\":\"<p>Finance and Controlling Data, such as cost-units per project with budget, accrued cost etc.</p>\"}]", modified: "2020-03-06T09:03:00+01:00" };

MERGE (n:CascaraItem {id: "d:SWri-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
SET n:CascaraItem:aRelationship
SET n = { id: "d:SWri-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc", itemType: "cas:aRelationship", instanceOf: "SpecIF:writes", description: "'FiCo-Application' writes 'FiCo-Data'", descriptionJson: "[{\"value\":\"'FiCo-Application' writes 'FiCo-Data'\"}]", modified: "2020-03-06T09:05:00+01:00" };

MERGE (n:CascaraItem {id: "d:SRea-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
SET n:CascaraItem:aRelationship
SET n = { id: "d:SRea-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc", itemType: "cas:aRelationship", instanceOf: "SpecIF:reads", description: "'FiCo-Application' reads 'FiCo-Data'", descriptionJson: "[{\"value\":\"'FiCo-Application' reads 'FiCo-Data'\"}]", modified: "2020-03-06T09:05:00+01:00" };

MERGE (n:CascaraItem {id: "d:Ssat-50feddc00029b1a8016e2872e78ecadc-1a8016e2872e78ecadc50feddc00029b"})
SET n:CascaraItem:aRelationship
SET n = { id: "d:Ssat-50feddc00029b1a8016e2872e78ecadc-1a8016e2872e78ecadc50feddc00029b", itemType: "cas:aRelationship", instanceOf: "oslc_rm:satisfies", description: "'FiCo-Data' satisfies 'Data Volume'", descriptionJson: "[{\"value\":\"'FiCo-Data' satisfies 'Data Volume'\"}]", modified: "2020-10-17T10:00:00+01:00" };

MERGE (n:CascaraItem {id: "d:Ssat-50feddc00029b1a8016e2872e78ecadc-0Z7916e2872e78ecadc50feddc00918a"})
SET n:CascaraItem:aRelationship
SET n = { id: "d:Ssat-50feddc00029b1a8016e2872e78ecadc-0Z7916e2872e78ecadc50feddc00918a", itemType: "cas:aRelationship", instanceOf: "oslc_rm:satisfies", description: "'FiCo-Data' satisfies 'Consistency'", descriptionJson: "[{\"value\":\"'FiCo-Data' satisfies 'Consistency'\"}]", modified: "2020-10-17T10:00:00+01:00" };

MERGE (n:CascaraItem {id: "d:Ssat-50fbfe8f0029b1a8016ea86245a9d83a-2b9016e2872e78ecadc50feddc0013Ac"})
SET n:CascaraItem:aRelationship
SET n = { id: "d:Ssat-50fbfe8f0029b1a8016ea86245a9d83a-2b9016e2872e78ecadc50feddc0013Ac", itemType: "cas:aRelationship", instanceOf: "oslc_rm:satisfies", description: "'FiCo-Application' satisfies 'Response Time'", descriptionJson: "[{\"value\":\"'FiCo-Application' satisfies 'Response Time'\"}]", modified: "2020-10-17T10:00:00+01:00" };

MERGE (n:CascaraItem {id: "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"})
SET n:CascaraItem:anEntity
SET n = { id: "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements", itemType: "cas:anEntity", instanceOf: "cas:Root", title: "Hierarchy Root", titleJson: "[{\"value\":\"Hierarchy Root\"}]", description: "... anchoring all hierarchies of this graph (package)", descriptionJson: "[{\"value\":\"... anchoring all hierarchies of this graph (package)\"}]", modified: "2026-09-30T10:23:15.171Z" };

MERGE (n:CascaraItem {id: "d:Folder-Requirements"})
SET n:CascaraItem:anEntity
SET n = { id: "d:Folder-Requirements", itemType: "cas:anEntity", instanceOf: "cas:Outline", title: "Requirements", titleJson: "[{\"value\":\"Requirements\"}]", modified: "2020-03-06T08:32:00+01:00" };

MERGE (n:CascaraItem {id: "d:Folder-SystemModel"})
SET n:CascaraItem:anEntity
SET n = { id: "d:Folder-SystemModel", itemType: "cas:anEntity", instanceOf: "cas:Outline", title: "System Model", titleJson: "[{\"value\":\"System Model\"}]", modified: "2020-03-06T08:32:00+01:00" };

MERGE (n:CascaraItem {id: "d:R-ZYXT9aJOdrgkl2T06otPj9A1bR2"})
SET n:CascaraItem:anEntity
SET n = { id: "d:R-ZYXT9aJOdrgkl2T06otPj9A1bR2", itemType: "cas:anEntity", instanceOf: "cas:Outline", title: "Model Elements (Glossary)", titleJson: "[{\"value\":\"Model Elements (Glossary)\"}]", modified: "2026-09-30T10:20:33.440Z" };

MERGE (n:CascaraItem {id: "SpecIF:priorityHigh"})
SET n:CascaraItem:EnumerationValue
SET n = { id: "SpecIF:priorityHigh", title: "high | hoch | haut", titleJson: "[{\"value\":\"high\",\"lang\":\"en\"},{\"value\":\"hoch\",\"lang\":\"de\"},{\"value\":\"haut\",\"lang\":\"fr\"}]" };

MERGE (n:CascaraItem {id: "SpecIF:priorityMedium"})
SET n:CascaraItem:EnumerationValue
SET n = { id: "SpecIF:priorityMedium", title: "medium | mittel | moyen", titleJson: "[{\"value\":\"medium\",\"lang\":\"en\"},{\"value\":\"mittel\",\"lang\":\"de\"},{\"value\":\"moyen\",\"lang\":\"fr\"}]" };

MERGE (n:CascaraItem {id: "SpecIF:priorityLow"})
SET n:CascaraItem:EnumerationValue
SET n = { id: "SpecIF:priorityLow", title: "low | niedrig | bas", titleJson: "[{\"value\":\"low\",\"lang\":\"en\"},{\"value\":\"niedrig\",\"lang\":\"de\"},{\"value\":\"bas\",\"lang\":\"fr\"}]" };

MATCH (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:Organizer"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:Package"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:Root"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:Tree"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:Outline"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:Table"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:Diagram"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:Category"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:Notation"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:linksSource"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:linksTarget"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:lists"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:shows"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:depicts"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "SpecIF:Priority-Enumeration"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "SpecIF:Priority"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "SpecIF:Paragraph"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "cas:View"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "FMC:Actor"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "FMC:State"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "FMC:Event"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "IREB:Requirement"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "SpecIF:writes"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "SpecIF:writes-toSource"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "SpecIF:writes-toTarget"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "SpecIF:reads"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "SpecIF:reads-toSource"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "SpecIF:reads-toTarget"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "oslc_rm:satisfies"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "oslc_rm:satisfies-toSource"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "oslc_rm:satisfies-toTarget"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:Req-1a8016e2872e78ecadc50feddc00029b"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:Req-0Z7916e2872e78ecadc50feddc00918a"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:Req-2b9016e2872e78ecadc50feddc0013Ac"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:MEl-50feddc00029b1a8016e2872e78ecadc"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:SWri-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:SRea-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:Ssat-50feddc00029b1a8016e2872e78ecadc-1a8016e2872e78ecadc50feddc00029b"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:Ssat-50feddc00029b1a8016e2872e78ecadc-0Z7916e2872e78ecadc50feddc00918a"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:Ssat-50fbfe8f0029b1a8016ea86245a9d83a-2b9016e2872e78ecadc50feddc0013Ac"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:Folder-Requirements"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:Folder-SystemModel"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MATCH (source:CascaraItem {id: "d:R-ZYXT9aJOdrgkl2T06otPj9A1bR2"})-[r]->()
WHERE r.cascaraManaged = true
DELETE r;

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:Organizer"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Organizer"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:0" }]->(target)
SET r = { cascaraKey: "contains:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:Organizer"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:Organizer"
MERGE (target:CascaraItem {id: "cas:Entity"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Entity"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:Package"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Package"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:1" }]->(target)
SET r = { cascaraKey: "contains:1", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:Package"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:Package"
MERGE (target:CascaraItem {id: "cas:Organizer"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Organizer"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:Root"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Root"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:2" }]->(target)
SET r = { cascaraKey: "contains:2", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:Root"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:Root"
MERGE (target:CascaraItem {id: "cas:Organizer"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Organizer"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:Root"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:Root"
MERGE (target:CascaraItem {id: "cas:lists"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:lists"
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK { cascaraKey: "enumeratedTargetLink:0" }]->(target)
SET r = { cascaraKey: "enumeratedTargetLink:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:Tree"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Tree"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:3" }]->(target)
SET r = { cascaraKey: "contains:3", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:Tree"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:Tree"
MERGE (target:CascaraItem {id: "cas:Organizer"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Organizer"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:Tree"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:Tree"
MERGE (target:CascaraItem {id: "cas:lists"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:lists"
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK { cascaraKey: "enumeratedTargetLink:0" }]->(target)
SET r = { cascaraKey: "enumeratedTargetLink:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:Outline"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Outline"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:4" }]->(target)
SET r = { cascaraKey: "contains:4", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:Outline"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:Outline"
MERGE (target:CascaraItem {id: "cas:Tree"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Tree"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:Table"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Table"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:5" }]->(target)
SET r = { cascaraKey: "contains:5", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:Table"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:Table"
MERGE (target:CascaraItem {id: "cas:Organizer"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Organizer"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:Table"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:Table"
MERGE (target:CascaraItem {id: "cas:shows"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:shows"
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK { cascaraKey: "enumeratedTargetLink:0" }]->(target)
SET r = { cascaraKey: "enumeratedTargetLink:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:Diagram"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Diagram"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:6" }]->(target)
SET r = { cascaraKey: "contains:6", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:Diagram"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:Diagram"
MERGE (target:CascaraItem {id: "cas:Property"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Property"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:Category"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Category"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:7" }]->(target)
SET r = { cascaraKey: "contains:7", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:Category"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:Category"
MERGE (target:CascaraItem {id: "cas:Property"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Property"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:Notation"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Notation"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:8" }]->(target)
SET r = { cascaraKey: "contains:8", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:Notation"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:Notation"
MERGE (target:CascaraItem {id: "cas:Category"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Category"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:linksSource"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:linksSource"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:9" }]->(target)
SET r = { cascaraKey: "contains:9", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:linksSource"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:linksSource"
MERGE (target:CascaraItem {id: "cas:Link"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Link"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:linksSource"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:linksSource"
MERGE (target:CascaraItem {id: "cas:Entity"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Entity"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:0" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:linksSource"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:linksSource"
MERGE (target:CascaraItem {id: "cas:Relationship"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Relationship"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:1" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:1", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:linksTarget"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:linksTarget"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:10" }]->(target)
SET r = { cascaraKey: "contains:10", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:linksTarget"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:linksTarget"
MERGE (target:CascaraItem {id: "cas:Link"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Link"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:linksTarget"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:linksTarget"
MERGE (target:CascaraItem {id: "cas:Entity"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Entity"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:0" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:linksTarget"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:linksTarget"
MERGE (target:CascaraItem {id: "cas:Relationship"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Relationship"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:1" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:1", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:lists"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:lists"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:11" }]->(target)
SET r = { cascaraKey: "contains:11", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:lists"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:lists"
MERGE (target:CascaraItem {id: "cas:linksTarget"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:linksTarget"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:lists"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:lists"
MERGE (target:CascaraItem {id: "cas:Entity"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Entity"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:0" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:lists"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:lists"
MERGE (target:CascaraItem {id: "cas:Relationship"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Relationship"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:1" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:1", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:lists"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:lists"
MERGE (target:CascaraItem {id: "cas:Organizer"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Organizer"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:2" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:2", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:shows"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:shows"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:12" }]->(target)
SET r = { cascaraKey: "contains:12", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:shows"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:shows"
MERGE (target:CascaraItem {id: "cas:linksTarget"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:linksTarget"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:shows"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:shows"
MERGE (target:CascaraItem {id: "cas:Entity"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Entity"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:0" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:shows"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:shows"
MERGE (target:CascaraItem {id: "cas:Relationship"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Relationship"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:1" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:1", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:depicts"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:depicts"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:13" }]->(target)
SET r = { cascaraKey: "contains:13", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:depicts"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:depicts"
MERGE (target:CascaraItem {id: "cas:linksTarget"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:linksTarget"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:depicts"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:depicts"
MERGE (target:CascaraItem {id: "cas:Entity"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Entity"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:0" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "SpecIF:Priority-Enumeration"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:Priority-Enumeration"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:14" }]->(target)
SET r = { cascaraKey: "contains:14", cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:Priority-Enumeration"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:Priority-Enumeration"
MERGE (target:CascaraItem {id: "cas:Enumeration"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Enumeration"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:Priority-Enumeration"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:Priority-Enumeration"
MERGE (target:CascaraItem {id: "SpecIF:priorityHigh"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:priorityHigh"
MERGE (source)-[r:HAS_ENUMERATED_VALUE { cascaraKey: "enumeratedValue:0" }]->(target)
SET r = { cascaraKey: "enumeratedValue:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:Priority-Enumeration"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:Priority-Enumeration"
MERGE (target:CascaraItem {id: "SpecIF:priorityMedium"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:priorityMedium"
MERGE (source)-[r:HAS_ENUMERATED_VALUE { cascaraKey: "enumeratedValue:1" }]->(target)
SET r = { cascaraKey: "enumeratedValue:1", cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:Priority-Enumeration"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:Priority-Enumeration"
MERGE (target:CascaraItem {id: "SpecIF:priorityLow"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:priorityLow"
MERGE (source)-[r:HAS_ENUMERATED_VALUE { cascaraKey: "enumeratedValue:2" }]->(target)
SET r = { cascaraKey: "enumeratedValue:2", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "SpecIF:Priority"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:Priority"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:15" }]->(target)
SET r = { cascaraKey: "contains:15", cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:Priority"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:Priority"
MERGE (target:CascaraItem {id: "cas:Link"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Link"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:Priority"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:Priority"
MERGE (target:CascaraItem {id: "SpecIF:Priority-Enumeration"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:Priority-Enumeration"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:0" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "SpecIF:Paragraph"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:Paragraph"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:16" }]->(target)
SET r = { cascaraKey: "contains:16", cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:Paragraph"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:Paragraph"
MERGE (target:CascaraItem {id: "cas:Entity"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Entity"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:Paragraph"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:Paragraph"
MERGE (target:CascaraItem {id: "cas:Diagram"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Diagram"
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY { cascaraKey: "enumeratedProperty:0" }]->(target)
SET r = { cascaraKey: "enumeratedProperty:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:Paragraph"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:Paragraph"
MERGE (target:CascaraItem {id: "cas:Category"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Category"
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY { cascaraKey: "enumeratedProperty:1" }]->(target)
SET r = { cascaraKey: "enumeratedProperty:1", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "cas:View"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:View"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:17" }]->(target)
SET r = { cascaraKey: "contains:17", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:View"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:View"
MERGE (target:CascaraItem {id: "cas:Organizer"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Organizer"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:View"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:View"
MERGE (target:CascaraItem {id: "cas:Diagram"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Diagram"
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY { cascaraKey: "enumeratedProperty:0" }]->(target)
SET r = { cascaraKey: "enumeratedProperty:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:View"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:View"
MERGE (target:CascaraItem {id: "cas:Category"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Category"
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY { cascaraKey: "enumeratedProperty:1" }]->(target)
SET r = { cascaraKey: "enumeratedProperty:1", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:View"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:View"
MERGE (target:CascaraItem {id: "cas:shows"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:shows"
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK { cascaraKey: "enumeratedTargetLink:0" }]->(target)
SET r = { cascaraKey: "enumeratedTargetLink:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "cas:View"})
ON CREATE SET source.referenceOnly = true, source.title = "cas:View"
MERGE (target:CascaraItem {id: "cas:depicts"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:depicts"
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK { cascaraKey: "enumeratedTargetLink:1" }]->(target)
SET r = { cascaraKey: "enumeratedTargetLink:1", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "FMC:Actor"})
ON CREATE SET target.referenceOnly = true, target.title = "FMC:Actor"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:18" }]->(target)
SET r = { cascaraKey: "contains:18", cascaraManaged: true };

MERGE (source:CascaraItem {id: "FMC:Actor"})
ON CREATE SET source.referenceOnly = true, source.title = "FMC:Actor"
MERGE (target:CascaraItem {id: "cas:Entity"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Entity"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "FMC:Actor"})
ON CREATE SET source.referenceOnly = true, source.title = "FMC:Actor"
MERGE (target:CascaraItem {id: "cas:Category"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Category"
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY { cascaraKey: "enumeratedProperty:0" }]->(target)
SET r = { cascaraKey: "enumeratedProperty:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "FMC:State"})
ON CREATE SET target.referenceOnly = true, target.title = "FMC:State"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:19" }]->(target)
SET r = { cascaraKey: "contains:19", cascaraManaged: true };

MERGE (source:CascaraItem {id: "FMC:State"})
ON CREATE SET source.referenceOnly = true, source.title = "FMC:State"
MERGE (target:CascaraItem {id: "cas:Entity"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Entity"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "FMC:State"})
ON CREATE SET source.referenceOnly = true, source.title = "FMC:State"
MERGE (target:CascaraItem {id: "cas:Category"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Category"
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY { cascaraKey: "enumeratedProperty:0" }]->(target)
SET r = { cascaraKey: "enumeratedProperty:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "FMC:Event"})
ON CREATE SET target.referenceOnly = true, target.title = "FMC:Event"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:20" }]->(target)
SET r = { cascaraKey: "contains:20", cascaraManaged: true };

MERGE (source:CascaraItem {id: "FMC:Event"})
ON CREATE SET source.referenceOnly = true, source.title = "FMC:Event"
MERGE (target:CascaraItem {id: "cas:Entity"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Entity"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "FMC:Event"})
ON CREATE SET source.referenceOnly = true, source.title = "FMC:Event"
MERGE (target:CascaraItem {id: "cas:Category"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Category"
MERGE (source)-[r:HAS_ENUMERATED_PROPERTY { cascaraKey: "enumeratedProperty:0" }]->(target)
SET r = { cascaraKey: "enumeratedProperty:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "IREB:Requirement"})
ON CREATE SET target.referenceOnly = true, target.title = "IREB:Requirement"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:21" }]->(target)
SET r = { cascaraKey: "contains:21", cascaraManaged: true };

MERGE (source:CascaraItem {id: "IREB:Requirement"})
ON CREATE SET source.referenceOnly = true, source.title = "IREB:Requirement"
MERGE (target:CascaraItem {id: "cas:Entity"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Entity"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "IREB:Requirement"})
ON CREATE SET source.referenceOnly = true, source.title = "IREB:Requirement"
MERGE (target:CascaraItem {id: "SpecIF:Priority"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:Priority"
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK { cascaraKey: "enumeratedTargetLink:0" }]->(target)
SET r = { cascaraKey: "enumeratedTargetLink:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "SpecIF:writes"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:writes"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:22" }]->(target)
SET r = { cascaraKey: "contains:22", cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:writes"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:writes"
MERGE (target:CascaraItem {id: "cas:Relationship"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Relationship"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:writes"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:writes"
MERGE (target:CascaraItem {id: "SpecIF:writes-toSource"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:writes-toSource"
MERGE (source)-[r:HAS_ENUMERATED_SOURCE_LINK { cascaraKey: "enumeratedSourceLink:0" }]->(target)
SET r = { cascaraKey: "enumeratedSourceLink:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:writes"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:writes"
MERGE (target:CascaraItem {id: "SpecIF:writes-toTarget"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:writes-toTarget"
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK { cascaraKey: "enumeratedTargetLink:0" }]->(target)
SET r = { cascaraKey: "enumeratedTargetLink:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "SpecIF:writes-toSource"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:writes-toSource"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:23" }]->(target)
SET r = { cascaraKey: "contains:23", cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:writes-toSource"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:writes-toSource"
MERGE (target:CascaraItem {id: "cas:linksSource"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:linksSource"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:writes-toSource"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:writes-toSource"
MERGE (target:CascaraItem {id: "FMC:Actor"})
ON CREATE SET target.referenceOnly = true, target.title = "FMC:Actor"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:0" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "SpecIF:writes-toTarget"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:writes-toTarget"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:24" }]->(target)
SET r = { cascaraKey: "contains:24", cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:writes-toTarget"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:writes-toTarget"
MERGE (target:CascaraItem {id: "cas:linksTarget"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:linksTarget"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:writes-toTarget"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:writes-toTarget"
MERGE (target:CascaraItem {id: "FMC:State"})
ON CREATE SET target.referenceOnly = true, target.title = "FMC:State"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:0" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "SpecIF:reads"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:reads"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:25" }]->(target)
SET r = { cascaraKey: "contains:25", cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:reads"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:reads"
MERGE (target:CascaraItem {id: "cas:Relationship"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Relationship"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:reads"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:reads"
MERGE (target:CascaraItem {id: "SpecIF:reads-toSource"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:reads-toSource"
MERGE (source)-[r:HAS_ENUMERATED_SOURCE_LINK { cascaraKey: "enumeratedSourceLink:0" }]->(target)
SET r = { cascaraKey: "enumeratedSourceLink:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:reads"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:reads"
MERGE (target:CascaraItem {id: "SpecIF:reads-toTarget"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:reads-toTarget"
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK { cascaraKey: "enumeratedTargetLink:0" }]->(target)
SET r = { cascaraKey: "enumeratedTargetLink:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "SpecIF:reads-toSource"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:reads-toSource"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:26" }]->(target)
SET r = { cascaraKey: "contains:26", cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:reads-toSource"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:reads-toSource"
MERGE (target:CascaraItem {id: "cas:linksSource"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:linksSource"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:reads-toSource"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:reads-toSource"
MERGE (target:CascaraItem {id: "FMC:Actor"})
ON CREATE SET target.referenceOnly = true, target.title = "FMC:Actor"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:0" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "SpecIF:reads-toTarget"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:reads-toTarget"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:27" }]->(target)
SET r = { cascaraKey: "contains:27", cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:reads-toTarget"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:reads-toTarget"
MERGE (target:CascaraItem {id: "cas:linksTarget"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:linksTarget"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "SpecIF:reads-toTarget"})
ON CREATE SET source.referenceOnly = true, source.title = "SpecIF:reads-toTarget"
MERGE (target:CascaraItem {id: "FMC:State"})
ON CREATE SET target.referenceOnly = true, target.title = "FMC:State"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:0" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "oslc_rm:satisfies"})
ON CREATE SET target.referenceOnly = true, target.title = "oslc_rm:satisfies"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:28" }]->(target)
SET r = { cascaraKey: "contains:28", cascaraManaged: true };

MERGE (source:CascaraItem {id: "oslc_rm:satisfies"})
ON CREATE SET source.referenceOnly = true, source.title = "oslc_rm:satisfies"
MERGE (target:CascaraItem {id: "cas:Relationship"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Relationship"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "oslc_rm:satisfies"})
ON CREATE SET source.referenceOnly = true, source.title = "oslc_rm:satisfies"
MERGE (target:CascaraItem {id: "oslc_rm:satisfies-toSource"})
ON CREATE SET target.referenceOnly = true, target.title = "oslc_rm:satisfies-toSource"
MERGE (source)-[r:HAS_ENUMERATED_SOURCE_LINK { cascaraKey: "enumeratedSourceLink:0" }]->(target)
SET r = { cascaraKey: "enumeratedSourceLink:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "oslc_rm:satisfies"})
ON CREATE SET source.referenceOnly = true, source.title = "oslc_rm:satisfies"
MERGE (target:CascaraItem {id: "oslc_rm:satisfies-toTarget"})
ON CREATE SET target.referenceOnly = true, target.title = "oslc_rm:satisfies-toTarget"
MERGE (source)-[r:HAS_ENUMERATED_TARGET_LINK { cascaraKey: "enumeratedTargetLink:0" }]->(target)
SET r = { cascaraKey: "enumeratedTargetLink:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "oslc_rm:satisfies-toSource"})
ON CREATE SET target.referenceOnly = true, target.title = "oslc_rm:satisfies-toSource"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:29" }]->(target)
SET r = { cascaraKey: "contains:29", cascaraManaged: true };

MERGE (source:CascaraItem {id: "oslc_rm:satisfies-toSource"})
ON CREATE SET source.referenceOnly = true, source.title = "oslc_rm:satisfies-toSource"
MERGE (target:CascaraItem {id: "cas:linksSource"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:linksSource"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "oslc_rm:satisfies-toSource"})
ON CREATE SET source.referenceOnly = true, source.title = "oslc_rm:satisfies-toSource"
MERGE (target:CascaraItem {id: "FMC:Actor"})
ON CREATE SET target.referenceOnly = true, target.title = "FMC:Actor"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:0" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "oslc_rm:satisfies-toSource"})
ON CREATE SET source.referenceOnly = true, source.title = "oslc_rm:satisfies-toSource"
MERGE (target:CascaraItem {id: "FMC:State"})
ON CREATE SET target.referenceOnly = true, target.title = "FMC:State"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:1" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:1", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "oslc_rm:satisfies-toTarget"})
ON CREATE SET target.referenceOnly = true, target.title = "oslc_rm:satisfies-toTarget"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:30" }]->(target)
SET r = { cascaraKey: "contains:30", cascaraManaged: true };

MERGE (source:CascaraItem {id: "oslc_rm:satisfies-toTarget"})
ON CREATE SET source.referenceOnly = true, source.title = "oslc_rm:satisfies-toTarget"
MERGE (target:CascaraItem {id: "cas:linksTarget"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:linksTarget"
MERGE (source)-[r:SPECIALIZES]->(target)
SET r = { cascaraManaged: true };

MERGE (source:CascaraItem {id: "oslc_rm:satisfies-toTarget"})
ON CREATE SET source.referenceOnly = true, source.title = "oslc_rm:satisfies-toTarget"
MERGE (target:CascaraItem {id: "IREB:Requirement"})
ON CREATE SET target.referenceOnly = true, target.title = "IREB:Requirement"
MERGE (source)-[r:HAS_ENUMERATED_ENDPOINT { cascaraKey: "enumeratedEndpoint:0" }]->(target)
SET r = { cascaraKey: "enumeratedEndpoint:0", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:Req-1a8016e2872e78ecadc50feddc00029b"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Req-1a8016e2872e78ecadc50feddc00029b"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:31" }]->(target)
SET r = { cascaraKey: "contains:31", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Req-1a8016e2872e78ecadc50feddc00029b"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Req-1a8016e2872e78ecadc50feddc00029b"
MERGE (target:CascaraItem {id: "SpecIF:priorityHigh"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:priorityHigh"
MERGE (source)-[r:SPECIF_PRIORITY { cascaraKey: "hasTargetLink:0" }]->(target)
SET r = { cascaraKey: "hasTargetLink:0", linkDirection: "hasTargetLink", linkClass: "SpecIF:Priority", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:Req-0Z7916e2872e78ecadc50feddc00918a"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Req-0Z7916e2872e78ecadc50feddc00918a"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:32" }]->(target)
SET r = { cascaraKey: "contains:32", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Req-0Z7916e2872e78ecadc50feddc00918a"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Req-0Z7916e2872e78ecadc50feddc00918a"
MERGE (target:CascaraItem {id: "SpecIF:priorityHigh"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:priorityHigh"
MERGE (source)-[r:SPECIF_PRIORITY { cascaraKey: "hasTargetLink:0" }]->(target)
SET r = { cascaraKey: "hasTargetLink:0", linkDirection: "hasTargetLink", linkClass: "SpecIF:Priority", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:Req-2b9016e2872e78ecadc50feddc0013Ac"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Req-2b9016e2872e78ecadc50feddc0013Ac"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:33" }]->(target)
SET r = { cascaraKey: "contains:33", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Req-2b9016e2872e78ecadc50feddc0013Ac"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Req-2b9016e2872e78ecadc50feddc0013Ac"
MERGE (target:CascaraItem {id: "SpecIF:priorityMedium"})
ON CREATE SET target.referenceOnly = true, target.title = "SpecIF:priorityMedium"
MERGE (source)-[r:SPECIF_PRIORITY { cascaraKey: "hasTargetLink:0" }]->(target)
SET r = { cascaraKey: "hasTargetLink:0", linkDirection: "hasTargetLink", linkClass: "SpecIF:Priority", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Diagram-aec0df7900010000017001eaf53e8876"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:34" }]->(target)
SET r = { cascaraKey: "contains:34", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Diagram-aec0df7900010000017001eaf53e8876"
MERGE (target:CascaraItem {id: "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a"})
ON CREATE SET target.referenceOnly = true, target.title = "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a"
MERGE (source)-[r:CAS_SHOWS { cascaraKey: "hasTargetLink:0" }]->(target)
SET r = { cascaraKey: "hasTargetLink:0", linkDirection: "hasTargetLink", linkClass: "cas:shows", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Diagram-aec0df7900010000017001eaf53e8876"
MERGE (target:CascaraItem {id: "d:MEl-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET target.referenceOnly = true, target.title = "d:MEl-50feddc00029b1a8016e2872e78ecadc"
MERGE (source)-[r:CAS_SHOWS { cascaraKey: "hasTargetLink:1" }]->(target)
SET r = { cascaraKey: "hasTargetLink:1", linkDirection: "hasTargetLink", linkClass: "cas:shows", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Diagram-aec0df7900010000017001eaf53e8876"
MERGE (target:CascaraItem {id: "d:SWri-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET target.referenceOnly = true, target.title = "d:SWri-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"
MERGE (source)-[r:CAS_SHOWS { cascaraKey: "hasTargetLink:2" }]->(target)
SET r = { cascaraKey: "hasTargetLink:2", linkDirection: "hasTargetLink", linkClass: "cas:shows", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Diagram-aec0df7900010000017001eaf53e8876"
MERGE (target:CascaraItem {id: "d:SRea-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET target.referenceOnly = true, target.title = "d:SRea-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"
MERGE (source)-[r:CAS_SHOWS { cascaraKey: "hasTargetLink:3" }]->(target)
SET r = { cascaraKey: "hasTargetLink:3", linkDirection: "hasTargetLink", linkClass: "cas:shows", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Diagram-aec0df7900010000017001eaf53e8876"
MERGE (target:CascaraItem {id: "cas:Category"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Category"
MERGE (source)-[r:HAS_PROPERTY { cascaraKey: "hasProperty:0" }]->(target)
SET r = { cascaraKey: "hasProperty:0", propertyClass: "cas:Category", value: "FMC Block Diagram", itemType: "cas:aProperty", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Diagram-aec0df7900010000017001eaf53e8876"
MERGE (target:CascaraItem {id: "cas:Diagram"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Diagram"
MERGE (source)-[r:HAS_PROPERTY { cascaraKey: "hasProperty:1" }]->(target)
SET r = { cascaraKey: "hasProperty:1", propertyClass: "cas:Diagram", value: "<p class=\"inline-label\">Model Diagram:</p><p><object type=\"image/svg+xml\" data=\"files_and_images/Very-Simple-Model-FMC.svg\">Notation: FMC Block Diagram</object></p>", itemType: "cas:aProperty", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a"})
ON CREATE SET target.referenceOnly = true, target.title = "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:35" }]->(target)
SET r = { cascaraKey: "contains:35", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:MEl-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET target.referenceOnly = true, target.title = "d:MEl-50feddc00029b1a8016e2872e78ecadc"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:36" }]->(target)
SET r = { cascaraKey: "contains:36", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:SWri-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET target.referenceOnly = true, target.title = "d:SWri-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:37" }]->(target)
SET r = { cascaraKey: "contains:37", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:SWri-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET source.referenceOnly = true, source.title = "d:SWri-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"
MERGE (target:CascaraItem {id: "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a"})
ON CREATE SET target.referenceOnly = true, target.title = "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a"
MERGE (source)-[r:SPECIF_WRITES_TOSOURCE { cascaraKey: "hasSourceLink:0" }]->(target)
SET r = { cascaraKey: "hasSourceLink:0", linkDirection: "hasSourceLink", linkClass: "SpecIF:writes-toSource", linkItemType: "cas:aSourceLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:SWri-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET source.referenceOnly = true, source.title = "d:SWri-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"
MERGE (target:CascaraItem {id: "d:MEl-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET target.referenceOnly = true, target.title = "d:MEl-50feddc00029b1a8016e2872e78ecadc"
MERGE (source)-[r:SPECIF_WRITES_TOTARGET { cascaraKey: "hasTargetLink:0" }]->(target)
SET r = { cascaraKey: "hasTargetLink:0", linkDirection: "hasTargetLink", linkClass: "SpecIF:writes-toTarget", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:SRea-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET target.referenceOnly = true, target.title = "d:SRea-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:38" }]->(target)
SET r = { cascaraKey: "contains:38", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:SRea-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET source.referenceOnly = true, source.title = "d:SRea-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"
MERGE (target:CascaraItem {id: "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a"})
ON CREATE SET target.referenceOnly = true, target.title = "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a"
MERGE (source)-[r:SPECIF_READS_TOSOURCE { cascaraKey: "hasSourceLink:0" }]->(target)
SET r = { cascaraKey: "hasSourceLink:0", linkDirection: "hasSourceLink", linkClass: "SpecIF:reads-toSource", linkItemType: "cas:aSourceLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:SRea-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET source.referenceOnly = true, source.title = "d:SRea-50fbfe8f0029b1a8016ea86245a9d83a-50feddc00029b1a8016e2872e78ecadc"
MERGE (target:CascaraItem {id: "d:MEl-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET target.referenceOnly = true, target.title = "d:MEl-50feddc00029b1a8016e2872e78ecadc"
MERGE (source)-[r:SPECIF_READS_TOTARGET { cascaraKey: "hasTargetLink:0" }]->(target)
SET r = { cascaraKey: "hasTargetLink:0", linkDirection: "hasTargetLink", linkClass: "SpecIF:reads-toTarget", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:Ssat-50feddc00029b1a8016e2872e78ecadc-1a8016e2872e78ecadc50feddc00029b"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Ssat-50feddc00029b1a8016e2872e78ecadc-1a8016e2872e78ecadc50feddc00029b"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:39" }]->(target)
SET r = { cascaraKey: "contains:39", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Ssat-50feddc00029b1a8016e2872e78ecadc-1a8016e2872e78ecadc50feddc00029b"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Ssat-50feddc00029b1a8016e2872e78ecadc-1a8016e2872e78ecadc50feddc00029b"
MERGE (target:CascaraItem {id: "d:MEl-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET target.referenceOnly = true, target.title = "d:MEl-50feddc00029b1a8016e2872e78ecadc"
MERGE (source)-[r:OSLC_RM_SATISFIES_TOSOURCE { cascaraKey: "hasSourceLink:0" }]->(target)
SET r = { cascaraKey: "hasSourceLink:0", linkDirection: "hasSourceLink", linkClass: "oslc_rm:satisfies-toSource", linkItemType: "cas:aSourceLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Ssat-50feddc00029b1a8016e2872e78ecadc-1a8016e2872e78ecadc50feddc00029b"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Ssat-50feddc00029b1a8016e2872e78ecadc-1a8016e2872e78ecadc50feddc00029b"
MERGE (target:CascaraItem {id: "d:Req-1a8016e2872e78ecadc50feddc00029b"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Req-1a8016e2872e78ecadc50feddc00029b"
MERGE (source)-[r:OSLC_RM_SATISFIES_TOTARGET { cascaraKey: "hasTargetLink:0" }]->(target)
SET r = { cascaraKey: "hasTargetLink:0", linkDirection: "hasTargetLink", linkClass: "oslc_rm:satisfies-toTarget", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:Ssat-50feddc00029b1a8016e2872e78ecadc-0Z7916e2872e78ecadc50feddc00918a"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Ssat-50feddc00029b1a8016e2872e78ecadc-0Z7916e2872e78ecadc50feddc00918a"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:40" }]->(target)
SET r = { cascaraKey: "contains:40", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Ssat-50feddc00029b1a8016e2872e78ecadc-0Z7916e2872e78ecadc50feddc00918a"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Ssat-50feddc00029b1a8016e2872e78ecadc-0Z7916e2872e78ecadc50feddc00918a"
MERGE (target:CascaraItem {id: "d:MEl-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET target.referenceOnly = true, target.title = "d:MEl-50feddc00029b1a8016e2872e78ecadc"
MERGE (source)-[r:OSLC_RM_SATISFIES_TOSOURCE { cascaraKey: "hasSourceLink:0" }]->(target)
SET r = { cascaraKey: "hasSourceLink:0", linkDirection: "hasSourceLink", linkClass: "oslc_rm:satisfies-toSource", linkItemType: "cas:aSourceLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Ssat-50feddc00029b1a8016e2872e78ecadc-0Z7916e2872e78ecadc50feddc00918a"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Ssat-50feddc00029b1a8016e2872e78ecadc-0Z7916e2872e78ecadc50feddc00918a"
MERGE (target:CascaraItem {id: "d:Req-0Z7916e2872e78ecadc50feddc00918a"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Req-0Z7916e2872e78ecadc50feddc00918a"
MERGE (source)-[r:OSLC_RM_SATISFIES_TOTARGET { cascaraKey: "hasTargetLink:0" }]->(target)
SET r = { cascaraKey: "hasTargetLink:0", linkDirection: "hasTargetLink", linkClass: "oslc_rm:satisfies-toTarget", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:Ssat-50fbfe8f0029b1a8016ea86245a9d83a-2b9016e2872e78ecadc50feddc0013Ac"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Ssat-50fbfe8f0029b1a8016ea86245a9d83a-2b9016e2872e78ecadc50feddc0013Ac"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:41" }]->(target)
SET r = { cascaraKey: "contains:41", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Ssat-50fbfe8f0029b1a8016ea86245a9d83a-2b9016e2872e78ecadc50feddc0013Ac"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Ssat-50fbfe8f0029b1a8016ea86245a9d83a-2b9016e2872e78ecadc50feddc0013Ac"
MERGE (target:CascaraItem {id: "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a"})
ON CREATE SET target.referenceOnly = true, target.title = "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a"
MERGE (source)-[r:OSLC_RM_SATISFIES_TOSOURCE { cascaraKey: "hasSourceLink:0" }]->(target)
SET r = { cascaraKey: "hasSourceLink:0", linkDirection: "hasSourceLink", linkClass: "oslc_rm:satisfies-toSource", linkItemType: "cas:aSourceLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Ssat-50fbfe8f0029b1a8016ea86245a9d83a-2b9016e2872e78ecadc50feddc0013Ac"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Ssat-50fbfe8f0029b1a8016ea86245a9d83a-2b9016e2872e78ecadc50feddc0013Ac"
MERGE (target:CascaraItem {id: "d:Req-2b9016e2872e78ecadc50feddc0013Ac"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Req-2b9016e2872e78ecadc50feddc0013Ac"
MERGE (source)-[r:OSLC_RM_SATISFIES_TOTARGET { cascaraKey: "hasTargetLink:0" }]->(target)
SET r = { cascaraKey: "hasTargetLink:0", linkDirection: "hasTargetLink", linkClass: "oslc_rm:satisfies-toTarget", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET target.referenceOnly = true, target.title = "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:42" }]->(target)
SET r = { cascaraKey: "contains:42", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:Folder-Introduction"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Folder-Introduction"
MERGE (source)-[r:CAS_LISTS { cascaraKey: "hasTargetLink:0" }]->(target)
SET r = { cascaraKey: "hasTargetLink:0", linkDirection: "hasTargetLink", linkClass: "cas:lists", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:Folder-Requirements"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Folder-Requirements"
MERGE (source)-[r:CAS_LISTS { cascaraKey: "hasTargetLink:1" }]->(target)
SET r = { cascaraKey: "hasTargetLink:1", linkDirection: "hasTargetLink", linkClass: "cas:lists", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:Folder-SystemModel"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Folder-SystemModel"
MERGE (source)-[r:CAS_LISTS { cascaraKey: "hasTargetLink:2" }]->(target)
SET r = { cascaraKey: "hasTargetLink:2", linkDirection: "hasTargetLink", linkClass: "cas:lists", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:HierarchyRoot-ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:R-ZYXT9aJOdrgkl2T06otPj9A1bR2"})
ON CREATE SET target.referenceOnly = true, target.title = "d:R-ZYXT9aJOdrgkl2T06otPj9A1bR2"
MERGE (source)-[r:CAS_LISTS { cascaraKey: "hasTargetLink:3" }]->(target)
SET r = { cascaraKey: "hasTargetLink:3", linkDirection: "hasTargetLink", linkClass: "cas:lists", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:Folder-Requirements"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Folder-Requirements"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:43" }]->(target)
SET r = { cascaraKey: "contains:43", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Folder-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Folder-Requirements"
MERGE (target:CascaraItem {id: "d:Req-1a8016e2872e78ecadc50feddc00029b"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Req-1a8016e2872e78ecadc50feddc00029b"
MERGE (source)-[r:CAS_LISTS { cascaraKey: "hasTargetLink:0" }]->(target)
SET r = { cascaraKey: "hasTargetLink:0", linkDirection: "hasTargetLink", linkClass: "cas:lists", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Folder-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Folder-Requirements"
MERGE (target:CascaraItem {id: "d:Req-0Z7916e2872e78ecadc50feddc00918a"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Req-0Z7916e2872e78ecadc50feddc00918a"
MERGE (source)-[r:CAS_LISTS { cascaraKey: "hasTargetLink:1" }]->(target)
SET r = { cascaraKey: "hasTargetLink:1", linkDirection: "hasTargetLink", linkClass: "cas:lists", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Folder-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Folder-Requirements"
MERGE (target:CascaraItem {id: "d:Req-2b9016e2872e78ecadc50feddc0013Ac"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Req-2b9016e2872e78ecadc50feddc0013Ac"
MERGE (source)-[r:CAS_LISTS { cascaraKey: "hasTargetLink:2" }]->(target)
SET r = { cascaraKey: "hasTargetLink:2", linkDirection: "hasTargetLink", linkClass: "cas:lists", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:Folder-SystemModel"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Folder-SystemModel"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:44" }]->(target)
SET r = { cascaraKey: "contains:44", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:Folder-SystemModel"})
ON CREATE SET source.referenceOnly = true, source.title = "d:Folder-SystemModel"
MERGE (target:CascaraItem {id: "d:Diagram-aec0df7900010000017001eaf53e8876"})
ON CREATE SET target.referenceOnly = true, target.title = "d:Diagram-aec0df7900010000017001eaf53e8876"
MERGE (source)-[r:CAS_LISTS { cascaraKey: "hasTargetLink:0" }]->(target)
SET r = { cascaraKey: "hasTargetLink:0", linkDirection: "hasTargetLink", linkClass: "cas:lists", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:ACP-Very-Simple-Model-FMC-with-Requirements"})
ON CREATE SET source.referenceOnly = true, source.title = "d:ACP-Very-Simple-Model-FMC-with-Requirements"
MERGE (target:CascaraItem {id: "d:R-ZYXT9aJOdrgkl2T06otPj9A1bR2"})
ON CREATE SET target.referenceOnly = true, target.title = "d:R-ZYXT9aJOdrgkl2T06otPj9A1bR2"
MERGE (source)-[r:CONTAINS { cascaraKey: "contains:45" }]->(target)
SET r = { cascaraKey: "contains:45", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:R-ZYXT9aJOdrgkl2T06otPj9A1bR2"})
ON CREATE SET source.referenceOnly = true, source.title = "d:R-ZYXT9aJOdrgkl2T06otPj9A1bR2"
MERGE (target:CascaraItem {id: "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a"})
ON CREATE SET target.referenceOnly = true, target.title = "d:MEl-50fbfe8f0029b1a8016ea86245a9d83a"
MERGE (source)-[r:CAS_LISTS { cascaraKey: "hasTargetLink:0" }]->(target)
SET r = { cascaraKey: "hasTargetLink:0", linkDirection: "hasTargetLink", linkClass: "cas:lists", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:R-ZYXT9aJOdrgkl2T06otPj9A1bR2"})
ON CREATE SET source.referenceOnly = true, source.title = "d:R-ZYXT9aJOdrgkl2T06otPj9A1bR2"
MERGE (target:CascaraItem {id: "d:MEl-50feddc00029b1a8016e2872e78ecadc"})
ON CREATE SET target.referenceOnly = true, target.title = "d:MEl-50feddc00029b1a8016e2872e78ecadc"
MERGE (source)-[r:CAS_LISTS { cascaraKey: "hasTargetLink:1" }]->(target)
SET r = { cascaraKey: "hasTargetLink:1", linkDirection: "hasTargetLink", linkClass: "cas:lists", linkItemType: "cas:aTargetLink", cascaraManaged: true };

MERGE (source:CascaraItem {id: "d:R-ZYXT9aJOdrgkl2T06otPj9A1bR2"})
ON CREATE SET source.referenceOnly = true, source.title = "d:R-ZYXT9aJOdrgkl2T06otPj9A1bR2"
MERGE (target:CascaraItem {id: "cas:Category"})
ON CREATE SET target.referenceOnly = true, target.title = "cas:Category"
MERGE (source)-[r:HAS_PROPERTY { cascaraKey: "hasProperty:0" }]->(target)
SET r = { cascaraKey: "hasProperty:0", propertyClass: "cas:Category", value: "SpecIF:Glossary", itemType: "cas:aProperty", cascaraManaged: true };