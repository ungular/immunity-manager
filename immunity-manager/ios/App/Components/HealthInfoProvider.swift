import HealthKit
import Foundation

class HealthInfoProvider {
  private var store: HKHealthStore?
  
  class var energyUnit: HKUnit {
    return HKUnit.kilocalorie()
  }
  
  class var standUnit: HKUnit {
    return HKUnit.count()
  }
  
  class var exerciseUnit: HKUnit {
    return HKUnit.second()
  }
  
  class var isDataAvailabe: Bool {
    return HKHealthStore.isHealthDataAvailable()
  }
}

// MARK: Setup

extension HealthInfoProvider {
  func setup() {
    guard HealthInfoProvider.isDataAvailabe else {
      NSLog("HealtData is not available")
      return
    }
    
    store = HKHealthStore()
  }
}

// MARK: Public methods

extension HealthInfoProvider {
  func fetchActivityData() {
    requestAuthorization { [weak self] success in
      guard let self = self else {
        return
      }
      
      guard success else {
        return
      }
      
      self.queryActivity()
    }
  }
}

// MARK: Private methods

extension HealthInfoProvider {
  private func queryActivity() {
    let predicate = generateActivityPredicate()
    
    let query = HKActivitySummaryQuery(predicate: predicate) { [weak self] query, summary, error in
      guard let self = self else {
        return
      }
      
      if let error = error {
        NSLog("Could not fetch the activity \(error.localizedDescription)")
        return
      }
      
      guard let summary = summary, summary.count > 0 else {
        NSLog("There are no summaries to display")
        return
      }
      
      self.parse(summary: summary)
    }
    
    store?.execute(query)
  }
  
  private func parse(summary: [HKActivitySummary]) {
    for activity in summary {
      let energy = activity.activeEnergyBurned.doubleValue(for: HealthInfoProvider.energyUnit)
      let stand = activity.appleStandHours.doubleValue(for: HealthInfoProvider.standUnit)
      let exercise = activity.appleExerciseTime.doubleValue(for: HealthInfoProvider.exerciseUnit)
    }
    
    // TODO convert this into valuable data
  }
}

// MARK: Helper methods

extension HealthInfoProvider {
  private func generateActivityPredicate() -> NSPredicate {
    let calendar = Calendar.autoupdatingCurrent
    
    var dateComponents = calendar.dateComponents([.year, .month, .day ], from: Date())
    
    dateComponents.calendar = calendar
    
    return HKQuery.predicateForActivitySummary(with: dateComponents)
  }
}


// MARK: Authorization methods

extension HealthInfoProvider {
  private func requestAuthorization(completion: @escaping (Bool) -> ()) {
    let objectTypes: Set<HKObjectType> = [
      HKObjectType.activitySummaryType()
    ]
    
    store?.requestAuthorization(toShare: nil, read: objectTypes) { success, error in
      if let error = error {
        NSLog("Permissions denied \(error.localizedDescription)")
        completion(false)
        return
      } else {
        completion(success)
      }
    }
  }
}
