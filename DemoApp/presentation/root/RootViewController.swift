import UIKit

class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let hasSeenOnboarding = defaults.bool(forKey: Constants.UserDefaultKeys.hasSeenOnboarding)
        
        if(hasSeenOnboarding) {
            self.view.backgroundColor = UIColor.blue
            
            let mainVc = MainModuleFactory.buildModule()
            
            //standard child vc code
            self.addChildViewController(mainVc)
            mainVc.view.frame = self.view.frame
            self.view.addSubview(mainVc.view)
            mainVc.didMove(toParentViewController: self)
            
        } else {
            self.view.backgroundColor = UIColor.green
            
            let onboardingVc = OnboardingModuleFactory.buildModule()
            
            //standard child vc code
            self.addChildViewController(onboardingVc)
            onboardingVc.view.frame = self.view.frame
            self.view.addSubview(onboardingVc.view)
            onboardingVc.didMove(toParentViewController: self)
            
            defaults.set(true, forKey: Constants.UserDefaultKeys.hasSeenOnboarding)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

