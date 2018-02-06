import Foundation

class OnboardingPresenter: NSObject {
    
    var router: OnboardingRouterInput?
    var interactor: SetOnboardingStatusUseCase?
    
}

extension OnboardingPresenter: OnboardingViewOutput {
    func didClickNext() {
        interactor?.setStatusForOnboarding(true, { (success) in
            router?.requestDismiss()
        })
    }
}
