// =============================================================================
// SysML v2 -- EV Traction Inverter (SiC power module + gate driver)
//
// Real-world electronics validation of the CASCaRA extension.
// Infineon core product line: SiC MOSFETs, gate drivers, AURIX MCU.
//
// Modeling stance -- Option A (Part with FlowProperties):
//
//   * A `part def` has `in item` / `out item` features -- these are the
//     SysML v1 «flowProperty» equivalents. The Part IS the classifier;
//     its FlowProperties declare what enters and leaves it.
//   * `action def`s live at package level. Each action def carries the
//     same `in item` / `out item` features (its ActionPins) -- reusable,
//     no duplication.
//   * A composite `action def` (TractionInverterBehavior) wires the
//     individual actions together with `flow from pinA to pinB`, giving
//     an activity-diagram view for functional analysis.
//   * Every concrete signal `:>` REALIZES exactly one of the four
//     abstract ItemFlow kinds.
//   * `FunctionPort` (proposal Extension 1) remains a first-class element
//     in the ontology file FlowMetamodelProposal_SysMLv2.sysml. Here we
//     stay port-free so the flows are visible and the model is concise.
//
// Open in Syside Modeler, cursor on ONE of:
//   * `signalRealizationView`        (specialization tree)
//   * `tractionInverterBehaviorView` (activity-style functional analysis)
//   * `tractionInverterArchitectureView` (block/part interconnection)
// then Ctrl+Shift+P -> "Syside: Visualize".
// =============================================================================

