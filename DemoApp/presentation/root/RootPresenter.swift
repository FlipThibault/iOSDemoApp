import Foundation

class RootPresenter {
    var router : RootRouterInput?
}

extension RootPresenter : RootViewOutput {
    func viewDidLoad() {
        
        //move this into interactor/data source eventually
        let defaults = UserDefaults.standard
        let hasSeenOnboarding = defaults.bool(forKey: Constants.UserDefaultKeys.hasSeenOnboarding)

        if(hasSeenOnboarding) {
            router?.goToNext()
        } else {
            router?.goToOnboarding()
        }
    }
}
