import Foundation
import UIKit

class OnboardingViewController : UIViewController {
    
    var onboardingView : OnboardingView?
    var presenter : OnboardingViewOutput?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.red
    }
    
}

extension OnboardingViewController : OnboardingViewDelegate {
    func didClickButton(_ sender: UIButton) {
        presenter?.didClickNext()
    }
}

extension OnboardingViewController : OnboardingViewInput {
    
}
