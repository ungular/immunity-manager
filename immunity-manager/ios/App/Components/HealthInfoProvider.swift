import HealthKit
import Foundation

struct ActivityProgress {
  var energy: Double
  var stand: Double
  var exercise: Double
  
  var energyGoal: Double
  var standGoal: Double
  var exerciseGoal: Double
}

typealias ActivityProgressCallback = ((ActivityProgress?) -> ())?

class HealthInfoProvider {
  static var store = HKHealthStore()
  
  class var energyUnit: HKUnit {
    return HKUnit.kilocalorie()
  }
  
  class var standUnit: HKUnit {
    return HKUnit.count()
  }
  
  class var exerciseUnit: HKUnit {
    return HKUnit.second()
  }
  
  class var isDataAvailable: Bool {
    return HKHealthStore.isHealthDataAvailable()
  }
}

// MARK: Setup

extension HealthInfoProvider {
  func setup() -> Bool {
    guard HealthInfoProvider.isDataAvailable else {
      NSLog("HealtData is not available")
      return false
    }
    
    // TODO: Do any additional setup
    
    return true

  }
}

// MARK: Public methods

extension HealthInfoProvider {
  func fetchActivityData(completion: ActivityProgressCallback) {
    requestAuthorization { [weak self] success in
      guard let self = self else {
        completion?(nil)
        return
      }
      
      guard success else {
        completion?(nil)
        return
      }
      
      self.queryActivity(completion: completion)
    }
  }
}

// MARK: Private methods

extension HealthInfoProvider {
  private func queryActivity(completion: ActivityProgressCallback) {
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
      
      self.parse(summary: summary, completion: completion)
    }
    
    HealthInfoProvider.store.execute(query)
  }
  
  private func parse(summary: [HKActivitySummary], completion: ActivityProgressCallback) {
    guard let activity = summary.first else {
      completion?(nil)
      return
    }
    
    let energy = activity.activeEnergyBurned.doubleValue(for: HealthInfoProvider.energyUnit)
    let stand = activity.appleStandHours.doubleValue(for: HealthInfoProvider.standUnit)
    let exercise = activity.appleExerciseTime.doubleValue(for: HealthInfoProvider.exerciseUnit)
    
    let energyGoal = activity.activeEnergyBurnedGoal.doubleValue(for: HealthInfoProvider.energyUnit)
    let standGoal = activity.appleStandHoursGoal.doubleValue(for: HealthInfoProvider.standUnit)
    let exerciseGoal = activity.appleExerciseTimeGoal.doubleValue(for: HealthInfoProvider.exerciseUnit)
    
    let progress = ActivityProgress(
      energy: energy,
      stand: stand,
      exercise: exercise,
      energyGoal: energyGoal,
      standGoal: standGoal,
      exerciseGoal: exerciseGoal
    )
    
    completion?(progress)
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
    
    HealthInfoProvider.store.requestAuthorization(toShare: nil, read: objectTypes) { success, error in
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
