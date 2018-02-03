import Foundation
import UIKit

class DetailView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Constants.ErrorMessages.notImplementedInitWithCoder)
    }
    
    private func initialize() {
        
        self.backgroundColor = UIColor.white
        
        self.addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 20),
            self.textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            self.textField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 20)
        ])
        
        textField.becomeFirstResponder()
    }
    
    lazy var textField : UITextField = {
        let tf = UITextField()
        return tf
    }()
    
}
