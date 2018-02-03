import Foundation

class RootPresenter: NSObject {
    
    var router : RootRouterInput?
    var interactor : FetchOnboardingStatusUseCase?
    
}

extension RootPresenter : RootViewOutput {
    
    func viewDidLoad() {
        
        interactor?.shouldShowOnboarding({ (hasSeenOnboarding) in
            if(hasSeenOnboarding) {
                router?.goToNext()
            } else {
                router?.goToOnboarding()
            }
        })

    }
    
}