package EVTractionInverterSubsystem {

    private import ScalarValues::*;
    private import FlowMetamodelProposal::*;

    // =========================================================================
    // 1) SIGNAL ITEM DEFS -- each realizes one abstract ItemFlow kind
    // =========================================================================

    // ---- realize InformationFlow -------------------------------------------
    item def AcceleratorPosition :> InformationFlow {
        attribute :>> bytes       = 1;
        attribute :>> protocolStr = "Analog";
        attribute pedalPct : Real;
    }
    item def TorqueRequest :> InformationFlow {
        attribute :>> bytes       = 8;
        attribute :>> protocolStr = "CAN-FD 2 Mbit/s";
        attribute :>> latencyMs   = 5.0;
        attribute torqueNmRequest : Real;
    }
    item def GatePWMSignal :> InformationFlow {
        attribute :>> protocolStr = "Isolated gate-driver";
        attribute frequencyKHz : Real;
    }
    item def InverterTelemetry :> InformationFlow {
        attribute :>> bytes       = 32;
        attribute :>> protocolStr = "CAN-FD 2 Mbit/s";
        attribute dcVoltage      : Real;
        attribute phaseCurrentA  : Real;
        attribute junctionTempC  : Real;
    }

    // ---- realize EnergyFlow ------------------------------------------------
    item def HVDCPower :> EnergyFlow {
        attribute :>> voltageV = 400.0;
        attribute :>> powerW   = 150000.0;
    }
    item def ThreePhaseACPower :> EnergyFlow {
        attribute :>> voltageV = 400.0;
        attribute :>> powerW   = 140000.0;
        attribute frequencyHz : Real;
    }
    item def ThermalLoss :> EnergyFlow {
        attribute :>> powerW = 2000.0;
    }

    // ---- realize ForceFlow -------------------------------------------------
    item def ShaftTorque :> ForceFlow {
        attribute :>> torqueNm = 250.0;
        attribute :>> rpm      = 12000.0;
    }

    // ---- realize MaterialFlow ---------------------------------------------
    item def ColdCoolantIn :> MaterialFlow {
        attribute :>> stateStr   = "liquid";
        attribute :>> massFlowGs = 100.0;
        attribute inletTempC : Real;
    }
    item def HotCoolantOut :> MaterialFlow {
        attribute :>> stateStr   = "liquid";
        attribute :>> massFlowGs = 100.0;
        attribute outletTempC : Real;
    }

    // =========================================================================
    // 2) ACTION DEFS (reusable, at package level).
    //    Each action def has typed `in item` / `out item` pins.
    // =========================================================================

    action def InterpretPedal :> Function {
        in  item pedalIn   : AcceleratorPosition;
        out item torqueOut : TorqueRequest;
    }

    action def ControlSwitching :> Function {
        in  item torqueIn     : TorqueRequest;
        out item pwmOut       : GatePWMSignal;
        out item telemetryOut : InverterTelemetry;
    }

    action def SwitchPower :> Function {
        in  item pwmIn      : GatePWMSignal;
        in  item hvdcIn     : HVDCPower;
        out item acOut      : ThreePhaseACPower;
        out item thermalOut : ThermalLoss;
    }

    action def DriveMotor :> Function {
        in  item acIn      : ThreePhaseACPower;
        out item torqueOut : ShaftTorque;
    }

    action def TransportHeat :> Function {
        in  item thermalIn  : ThermalLoss;
        in  item coolantIn  : ColdCoolantIn;
        out item coolantOut : HotCoolantOut;
    }

    // =========================================================================
    // 3) COMPOSITE ACTION DEF  --  activity view for functional analysis
    //
    //    Per the CASCaRA extension proposal, sub-actions are connected via
    //    ActionPins (activity parameters) at the composite boundary, and
    //    those parameters BIND to the FunctionalInterfaces of the enclosing
    //    part (see section 4). The composite therefore has an explicit
    //    external interface, not just internal wiring.
    // =========================================================================

    action def TractionInverterBehavior :> Function {

        // ---- Activity parameters (composite Function's external interface)
        in  item apPedalIn        : AcceleratorPosition;
        in  item apHvdcIn         : HVDCPower;
        in  item apCoolantIn      : ColdCoolantIn;
        out item apPwmToBridge    : GatePWMSignal;        // exposed for diagnostic
        out item apTelemetryOut   : InverterTelemetry;
        out item apAcOut          : ThreePhaseACPower;
        out item apThermalOut     : ThermalLoss;
        out item apShaftTorqueOut : ShaftTorque;
        out item apHotCoolantOut  : HotCoolantOut;

        // ---- Sub-actions
        action interpret : InterpretPedal;
        action control   : ControlSwitching;
        action switch    : SwitchPower;
        action driveMot  : DriveMotor;
        action transport : TransportHeat;

        // ---- Activity-parameter -> first sub-action pin ------------------
        flow f_pedal      of AcceleratorPosition from apPedalIn   to interpret.pedalIn;
        flow f_hvdc       of HVDCPower           from apHvdcIn    to switch.hvdcIn;
        flow f_coolantIn  of ColdCoolantIn       from apCoolantIn to transport.coolantIn;

        // ---- Object flows between sub-action pins ------------------------
        flow f_torque     of TorqueRequest       from interpret.torqueOut to control.torqueIn;
        flow f_pwm        of GatePWMSignal       from control.pwmOut      to switch.pwmIn;
        flow f_ac         of ThreePhaseACPower   from switch.acOut        to driveMot.acIn;
        flow f_thermal    of ThermalLoss         from switch.thermalOut   to transport.thermalIn;

        // ---- Last sub-action pin -> activity-parameter -------------------
        flow f_pwmOut     of GatePWMSignal       from control.pwmOut       to apPwmToBridge;
        flow f_telemetry  of InverterTelemetry   from control.telemetryOut to apTelemetryOut;
        flow f_acOut      of ThreePhaseACPower   from switch.acOut         to apAcOut;
        flow f_thermalOut of ThermalLoss         from switch.thermalOut    to apThermalOut;
        flow f_shaft      of ShaftTorque         from driveMot.torqueOut   to apShaftTorqueOut;
        flow f_hotCoolant of HotCoolantOut       from transport.coolantOut to apHotCoolantOut;
    }

    // =========================================================================
    // 4) PART DEFS WITH FLOWPROPERTIES + local behavior
    //    Each part's `in item` / `out item` (FunctionalInterface / Port) is
    //    BOUND to the nested action's matching ActionPin via feature-value
    //    binding (`:>> pin = partFeature`). That is exactly what the
    //    proposal shows: FunctionalInterface flowsFrom/flowsTo the Function's
    //    ActivityParameter.
    // =========================================================================

    part def VehicleControlUnit_ECU {
        in  item pedalIn   : AcceleratorPosition;
        out item torqueOut : TorqueRequest;
        action behavior : InterpretPedal {
            in  :>> pedalIn   = VehicleControlUnit_ECU::pedalIn;
            out :>> torqueOut = VehicleControlUnit_ECU::torqueOut;
        }
    }

    part def InverterController_MCU {
        // Infineon AURIX-class MCU + gate-driver front end
        in  item torqueIn     : TorqueRequest;
        out item pwmOut       : GatePWMSignal;
        out item telemetryOut : InverterTelemetry;
        action behavior : ControlSwitching {
            in  :>> torqueIn     = InverterController_MCU::torqueIn;
            out :>> pwmOut       = InverterController_MCU::pwmOut;
            out :>> telemetryOut = InverterController_MCU::telemetryOut;
        }
    }

    part def SiCPowerModule {
        // Infineon CoolSiC 3-phase MOSFET bridge
        in  item pwmIn      : GatePWMSignal;
        in  item hvdcIn     : HVDCPower;
        out item acOut      : ThreePhaseACPower;
        out item thermalOut : ThermalLoss;
        action behavior : SwitchPower {
            in  :>> pwmIn      = SiCPowerModule::pwmIn;
            in  :>> hvdcIn     = SiCPowerModule::hvdcIn;
            out :>> acOut      = SiCPowerModule::acOut;
            out :>> thermalOut = SiCPowerModule::thermalOut;
        }
    }

    part def TractionMotor_Winding {
        in  item acIn      : ThreePhaseACPower;
        out item torqueOut : ShaftTorque;
        action behavior : DriveMotor {
            in  :>> acIn      = TractionMotor_Winding::acIn;
            out :>> torqueOut = TractionMotor_Winding::torqueOut;
        }
    }

    part def CoolingLoop {
        in  item thermalIn  : ThermalLoss;
        in  item coolantIn  : ColdCoolantIn;
        out item coolantOut : HotCoolantOut;
        action behavior : TransportHeat {
            in  :>> thermalIn  = CoolingLoop::thermalIn;
            in  :>> coolantIn  = CoolingLoop::coolantIn;
            out :>> coolantOut = CoolingLoop::coolantOut;
        }
    }

    // =========================================================================
    // 5) SUBSYSTEM
    // =========================================================================

    part def TractionSubsystem {
        part vcu         : VehicleControlUnit_ECU;
        part controller  : InverterController_MCU;
        part powerModule : SiCPowerModule;
        part motor       : TractionMotor_Winding;
        part cooling     : CoolingLoop;
    }

    // =========================================================================
    // 6) EXTERNAL ACTORS (Actor hierarchy + Source/Sink roles)
    // =========================================================================

    part def Driver           :> User,           Source {
        out item pedalOut : AcceleratorPosition;
    }
    part def HVBattery        :> ExternalSystem, Source {
        out item dcOut    : HVDCPower;
    }
    part def CoolantSupply    :> ExternalSystem, Source {
        out item coolantOut : ColdCoolantIn;
    }
    part def TelemetryBus     :> ExternalSystem, Sink {
        in  item telemetryIn : InverterTelemetry;
    }
    part def HotCoolantReturn :> Actuator,       Sink {
        in  item coolantIn : HotCoolantOut;
    }
    part def Wheel            :> Actuator,       Sink {
        in  item torqueIn : ShaftTorque;
    }

    // =========================================================================
    // 7) PRELIMINARY ARCHITECTURE (FLAT container -- 2-deep flow endpoints)
    //
    // All eleven parts (5 subsystem parts + 6 external actors) are direct
    // children of the architecture container, so every `flow` connector
    // stays 2-deep (partUsage.itemFeature). The subsystem block breakdown
    // is still available via `tractionSubsystemView`.
    // =========================================================================

    part tractionInverterArchitecture {

        // -- Subsystem parts (formerly nested in TractionSubsystem) ----------
        part vcu         : VehicleControlUnit_ECU;
        part controller  : InverterController_MCU;
        part powerModule : SiCPowerModule;
        part motor       : TractionMotor_Winding;
        part cooling     : CoolingLoop;

        // -- External actors --------------------------------------------------
        part driver     : Driver;
        part hvBattery  : HVBattery;
        part coolantIn  : CoolantSupply;
        part canBus     : TelemetryBus;
        part coolantOut : HotCoolantReturn;
        part wheel      : Wheel;

        // -- InformationFlow instances ---------------------------------------
        flow f_pedal of AcceleratorPosition
            from driver.pedalOut
            to   vcu.pedalIn;
        flow f_torque of TorqueRequest
            from vcu.torqueOut
            to   controller.torqueIn;
        flow f_pwm of GatePWMSignal
            from controller.pwmOut
            to   powerModule.pwmIn;
        flow f_telemetry of InverterTelemetry
            from controller.telemetryOut
            to   canBus.telemetryIn;

        // -- EnergyFlow instances --------------------------------------------
        flow f_hvdc of HVDCPower
            from hvBattery.dcOut
            to   powerModule.hvdcIn;
        flow f_ac of ThreePhaseACPower
            from powerModule.acOut
            to   motor.acIn;
        flow f_thermal of ThermalLoss
            from powerModule.thermalOut
            to   cooling.thermalIn;

        // -- ForceFlow instance ----------------------------------------------
        flow f_shaft of ShaftTorque
            from motor.torqueOut
            to   wheel.torqueIn;

        // -- MaterialFlow instances ------------------------------------------
        flow f_coolantIn of ColdCoolantIn
            from coolantIn.coolantOut
            to   cooling.coolantIn;
        flow f_hotCoolant of HotCoolantOut
            from cooling.coolantOut
            to   coolantOut.coolantIn;
    }

    // =========================================================================
    // 8) VIEWS
    // =========================================================================

    // 8a) Realization tree -- every concrete signal :> abstract ItemFlow kind
    view signalRealizationView {
        expose ItemFlow;
        expose InformationFlow;
        expose EnergyFlow;
        expose ForceFlow;
        expose MaterialFlow;
        expose AcceleratorPosition;
        expose TorqueRequest;
        expose GatePWMSignal;
        expose InverterTelemetry;
        expose HVDCPower;
        expose ThreePhaseACPower;
        expose ThermalLoss;
        expose ShaftTorque;
        expose ColdCoolantIn;
        expose HotCoolantOut;
    }

    // 8b) Activity-diagram view for FUNCTIONAL ANALYSIS
    //     shows the actions chained by object flows between typed pins
    view tractionInverterBehaviorView {
        expose TractionInverterBehavior;
    }

    // 8c) Block/part interconnection view -- flows visible on connectors
    view tractionInverterArchitectureView {
        expose tractionInverterArchitecture;
    }

    // 8d) Subsystem block breakdown
    view tractionSubsystemView {
        expose TractionSubsystem;
    }

    // 8e) Actor roles
    view actorRolesView {
        expose Driver;
        expose HVBattery;
        expose CoolantSupply;
        expose TelemetryBus;
        expose HotCoolantReturn;
        expose Wheel;
    }

    view packageOverviewView {
        expose EVTractionInverterSubsystem;
    }
}
