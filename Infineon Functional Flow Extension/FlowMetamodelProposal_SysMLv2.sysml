// =============================================================================
// SysML v2 -- CASCaRA Flow Extension (working-group-agreed vocabulary)
//
// Implements the three additive extensions submitted in
// "2026-06-22-ProposalForCASCaRAExtension.docx" with the vocabulary
// updates agreed post-submission by the CASCaRA Working Group:
//
//   * The root type is `ItemFlow` (was: `FlowObject`).
//   * The four direct specializations of ItemFlow are:
//         EnergyFlow, ForceFlow, MaterialFlow, InformationFlow
//     (No intermediate `EnergyObject` / `InformationObject` layer, and no
//      leaf classes such as ControlSignal / ElectricalEnergy — modelers may
//      still add their own specializations downstream if needed.)
//
//   Extension 1 -- FunctionPort         (typed I/O ports on Function)
//   Extension 2 -- ItemFlow taxonomy    (EnergyFlow, ForceFlow, MaterialFlow,
//                                        InformationFlow)
//   Extension 3 -- Actor hierarchy      (User, ExternalSystem, Sensor,
//                                        Actuator) with Source/Sink roles
//
// Open in Syside Modeler, cursor on `flowMetamodelDemo` (or on any of the
// views at the bottom), then Ctrl+Shift+P -> "Syside: Visualize".
// =============================================================================

package FlowMetamodelProposal {

    private import ScalarValues::*;

    // =========================================================================
    // Extension 2 -- ItemFlow taxonomy (working-group-agreed)
    // =========================================================================

    item def ItemFlow {
        attribute description : String;
        attribute latencyMs   : Real;      // available on every flow kind
    }

    item def EnergyFlow :> ItemFlow {
        attribute powerW   : Real;
        attribute voltageV : Real;
        attribute currentA : Real;
    }

    item def ForceFlow :> ItemFlow {
        attribute forceN      : Real;
        attribute torqueNm    : Real;
        attribute rpm         : Real;
        attribute pressureKPa : Real;
    }

    item def MaterialFlow :> ItemFlow {
        attribute massKg      : Real;
        attribute stateStr    : String;    // "solid" | "liquid" | "gas"
        attribute massFlowGs  : Real;
    }

    item def InformationFlow :> ItemFlow {
        attribute bytes       : Integer;
        attribute protocolStr : String;    // "CAN", "SPI", "IEEE 802.11", ...
    }

    // =========================================================================
    // Extension 1 -- FunctionPort
    // Carries the non-functional properties CASCaRA cannot attach today.
    // =========================================================================

    port def FunctionPort {
        attribute directionSpec           : String;   // "in" | "out" | "inout"
        attribute maxLatencyMs            : Real;
        attribute maxPowerDissipationMw   : Real;
        attribute securityClassification  : String;   // "Public" | "Confidential" | "Secret"
        attribute integrityLevel          : String;   // "QM" | "ASIL-A".."ASIL-D"
        attribute protocolStr             : String;   // "CAN" | "IEEE 802.11" ...
    }

    // =========================================================================
    // Extension 3 -- Actor hierarchy + Source/Sink flow roles
    // =========================================================================

    part def Actor;

    // Sub-kinds of Actor (per proposal Part 2, Extension 3):
    part def User           :> Actor;
    part def ExternalSystem :> Actor;
    part def Sensor         :> Actor;
    part def Actuator       :> Actor;

    // Flow ROLES an Actor plays with respect to a FunctionPort connection.
    // A part def may combine an Actor sub-kind with a role, e.g.
    //     part def Battery :> ExternalSystem, Source;
    //     part def LED     :> Actuator,       Sink;
    part def Source;    // initiates -> FunctionPort  (per proposal)
    part def Sink;      // receives  -> FunctionPort  (per proposal)

    // =========================================================================
    // Function skeleton (SysML v2 action def = CASCaRA Function)
    // =========================================================================

    action def Function {
        // Concrete functions add FunctionPorts and typed item flows.
    }

    // Illustrative Function.1 / Function.2 pair from the prostep ivip slide.
    action def Function_1 :> Function {
        in  item statusIn : InformationFlow;
        out item cmdOut   : InformationFlow;
    }
    action def Function_2 :> Function {
        in  item cmdIn    : InformationFlow;
        out item driveOut : InformationFlow;
    }

    // Illustrative concrete actors combining Actor sub-kinds with flow roles.
    part def DriverUser        :> User,           Source {
        out item pedalOut : InformationFlow;
    }
    part def DoorSensorActor   :> Sensor,         Source {
        out item statusOut : InformationFlow;
    }
    part def ExternalWiFiPeer  :> ExternalSystem, Source, Sink {
        out item wifiTx : InformationFlow;
        in  item wifiRx : InformationFlow;
    }
    part def LEDActuator       :> Actuator,       Sink {
        in  item driveIn : InformationFlow;
    }

    // Illustrative Function.1 / Function.2 as part defs with FlowProperties
    // (Option A -- same pattern used in every concrete example in this folder).
    // Each nested `behavior` action's ActionPins are BOUND to the part's
    // FlowProperties with `:>>` -- so the part's port IS the action's pin.
    part def Function_1_Block {
        in  item statusIn : InformationFlow;
        out item cmdOut   : InformationFlow;
        action behavior : Function_1 {
            in  :>> statusIn = Function_1_Block::statusIn;
            out :>> cmdOut   = Function_1_Block::cmdOut;
        }
    }
    part def Function_2_Block {
        in  item cmdIn    : InformationFlow;
        out item driveOut : InformationFlow;
        action behavior : Function_2 {
            in  :>> cmdIn    = Function_2_Block::cmdIn;
            out :>> driveOut = Function_2_Block::driveOut;
        }
    }

    // =========================================================================
    // Demo composite (renders the slide diagram in the agreed vocabulary)
    // Flat container -- 2-deep flow endpoints so items render on connectors.
    // =========================================================================

    part flowMetamodelDemo {

        // Actors playing Source/Sink/User roles
        part driver     : DriverUser;
        part doorSensor : DoorSensorActor;
        part f1         : Function_1_Block;
        part f2         : Function_2_Block;
        part led        : LEDActuator;

        // Sensor -> Function.1 -> Function.2 -> LED
        flow f_status of InformationFlow
            from doorSensor.statusOut
            to   f1.statusIn;

        flow f_cmd of InformationFlow
            from f1.cmdOut
            to   f2.cmdIn;

        flow f_drive of InformationFlow
            from f2.driveOut
            to   led.driveIn;
    }

    // =========================================================================
    // Views -- Syside Visualize anchor points
    // =========================================================================

    view itemFlowTaxonomyView {
        expose ItemFlow;
        expose EnergyFlow;
        expose ForceFlow;
        expose MaterialFlow;
        expose InformationFlow;
    }
    view actorHierarchyView {
        expose Actor;
        expose User;
        expose ExternalSystem;
        expose Sensor;
        expose Actuator;
        expose Source;
        expose Sink;
    }
    view functionPortView {
        expose FunctionPort;
    }
    view demoView {
        expose flowMetamodelDemo;
    }
    view packageOverviewView {
        expose FlowMetamodelProposal;
    }
}
