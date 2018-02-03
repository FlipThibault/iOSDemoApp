import Foundation
import UIKit

class NSUserDefaultsDataSource {
    let defaults = UserDefaults.standard
}

extension NSUserDefaultsDataSource : KeyValueDataSource {
    
    func getPersistedBoolValue(for key: String, _ completion: (Bool) -> Void) {
        completion(defaults.bool(forKey: Constants.UserDefaultKeys.hasSeenOnboarding))
    }
    
    func setPersistedBoolValue(value: Bool, for key: String, _ completion: (Bool) -> Void) {
        defaults.set(value, forKey: Constants.UserDefaultKeys.hasSeenOnboarding)
        completion(true)
    }
    
}
