import Foundation

class FetchOnboardingStatusInteractor {
    var dataSource: KeyValueDataSource?
}

extension FetchOnboardingStatusInteractor: FetchOnboardingStatusUseCase {
    func shouldShowOnboarding(_ completion: (_ hasSeenOboarding: Bool) -> Void) {
        let key = Constants.UserDefaultKeys.hasSeenOnboarding
        dataSource?.getPersistedBoolValue(for: key, { (hasSeenOnboarding) in
            completion(hasSeenOnboarding)
        })
    }
}
