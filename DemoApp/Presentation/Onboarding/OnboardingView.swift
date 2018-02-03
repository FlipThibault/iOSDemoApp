import Foundation
import UIKit

protocol OnboardingViewDelegate : NSObjectProtocol { // or 'class'
    func didClickButton(_ sender: UIButton)
}

class OnboardingView : UIView {
    
    weak var delegate : OnboardingViewDelegate? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func initialize() {
        self.backgroundColor = UIColor.white
        
        nextBtn.addTarget(self, action:#selector(didPress(_:)), for: .touchUpInside)
        nextBtn.addTarget(self, action:#selector(didFinishPress(_:)), for: .touchDown)
        nextBtn.addTarget(self, action:#selector(didPress(_:)), for: .touchUpOutside)
        nextBtn.addTarget(self, action:#selector(didFinishPress(_:)), for: .touchCancel)

        self.addSubview(label)
        self.addSubview(nextBtn)
        
        NSLayoutConstraint.activate([
            
            label.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -10),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextBtn.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 10),
            nextBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
    }
    
    lazy var label : UILabel = {
        let label : UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("text.onboarding.welcome", comment: "")
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var nextBtn : UIButton = {
        let button : UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.layer.borderWidth = 2.0;
        button.layer.borderColor = UIColor.black.cgColor
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
        setNormalButtonStyles(button: button)
        return button
    }()
    
    private func setNormalButtonStyles(button: UIButton) {
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.black, for: .normal)
    }
    
    private func setPressedButtonStyles(button: UIButton) {
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.black
    }
}

extension OnboardingView : OnboardingViewActions {
    @objc func didPress(_ sender : UIButton) {
        delegate?.didClickButton(sender)
        setNormalButtonStyles(button: sender)
    }
    
    @objc func didFinishPress(_ sender: UIButton) {
        setPressedButtonStyles(button: sender)
    }
}

private protocol OnboardingViewActions {
    func didPress(_ sender : UIButton)
    func didFinishPress(_ sender : UIButton)
}
