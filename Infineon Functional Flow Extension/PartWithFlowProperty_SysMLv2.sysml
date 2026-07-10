// =============================================================================
// SysML v2 -- Part with a FlowProperty (pure electronics power-rail chain)
//
// This file is NOT a formal CASCaRA-to-SysML v2 transformation.
// It is an illustration of ONE way a modeler may express the CASCaRA
// "Part-with-FlowProperty" pattern in SysML v2 using Syside Modeler.
//
// The example intentionally uses a pure-electronics scenario -- an
// Infineon-style 12 V -> 3.3 V power-rail chain -- so the diagram maps
// to a hardware artefact readers of an electronics-company proposal
// will recognise immediately:
//
//   Battery12V --EnergyFlow(12V)--> BuckConverter --EnergyFlow(5V)--> LDO
//     --EnergyFlow(3V3)--> Microcontroller --InformationFlow(CAN)--> CANTransceiver
//
// The Part is the single source of truth for what it emits or consumes:
// each `part def` DECLARES its FlowProperties (in / out feature typed by
// an ItemFlow subclass); the `flow` in the instance below just wires two
// declared FlowProperties together.
//
// Open in Syside Modeler, cursor on `powerRailInstance`, then
//   Ctrl+Shift+P -> "Syside: Visualize".
// =============================================================================

package PartWithFlowPropertyExample {

    private import ScalarValues::*;
    private import FlowMetamodelProposal::*;

    // -------------------------------------------------------------------------
    // 1) Rail-specific EnergyFlow specializations (electrical-only).
    //    Each rail carries voltage / power at that node.
    // -------------------------------------------------------------------------

    item def Rail12V :> EnergyFlow {
        attribute :>> voltageV = 12.0;
        attribute :>> powerW   = 24.0;
    }
    item def Rail5V :> EnergyFlow {
        attribute :>> voltageV = 5.0;
        attribute :>> powerW   = 5.0;
    }
    item def Rail3V3 :> EnergyFlow {
        attribute :>> voltageV = 3.3;
        attribute :>> powerW   = 1.0;
    }

    // -------------------------------------------------------------------------
    // 2) InformationFlow specialization for the CAN message the MCU emits.
    // -------------------------------------------------------------------------

    item def CANMessage :> InformationFlow {
        attribute :>> bytes       = 8;
        attribute :>> protocolStr = "CAN 2.0B";
        attribute :>> latencyMs   = 1.0;
    }

    // -------------------------------------------------------------------------
    // 3) Parts that DECLARE their FlowProperties.
    //
    //   In SysML v1 each of these would be a «block» with «flowProperty»
    //   in / out members. In SysML v2 the `in` / `out` feature on the part
    //   def PLAYS THE ROLE OF the SysML v1 FlowProperty. The type of the
    //   feature (e.g. `Rail12V`) DEFINES WHAT FLOWS.
    // -------------------------------------------------------------------------

    part def Battery12V {
        // FlowProperty: this battery cell block outputs 12 V.
        out rail12Out : Rail12V;
    }

    part def BuckConverter {
        // FlowProperty in: consumes 12 V ...
        in  rail12In : Rail12V;
        // FlowProperty out: ... and produces 5 V.
        out rail5Out : Rail5V;
    }

    part def LDO {
        in  rail5In  : Rail5V;
        out rail3v3Out : Rail3V3;
    }

    part def Microcontroller {
        // Powered from the 3.3 V rail ...
        in  rail3v3In  : Rail3V3;
        // ... and emits a CAN message on the bus.
        out canOut     : CANMessage;
    }

    part def CANTransceiver {
        in canIn : CANMessage;
    }

    // -------------------------------------------------------------------------
    // 4) Usage / instance level: connect the five parts.
    //    The flows do NOT re-state what flows; they inherit the item type
    //    from the FlowProperties on each end.
    // -------------------------------------------------------------------------

    part powerRailInstance {

        part battery      : Battery12V;
        part buck         : BuckConverter;
        part ldo          : LDO;
        part mcu          : Microcontroller;
        part canTransceiver : CANTransceiver;

        flow of Rail12V
            from battery.rail12Out
            to   buck.rail12In;

        flow of Rail5V
            from buck.rail5Out
            to   ldo.rail5In;

        flow of Rail3V3
            from ldo.rail3v3Out
            to   mcu.rail3v3In;

        flow of CANMessage
            from mcu.canOut
            to   canTransceiver.canIn;
    }

    // -------------------------------------------------------------------------
    // 5) Views  --  Syside Visualize anchor points
    // -------------------------------------------------------------------------

    view partDeclarationView {
        expose Battery12V;
        expose BuckConverter;
        expose LDO;
        expose Microcontroller;
        expose CANTransceiver;
    }

    view powerRailInstanceView {
        expose powerRailInstance;
    }
}
