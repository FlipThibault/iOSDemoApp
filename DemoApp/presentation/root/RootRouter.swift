import Foundation
import UIKit

class RootRouter {
    
    weak var vc : UIViewController?
    
    init(_ vc : UIViewController) {
        self.vc = vc
    }
    
}

extension RootRouter : RootRouterInput {
    
    func goToNext() {
        
        //TODO: need to check if another controller is currently present in order to dismiss it first
        
        let mainVc = MainModuleFactory.buildModule()

        if let view = vc?.view {
            //standard child vc code
            vc?.addChildViewController(mainVc)
            mainVc.view.frame = view.frame
            view.addSubview(mainVc.view)
            mainVc.didMove(toParentViewController: vc)
        }
        
    }
    
    func goToOnboarding() {
        let onboardingVc = OnboardingModuleFactory.buildModule(onboardingRouterDelegate: self)

        if let view = vc?.view {
            //standard child vc code
            vc?.addChildViewController(onboardingVc)
            onboardingVc.view.frame = view.frame
            view.addSubview(onboardingVc.view)
            onboardingVc.didMove(toParentViewController: vc)
        }
    }
}

extension RootRouter: OnboardingRouterOutput {
    func dismissOnboarding() {
        if let childrenViewControllers = vc?.childViewControllers {
            let lastChildVC = childrenViewControllers.last
            lastChildVC?.view.removeFromSuperview()
            lastChildVC?.removeFromParentViewController()
        }
        goToNext()
    }
}
