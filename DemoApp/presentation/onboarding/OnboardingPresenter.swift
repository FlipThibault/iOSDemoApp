import Foundation

class OnboardingPresenter {
    
    var router: OnboardingRouterInput?
    
}

extension OnboardingPresenter : OnboardingViewOutput {
    func didClickNext() {
        router?.requestDismiss()
        //move this into interactor/data store eventually
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: Constants.UserDefaultKeys.hasSeenOnboarding)
    }
}
