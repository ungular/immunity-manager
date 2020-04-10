//
//  StartupPlugin.m
//  App
//
//  Created by Dmitry Preobrazhenskiy on 10.04.2020.
//

#import <Capacitor/Capacitor.h>

CAP_PLUGIN(StartupPlugin, "StartupPlugin",
  CAP_PLUGIN_METHOD(initDefaults, CAPPluginReturnPromise);
)
