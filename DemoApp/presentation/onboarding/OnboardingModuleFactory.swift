import Foundation
import UIKit

class OnboardingModuleFactory {
    
    static func buildModule(onboardingRouterDelegate: OnboardingRouterOutput) -> UIViewController {
        
        let vc = OnboardingViewController()
        
        let view = OnboardingView()
        let presenter = OnboardingPresenter()
        let router = OnboardingRouter(vc, with: onboardingRouterDelegate)
        
        view.delegate = vc
        vc.onboardingView = view
        presenter.router = router
        
        vc.presenter = presenter
        
        return vc
    }
    
}
