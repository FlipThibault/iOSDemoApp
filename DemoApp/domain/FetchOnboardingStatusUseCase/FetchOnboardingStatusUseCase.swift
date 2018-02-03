import Foundation

@objc protocol FetchOnboardingStatusUseCase {
    
    func shouldShowOnboarding(_ completion: (_ result: Bool) -> Void)
    
}
