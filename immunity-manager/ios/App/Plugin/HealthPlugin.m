#import <Capacitor/Capacitor.h>

CAP_PLUGIN(HealthPlugin, "HealthPlugin",
  CAP_PLUGIN_METHOD(fetchActivityData, CAPPluginReturnPromise);
)

