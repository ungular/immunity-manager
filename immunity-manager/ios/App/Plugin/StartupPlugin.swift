import Foundation
import Capacitor

@objc(StartupPlugin)
public class StartupPlugin: CAPPlugin {
  @objc func initDefaults(_ call: CAPPluginCall) {
    // TODO make the intial setup
    call.success()
  }
}
