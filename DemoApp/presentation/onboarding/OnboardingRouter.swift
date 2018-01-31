import Foundation
import UIKit

class OnboardingRouter {
    
    weak var vc : UIViewController?
    var delegate: OnboardingRouterOutput?
    
    init(_ vc: UIViewController, with delegate: OnboardingRouterOutput) {
        self.vc = vc
        self.delegate = delegate
    }
    
}

extension OnboardingRouter : OnboardingRouterInput {
    func requestDismiss() {
        delegate?.dismissOnboarding()
    }
}
