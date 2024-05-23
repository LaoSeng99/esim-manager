import Foundation
import Capacitor
import CoreTelephony

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(EsimManagerPlugin)
public class EsimManagerPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "EsimManagerPlugin"
    public let jsName = "EsimManager"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = EsimManager()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc func checkESimSupport(_ call: CAPPluginCall) {
        if #available(iOS 12.1, *) {
            let support = self.isESimSupported()
            call.resolve([
                "supported": support
            ])
        } else {
            call.resolve([
                "supported": false
            ])
        }
    }

     private func isESimSupported() -> Bool {
        if let cellularProvider = CTTelephonyNetworkInfo().serviceSubscriberCellularProviders?.first?.value {
            return cellularProvider.supportsCellularPlan()
        }
        return false
    }
}

extension CTCarrier {
    func supportsCellularPlan() -> Bool {
        return self.allowsVOIP
    }
}