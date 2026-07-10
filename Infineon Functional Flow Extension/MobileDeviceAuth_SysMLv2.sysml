// =============================================================================
// SysML v2 -- Mobile Device Authentication with Concurrent WiFi
//
// Second worked example from
// "2026-06-22-ProposalForCASCaRAExtension.docx" (Part 2, Example 2).
//
// Validates:
//   * Actor sub-kinds `User` (human) and `ExternalSystem` (WiFi peer)
//   * FunctionPort security attributes -- securityClassification,
//     integrityLevel, protocolStr -- realized on InformationFlow items
//   * Two concurrent flows in DIFFERENT security contexts on the same
//     system boundary (ISO 15288 Cl. 6.4.3.3 b)3) NOTE 11)
//
// Modeling stance -- Option A (matches EVTractionInverter_SysMLv2.sysml):
//   * `part def` owns FlowProperties (`in item` / `out item`)
//   * `action def`s live at package level
//   * A composite `action def` gives an activity-diagram view for
//     functional analysis
//   * Concrete signals `:>` REALIZE `InformationFlow`
//   * Flat architecture container -- flows render with typed labels
// =============================================================================

package MobileDeviceAuthExample {

    private import ScalarValues::*;
    private import FlowMetamodelProposal::*;

    // =========================================================================
    // 1) SIGNAL ITEM DEFS  --  each realizes InformationFlow
    // =========================================================================

    item def Password :> InformationFlow {
        attribute :>> bytes       = 32;
        attribute :>> protocolStr = "TLS 1.3";
        attribute securityClassification : String;   // "Confidential"
        attribute integrityLevelSpec     : String;   // e.g. "ASIL-B"
    }
    item def AuthToken :> InformationFlow {
        attribute :>> bytes       = 256;
        attribute :>> protocolStr = "OAuth2";
        attribute privilegeLevel         : String;   // "Enhanced"
        attribute securityClassification : String;
    }
    item def WiFiPayload :> InformationFlow {
        attribute :>> protocolStr = "IEEE 802.11";
        attribute securityContext  : String;         // "Isolated"
        attribute integrityLevelSpec : String;
    }

    // =========================================================================
    // 2) ACTION DEFS (reusable, at package level)
    // =========================================================================

    action def Authenticate :> Function {
        in  item pwIn      : Password;
        out item tokenOut  : AuthToken;
    }
    action def GrantPrivileges :> Function {
        in  item tokenIn : AuthToken;
    }
    action def WiFiTransceive :> Function {
        in  item wifiIn  : WiFiPayload;
        out item wifiOut : WiFiPayload;
    }

    // =========================================================================
    // 3) COMPOSITE ACTION DEF -- activity-diagram for functional analysis
    //
    //    Activity parameters at the composite boundary + flows wiring them
    //    to the first / last sub-action ActionPins, matching what the
    //    prostep ivip slide shows: FunctionalInterface flowsFrom/flowsTo
    //    FunctionFlow. Every ActionPin is CONNECTED.
    // =========================================================================

    action def MobileDeviceBehavior :> Function {

        // ---- Activity parameters (composite Function's own interface) ----
        in  item apPwIn      : Password;
        in  item apWifiIn    : WiFiPayload;
        out item apWifiOut   : WiFiPayload;

        // ---- Sub-actions ----
        action authenticate    : Authenticate;
        action grantPrivileges : GrantPrivileges;
        action wifi            : WiFiTransceive;

        // ---- Activity parameter -> first sub-action pin ------------------
        flow from apPwIn   to authenticate.pwIn;
        flow from apWifiIn to wifi.wifiIn;

        // ---- Sub-action pin -> sub-action pin (Flow A) -------------------
        flow from authenticate.tokenOut to grantPrivileges.tokenIn;

        // ---- Last sub-action pin -> activity parameter -------------------
        flow from wifi.wifiOut to apWifiOut;
    }

    // =========================================================================
    // 4) PART DEFS WITH FLOWPROPERTIES (Option A)
    //    Each part's `in item` / `out item` FlowProperty is BOUND to the
    //    nested action's ActionPin via feature-value binding (`:>>`).
    // =========================================================================

    part def AuthenticateBlock {
        in  item pwIn     : Password;
        out item tokenOut : AuthToken;
        action behavior : Authenticate {
            in  :>> pwIn     = AuthenticateBlock::pwIn;
            out :>> tokenOut = AuthenticateBlock::tokenOut;
        }
    }
    part def GrantPrivilegesBlock {
        in  item tokenIn : AuthToken;
        action behavior : GrantPrivileges {
            in :>> tokenIn = GrantPrivilegesBlock::tokenIn;
        }
    }
    part def WiFiTransceiveBlock {
        in  item wifiIn  : WiFiPayload;
        out item wifiOut : WiFiPayload;
        action behavior : WiFiTransceive {
            in  :>> wifiIn  = WiFiTransceiveBlock::wifiIn;
            out :>> wifiOut = WiFiTransceiveBlock::wifiOut;
        }
    }

    // =========================================================================
    // 5) EXTERNAL ACTORS  (Actor hierarchy + Source/Sink)
    // =========================================================================

    part def HumanUser :> User, Source {
        out item pwOut : Password;
    }
    part def WiFiPeer :> ExternalSystem, Source, Sink {
        out item wifiTx : WiFiPayload;
        in  item wifiRx : WiFiPayload;
    }

    // =========================================================================
    // 6) PRELIMINARY ARCHITECTURE  (flat container, 2-deep flow endpoints)
    // =========================================================================

    part mobileDeviceInstance {

        // Internal parts (the mobile device's three functions)
        part authenticate    : AuthenticateBlock;
        part grantPrivileges : GrantPrivilegesBlock;
        part wifi            : WiFiTransceiveBlock;

        // External actors
        part user    : HumanUser;
        part wifiExt : WiFiPeer;

        // -- Flow A: Confidential authentication chain ----------------------
        flow f_password of Password
            from user.pwOut
            to   authenticate.pwIn;

        flow f_authToken of AuthToken
            from authenticate.tokenOut
            to   grantPrivileges.tokenIn;

        // -- Flow B: Isolated WiFi context (concurrent, bidirectional) ------
        flow f_wifiIn of WiFiPayload
            from wifiExt.wifiTx
            to   wifi.wifiIn;

        flow f_wifiOut of WiFiPayload
            from wifi.wifiOut
            to   wifiExt.wifiRx;
    }

    // =========================================================================
    // 7) VIEWS
    // =========================================================================

    view signalRealizationView {
        expose ItemFlow;
        expose InformationFlow;
        expose Password;
        expose AuthToken;
        expose WiFiPayload;
    }

    view mobileDeviceBehaviorView {
        expose MobileDeviceBehavior;
    }

    view mobileDeviceArchitectureView {
        expose mobileDeviceInstance;
    }

    view actorRolesView {
        expose HumanUser;
        expose WiFiPeer;
    }

    view packageOverviewView {
        expose MobileDeviceAuthExample;
    }
}
