# CASCaRA Flow Extension — Examples

Companion artifacts for the CASCaRA extension proposal
`2026-06-22-ProposalForCASCaRAExtension.docx` (Rieger, Esen, Koenig,
Milanesi — Infineon), with the vocabulary agreed by the CASCaRA working
group after submission.

> **Why this folder exists.** After submitting the proposal, the
> working group asked two follow-up questions (Kirsch, Dungern, 2026-06-25):
>
> - Michael Kirsch: *"CASCaRA already allows attributes on every
>   Relationship — will each Function-relation need extra qualification,
>   or only some? And how will you do this in SysML?"*
> - Oskar von Dungern: *"Is this extension conceptually aligned with
>   CASCaRA's philosophy?"*
>
> The material in this folder is the concrete answer to those
> questions: the SysML v1 / SysML v2 reference model Viola promised in
> the reply, plus a real CASCaRA-vocabulary instance file so the
> transformation is visible directly. See
> [`../EMAIL_TO_CASCARA_WG.md`](../EMAIL_TO_CASCARA_WG.md) for the
> copy-paste follow-up email that points reviewers here.

> **Vocabulary update since submission.** The `.docx` proposal uses
> `FlowObject` as the root type and further sub-categorises information
> into `ControlSignal` / `DataObject` / `EventObject` /
> `ConfigurationObject`, and energy into `ElectricalEnergy` /
> `MechanicalEnergy`. After submission, the working group agreed to
> simplify to a single root **`ItemFlow`** with exactly four direct
> specializations: **`EnergyFlow`**, **`ForceFlow`**, **`MaterialFlow`**,
> **`InformationFlow`**. All files in this folder use the agreed
> vocabulary; the `.docx` will be updated separately.

Agreed vocabulary:

- Root type **`ItemFlow`**
- Four direct specializations: **`EnergyFlow`**, **`ForceFlow`**,
  **`MaterialFlow`**, **`InformationFlow`**
- **`FunctionPort`** (typed I/O on Function) with `maxLatency`,
  `maxPowerDissipation`, `securityClassification`, `integrityLevel`,
  `protocolStr`
- **`Actor`** hierarchy (`User`, `ExternalSystem`, `Sensor`, `Actuator`)
  and the **`Source` / `Sink`** flow roles

Every SysML v2 file (`.sysml`) parses cleanly in [Syside
Modeler](https://sensmetry.com/syside/). Every SysML v1 file (`.puml`)
renders with the [PlantUML VS Code
extension](https://marketplace.visualstudio.com/items?itemName=jebbs.plantuml).

## Files

| Purpose | SysML v1 (PlantUML) | SysML v2 (Syside) |
|---|---|---|
| Ontology — the proposed CASCaRA extension itself | [FlowMetamodelProposal_SysMLv1.puml](FlowMetamodelProposal_SysMLv1.puml) | [FlowMetamodelProposal_SysMLv2.sysml](FlowMetamodelProposal_SysMLv2.sysml) |
| Worked example 1 — EV Traction Inverter (Infineon-core electronics: SiC power module + gate driver + AURIX MCU; validates all four `ItemFlow` sub-kinds, `User`, `ExternalSystem`, `Actuator`, `Source`, `Sink`) | [EVTractionInverter_SysMLv1.puml](EVTractionInverter_SysMLv1.puml) | [EVTractionInverter_SysMLv2.sysml](EVTractionInverter_SysMLv2.sysml) |
| Worked example 1 — Object-flow view (FAS Fig. 1 style: named, labeled arrows for every object flow) | [EVTractionInverter_ObjectFlow.puml](EVTractionInverter_ObjectFlow.puml) | *n/a — rendered by Syside from the .sysml file* |
| Worked example 2 — Mobile Device Authentication with concurrent WiFi (validates `securityClassification`, `protocolStr`, `integrityLevel`, `User` actor, two flows in different security contexts) | [MobileDeviceAuth_SysMLv1.puml](MobileDeviceAuth_SysMLv1.puml) | [MobileDeviceAuth_SysMLv2.sysml](MobileDeviceAuth_SysMLv2.sysml) |
| Worked example 3 — Event-triggered Function (closes ISO 15288 Cl. 6.4.3.3 b)1) NOTE 6: commence / cease conditions) | [EventTriggeredFunction_SysMLv1.puml](EventTriggeredFunction_SysMLv1.puml) | [EventTriggeredFunction_SysMLv2.sysml](EventTriggeredFunction_SysMLv2.sysml) |
| Modeling reference card — Part with FlowProperty (pure-electronics 12 V → 3 V3 rail chain + CAN transceiver) mapped SysML v1 ↔ SysML v2 | [PartWithFlowProperty_SysMLv1.puml](PartWithFlowProperty_SysMLv1.puml) | [PartWithFlowProperty_SysMLv2.sysml](PartWithFlowProperty_SysMLv2.sysml) |
| SmartSysKit mirror — CIC_Sample1 Courtesy Light (uses SmartSysKit local vocabulary: `CANFDFrame`, `DoorOpens`, `CourtseyLightOn`, …) | [CourtesyLight_SysMLv1.puml](CourtesyLight_SysMLv1.puml) | [CourtesyLight_SysMLv2.sysml](CourtesyLight_SysMLv2.sysml) |
| **Real CASCaRA data instance — EV Traction Inverter (Turtle)** | *n/a* | [EVTractionInverter_CASCaRA.ttl](EVTractionInverter_CASCaRA.ttl) |

