import Foundation
import UIKit

protocol OnboardingViewDelegate : NSObjectProtocol { // or 'class'
    
}

class OnboardingView : UIView {
    
    weak var delegate : OnboardingViewDelegate? = nil

    init(frame: CGRect, delegate: OnboardingViewDelegate?) {
        super.init(frame: frame)
        self.delegate = delegate
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func initialize() {
        self.backgroundColor = UIColor.cyan
    }
    
}

extension OnboardingView : OnboardingViewActions {
    func didPressNext() {
        
    }
}

private protocol OnboardingViewActions {
    func didPressNext()
}
