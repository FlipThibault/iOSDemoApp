import Foundation

class OnboardingPresenter {
    
    var router: OnboardingRouterInput?
    
}

extension OnboardingPresenter : OnboardingViewOutput {
    func didClickNext() {
        router?.requestDismiss()
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: Constants.UserDefaultKeys.hasSeenOnboarding)
    }
}
