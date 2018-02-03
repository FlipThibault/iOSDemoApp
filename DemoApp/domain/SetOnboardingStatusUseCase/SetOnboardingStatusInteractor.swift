import Foundation

class SetOnboardingStatusInteractor {
    
    var dataSource: KeyValueDataSource?
    
}

extension SetOnboardingStatusInteractor : SetOnboardingStatusUseCase {
    
    func setStatusForOnboarding(_ hasSeenOnboarding: Bool, _ completion: (Bool) -> Void) {
        
        let key = Constants.UserDefaultKeys.hasSeenOnboarding
        
        dataSource?.setPersistedBoolValue(value: hasSeenOnboarding, for: key, { (success) in
            completion(success)
        })
        
    }
    
}
