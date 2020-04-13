import Foundation
import Capacitor

@objc(HealthPlugin)
public class HealthPlugin: CAPPlugin {
  @objc func fetchActivityData(_ call: CAPPluginCall) {
    
    let provider = HealthInfoProvider()
    
    guard provider.setup() else {
      call.error("Could not setup the provider")
      return
    }
    
    provider.fetchActivityData() { progress in
      guard let progress = progress else {
        call.error("Could not get the progress")
        return
      }
      
      let progressData = [
        "energy": progress.energy,
        "stand": progress.stand,
        "exercise": progress.exercise,
        "energyGoal": progress.energyGoal,
        "standGoal": progress.standGoal,
        "exerciseGoal": progress.exerciseGoal
      ]
      
      call.success(progressData)
    }
  }
}

