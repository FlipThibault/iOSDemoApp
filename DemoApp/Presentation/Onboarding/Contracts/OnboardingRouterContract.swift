import Foundation

protocol OnboardingRouterInput {
    func requestDismiss()
}

protocol OnboardingRouterOutput {
    func dismissOnboarding()
}
