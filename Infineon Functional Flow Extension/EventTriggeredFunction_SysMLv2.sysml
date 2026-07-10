// =============================================================================
// SysML v2 -- Event-triggered Function (ISO 15288 commence / cease evidence)
//
// Closes ISO 15288:2023 Cl. 6.4.3.3 b)1) NOTE 6 -- functions must have
// commence and cease conditions. Using the CASCaRA extension both
// conditions are ordinary InformationFlow items on FunctionPorts.
//
// Modeling stance -- Option A (matches EVTractionInverter_SysMLv2.sysml).
// =============================================================================

package EventTriggeredFunctionExample {

    private import ScalarValues::*;
    private import FlowMetamodelProposal::*;

    // =========================================================================
    // 1) SIGNAL ITEM DEFS  --  each realizes InformationFlow
    // =========================================================================

    item def CommenceEvent :> InformationFlow {
        attribute :>> description = "ISO 15288 commence condition";
        attribute :>> protocolStr = "LIN";
        attribute :>> bytes       = 1;
        attribute triggerReason : String;   // e.g. "NightDetected"
    }

    item def CeaseEvent :> InformationFlow {
        attribute :>> description = "ISO 15288 cease condition";
        attribute :>> protocolStr = "LIN";
        attribute :>> bytes       = 1;
        attribute stopReason : String;      // e.g. "DaylightDetected"
    }

    // =========================================================================
    // 2) ACTION DEF (at package level)
    // =========================================================================

    action def ControlHeadlight :> Function {
        in  item commenceIn : CommenceEvent;   // "start doing this"
        in  item ceaseIn    : CeaseEvent;      // "stop doing this"
    }

    // =========================================================================
    // 3) PART DEFS WITH FLOWPROPERTIES (Option A) -- ActionPins BOUND to
    //    the part's FlowProperties via `:>>`.
    // =========================================================================

    part def HeadlightController {
        in  item commenceIn : CommenceEvent;
        in  item ceaseIn    : CeaseEvent;
        action behavior : ControlHeadlight {
            in :>> commenceIn = HeadlightController::commenceIn;
            in :>> ceaseIn    = HeadlightController::ceaseIn;
        }
    }

    // =========================================================================
    // 4) EXTERNAL ACTOR  (Sensor + Source)
    // =========================================================================

    part def AmbientLightSensor :> Sensor, Source {
        out item commenceOut : CommenceEvent;
        out item ceaseOut    : CeaseEvent;
    }

    // =========================================================================
    // 5) PRELIMINARY ARCHITECTURE  (flat container)
    // =========================================================================

    part headlightControlInstance {

        part sensor     : AmbientLightSensor;
        part controller : HeadlightController;

        // Commence: "NightDetected" -> ControlHeadlight starts
        flow f_commence of CommenceEvent
            from sensor.commenceOut
            to   controller.commenceIn;

        // Cease: "DaylightDetected" -> ControlHeadlight stops
        flow f_cease of CeaseEvent
            from sensor.ceaseOut
            to   controller.ceaseIn;
    }

    // =========================================================================
    // 6) VIEWS
    // =========================================================================

    view signalRealizationView {
        expose ItemFlow;
        expose InformationFlow;
        expose CommenceEvent;
        expose CeaseEvent;
    }

    view headlightControlInstanceView {
        expose headlightControlInstance;
    }

    view actorRolesView {
        expose AmbientLightSensor;
    }

    view packageOverviewView {
        expose EventTriggeredFunctionExample;
    }
}
