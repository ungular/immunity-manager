//
//  StartupPlugin.swift
//  App
//
//  Created by Dmitry Preobrazhenskiy on 10.04.2020.
//

import Foundation
import Capacitor

@objc(StartupPlugin)
public class StartupPlugin: CAPPlugin {
  
  @objc func initDefaults(_ call: CAPPluginCall) {
    // TODO make the intial setup
    call.success()
  }
}