## Rendered diagrams

Pre-rendered PNGs are checked in so reviewers can browse the artefacts
without opening Syside, PlantUML or EA. Filenames follow the pattern
`<Example>_<viewName>.png`.

### Ontology — CASCaRA Flow Extension proposal

- ![Item flow taxonomy](FlowMetamodelProposal_itemFlowTaxonomyView.png)
- ![Actor hierarchy + Source/Sink roles](FlowMetamodelProposal_actorHierarchyView.png)
- ![FunctionPort](FlowMetamodelProposal_functionPortView.png)
- ![Demo composite (slide diagram)](FlowMetamodelProposal_demoView.png)
- ![Package overview](FlowMetamodelProposal_packageOverviewView.png)

### Worked example 1 — EV Traction Inverter

- ![Signal realization tree](EVTractionInverter_signalRealizationView.png)
- ![Composite behavior (functional analysis)](EVTractionInverter_tractionInverterBehaviorView.png)
- ![Preliminary architecture](EVTractionInverter_tractionInverterArchitectureView.png)
- ![Traction subsystem block breakdown](EVTractionInverter_tractionSubsystemView.png)
- ![External actor roles](EVTractionInverter_actorRolesView.png)
- ![Package overview](EVTractionInverter_packageOverviewView.png)

### Worked example 2 — Mobile Device Authentication

- ![Signal realization tree](MobileDeviceAuth_signalRealizationView.png)
- ![Composite behavior](MobileDeviceAuth_mobileDeviceBehaviorView.png)
- ![Architecture](MobileDeviceAuth_mobileDeviceArchitectureView.png)
- ![Actor roles (User + WiFi peer)](MobileDeviceAuth_actorRolesView.png)
- ![Package overview](MobileDeviceAuth_packageOverviewView.png)

### Worked example 3 — Event-triggered Function

- ![Signal realization tree](EventTriggeredFunction_signalRealizationView.png)
- ![Headlight-control instance](EventTriggeredFunction_headlightControlInstanceView.png)
- ![Actor roles (AmbientLightSensor)](EventTriggeredFunction_actorRolesView.png)
- ![Package overview](EventTriggeredFunction_packageOverviewView.png)

### Modeling reference card — Part with FlowProperty (power-rail chain)

- ![Part declaration view](PartWithFlowProperty_partDeclarationView.png)
- ![Power-rail instance view](PartWithFlowProperty_powerRailInstanceView.png)

### SmartSysKit mirror — CIC_Sample1 Courtesy Light

- ![Preliminary architecture](CourtesyLight_preliminaryArchitectureView.png)
- ![System boundary](CourtesyLight_systemBoundaryView.png)
- ![RegisterFirstDoorOpens activity](CourtesyLight_registerFirstDoorOpensActivityView.png)
- ![Package overview](CourtesyLight_packageOverviewView.png)
- ![Package overview (alt render)](CourtesyLight_packageOverviewView_alt.png)

## How to view a diagram

1. Open the file in VS Code.
2. **SysML v2** — place the cursor on any `view` name at the bottom of the
   file (e.g. `itemFlowTaxonomyView`, `fuelPumpArchitectureView`,
   `powertrainInstanceView`) or on the target part / action, then run
   `Ctrl+Shift+P` → **Syside: Visualize**.
3. **SysML v1** — press `Alt+D` (or `Ctrl+Shift+P` → **PlantUML: Preview
   Current Diagram**).

## What is intentionally NOT here

The `.sysml` files are illustrations of how a modeler *may* express the
CASCaRA extension in SysML v2. CASCaRA itself remains tool-independent;
these files are not a formal transformation. See the file headers for
per-example scope notes.

## External reference — full SysML v1 example for electronics

For a broader, real-world **SysML v1** example showing item flows across
electrical components (beyond the compact snippets in this folder), see:

- [Conceptboard: full SysML v1 electronics item-flow example](https://app.conceptboard.com/board-welcome/board/0gqr-omhe-mrf2-sh0x-sbo5)

This board is the canonical reference for how item flows are used in a
full SysML v1 architecture of an electrical / electronic product; the
examples in this folder are the CASCaRA-extension-aligned counterparts.

## For an example close to reality in productive usage

The diagrams in this folder are **proposal artefacts** — they exercise
the CASCaRA extension in isolation.

For an example **close to reality in productive usage**, refer to the
**`CIC_Sample1`** package in the SmartSysKit project at the root of
this repository:

- **File:** [`2026-05-CIC_Sample.qeax`](https://github.com/GfSE/CASCaDE-Verification-and-Validation/blob/main/Infineon%20CIC%20%5BSparx%20EA%5D/1_Source/2026-05-CIC_Sample.qeax) (Enterprise Architect, GfSE GitHub)
- **Path in EA:** `Model → CIC_Sample1`

`CIC_Sample1` contains the productive interior-lighting subsystem used
in day-to-day OEM specifications — the same courtesy-light scenario
that the proposal Part 2 Example 1 references, but at production level
of detail (full `SystemAssumptions`, `FunctionalArchitecture`,
`LogicalArchitecture`, `PhysicalArchitecture`; all four Auto-BDDs and
Use Case diagrams). The `CourtesyLight_*` files in this folder mirror
its structure in standard SysML v1 / SysML v2 so the working group can
read it without opening EA.
