import Foundation

class FetchOnboardingStatusInteractor {
    
}

extension FetchOnboardingStatusInteractor : FetchOnboardingStatusUseCase {
    
    func shouldShowOnboarding(_ completion: (Bool) -> Void) {
        
        completion(true)
        
    }
    
}
