import Foundation

@objc protocol SetOnboardingStatusUseCase {
    
    func setStatusForOnboarding(_ hasSeenOnboarding: Bool, _ completion: (_ success: Bool) -> Void)
    
}
