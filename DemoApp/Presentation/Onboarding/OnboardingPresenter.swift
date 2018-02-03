import Foundation

class OnboardingPresenter {
    
    var router: OnboardingRouterInput?
    var interactor: SetOnboardingStatusUseCase?
    
}

extension OnboardingPresenter : OnboardingViewOutput {
    func didClickNext() {
        interactor?.setStatusForOnboarding(true, { (success) in
            router?.requestDismiss()
        })
    }
}
