import Foundation

@objc protocol FetchOnboardingStatusUseCase {
    
    func shouldShowOnboarding(_ completion: (_ hasSeenOboarding: Bool) -> Void)
    
}
