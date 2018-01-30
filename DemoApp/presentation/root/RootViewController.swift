import UIKit

class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let hasSeenOnboarding = defaults.bool(forKey: Constants.UserDefaultKeys.hasSeenOnboarding)
        
        if(hasSeenOnboarding) {
            self.view.backgroundColor = UIColor.blue
        } else {
            self.view.backgroundColor = UIColor.green
            defaults.set(true, forKey: Constants.UserDefaultKeys.hasSeenOnboarding)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

