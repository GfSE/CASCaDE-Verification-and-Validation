// =============================================================================
// SysML v2 -- Courtesy Light system (matches SmartSysKit CIC_Sample1)
//
// One-to-one mapping from the Enterprise Architect SmartSysKit model.
//
// SmartSysKit             <-->  SysML v2
//   «SystemBoundary»              part def SystemBoundary
//   «SystemFunction»              part def SystemFunction_*
//   «ExternalIF»                  part def *_Sender / *_Receiver
//   «SystemDataType»              item def *
//   «FlowProperty» CANFD Frame    attribute on item def CANFDFrame
//   «FullPort»                    port def *_PortIn / *_PortOut
//   «CallBehaviorAction»          action def *
//   «ActionPinIn/Out»             in item / out item on action def
//   «ItemFlow»                    flow of <ItemType> from <port> to <port>
//
// Open in Syside Modeler, place the cursor on `courtesyLightArchitecture`
// (or on `preliminaryArchitectureView` at the bottom) and run:
//   Ctrl+Shift+P -> "Syside: Visualize"
// =============================================================================

package CourtesyLightSystem {

    private import ScalarValues::*;

    // -------------------------------------------------------------------------
    // SystemDataTypes -- what actually flows between elements.
    // These are what CASCaRA cannot type today (gap #1).
    // -------------------------------------------------------------------------

    item def CANFDFrame {
        attribute frameId   : Integer;
        attribute payload   : String;
        attribute latencyMs : Real;   // non-functional property (CASCaRA gap #2)
        attribute powerMw   : Real;
    }

    item def ConfigDataType      :> CANFDFrame;
    item def DoorOpens           :> CANFDFrame;
    item def DoorCloses          :> CANFDFrame;
    item def DoorsAggregateState :> CANFDFrame;
    item def CourtseyLightOn     :> CANFDFrame;
    item def CourtseyLightOff    :> CANFDFrame;
    item def LastDoorClosedEvent :> CANFDFrame;

    // -------------------------------------------------------------------------
    // Port Definitions -- typed attachment points. The item type flowing
    // through each port is set by `flow of <Type>` at the usage site.
    // -------------------------------------------------------------------------

    port def RegisterFirstDoorOpens_PortIn;
    port def RegisterFirstDoorOpens_PortOut;
    port def RegisterLastDoorCloses_PortIn;
    port def RegisterLastDoorCloses_PortOut;

    // -------------------------------------------------------------------------
    // Actions -- match the "RegisterFirstDoorOpens" activity in EA.
    // Each «CallBehaviorAction» becomes an action def with typed in/out items;
    // each «ActionPinIn/Out» becomes an `in item` / `out item`.
    // -------------------------------------------------------------------------

    action def ReceiveCANFDFrame {
        in  item incoming  : CANFDFrame;
        out item processed : CANFDFrame;
    }
    action def ProcessCANFDFrame {
        in  item raw         : CANFDFrame;
        out item interpreted : CANFDFrame;
    }
    action def RegisterFirstDoorOpening {
        in  item trigger   : DoorOpens;
        out item completed : DoorsAggregateState;
    }
    action def CheckStatusAllDoors {
        in  item aggregate : DoorsAggregateState;
        out item allClosed : DoorsAggregateState;
    }
    action def SwitchOnCourtseyLight {
        in  item trigger : DoorsAggregateState;
        out item command : CourtseyLightOn;
    }
    action def TransmitCANFDFrame {
        in  item toSend : CANFDFrame;
        out item onBus  : CANFDFrame;
    }

    // Composite action = the whole "RegisterFirstDoorOpens" activity.
    action def RegisterFirstDoorOpens {
        in  item doorOpensIn      : DoorOpens;
        in  item configIn         : ConfigDataType;
        out item courtseyLightOut : CourtseyLightOn;

        action receive      : ReceiveCANFDFrame;
        action processIn    : ProcessCANFDFrame;
        action registerOpen : RegisterFirstDoorOpening;
        action checkStatus  : CheckStatusAllDoors;
        action switchOn     : SwitchOnCourtseyLight;
        action processOut   : ProcessCANFDFrame;
        action transmit     : TransmitCANFDFrame;

        // Object flows between action pins -- exactly what the
        // «ActionPinOut» -> «ActionPinIn» pairs express in the EA activity.
        flow from doorOpensIn                to receive.incoming;
        flow from receive.processed          to processIn.raw;
        flow from processIn.interpreted      to registerOpen.trigger;
        flow from registerOpen.completed     to checkStatus.aggregate;
        flow from checkStatus.allClosed      to switchOn.trigger;
        flow from switchOn.command           to processOut.raw;
        flow from processOut.interpreted     to transmit.toSend;
        flow from transmit.onBus             to courtseyLightOut;
    }

    // Analog for the "close all doors" use case.
    action def RegisterLastDoorCloses {
        in  item doorClosesIn        : DoorCloses;
        out item courtseyLightOffOut : CourtseyLightOff;
    }

    // -------------------------------------------------------------------------
    // System Boundary + SystemFunctions
    // -------------------------------------------------------------------------

    part def SystemFunction_RegisterFirstDoorOpens {
        port portIn  : RegisterFirstDoorOpens_PortIn;
        port portOut : RegisterFirstDoorOpens_PortOut;

        action behavior : RegisterFirstDoorOpens;
    }
    part def SystemFunction_RegisterLastDoorCloses {
        port portIn  : RegisterLastDoorCloses_PortIn;
        port portOut : RegisterLastDoorCloses_PortOut;

        action behavior : RegisterLastDoorCloses;
    }

    part def SystemBoundary {
        part registerFirstDoorOpens : SystemFunction_RegisterFirstDoorOpens;
        part registerLastDoorCloses : SystemFunction_RegisterLastDoorCloses;
    }

    // -------------------------------------------------------------------------
    // ExternalIFs (Actors). Senders use conjugated ports (~) so their
    // items flow OUT.
    // -------------------------------------------------------------------------

    part def ExternalIF;

    part def RegisterFirstDoorOpens_Sender   :> ExternalIF {
        port portOut : ~RegisterFirstDoorOpens_PortIn;
    }
    part def RegisterFirstDoorOpens_Receiver :> ExternalIF {
        port portIn  : ~RegisterFirstDoorOpens_PortOut;
    }
    part def RegisterLastDoorCloses_Sender   :> ExternalIF {
        port portOut : ~RegisterLastDoorCloses_PortIn;
    }
    part def RegisterLastDoorCloses_Receiver :> ExternalIF {
        port portIn  : ~RegisterLastDoorCloses_PortOut;
    }

    // -------------------------------------------------------------------------
    // Preliminary Architecture  (matches AUTO_BDD_PreliminaryArchitecture).
    // Flat container so flow endpoints stay 2-deep, which the SysML v2 pilot
    // flow syntax requires.
    //
    // The four typed item flows below are the concrete proof of what
    // CASCaRA cannot express: typed items on every Actor <-> Function edge.
    // -------------------------------------------------------------------------

    part courtesyLightArchitecture {
        part boundary : SystemBoundary;

        part firstOpenSender   : RegisterFirstDoorOpens_Sender;
        part firstOpenReceiver : RegisterFirstDoorOpens_Receiver;
        part lastCloseSender   : RegisterLastDoorCloses_Sender;
        part lastCloseReceiver : RegisterLastDoorCloses_Receiver;

        // Actor -> Function : Sender emits DoorOpens
        flow of DoorOpens
            from firstOpenSender.portOut
            to   boundary.registerFirstDoorOpens.portIn;

        // Function -> Actor : SystemFunction emits CourtseyLightOn
        flow of CourtseyLightOn
            from boundary.registerFirstDoorOpens.portOut
            to   firstOpenReceiver.portIn;

        // Analog for LastDoorCloses
        flow of DoorCloses
            from lastCloseSender.portOut
            to   boundary.registerLastDoorCloses.portIn;

        flow of CourtseyLightOff
            from boundary.registerLastDoorCloses.portOut
            to   lastCloseReceiver.portIn;
    }

    // -------------------------------------------------------------------------
    // Named views  --  anchor points for the Syside "Visualize" command.
    // Place the cursor on a view name and run:
    //   Ctrl+Shift+P -> "Syside: Visualize"
    // -------------------------------------------------------------------------

    view preliminaryArchitectureView {
        expose courtesyLightArchitecture;
    }
    view registerFirstDoorOpensActivityView {
        expose RegisterFirstDoorOpens;
    }
    view systemBoundaryView {
        expose SystemBoundary;
    }
    view packageOverviewView {
        expose CourtesyLightSystem;
    }
}
