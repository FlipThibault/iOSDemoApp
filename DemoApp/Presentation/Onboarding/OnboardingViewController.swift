import Foundation
import UIKit

class OnboardingViewController : UIViewController {
    
    var onboardingView : OnboardingView?
    var presenter : OnboardingViewOutput?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Constants.ErrorMessages.notImplementedInitWithCoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let subview = onboardingView {
            
            subview.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(subview)
            
            NSLayoutConstraint.activate([
                subview.topAnchor.constraint(equalTo: self.view.topAnchor),
                subview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                subview.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                subview.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            ])
        }
        
    }
    
}

extension OnboardingViewController : OnboardingViewDelegate {
    func didClickButton(_ sender: UIButton) {
        presenter?.didClickNext()
    }
}

extension OnboardingViewController : OnboardingViewInput {
    
}
