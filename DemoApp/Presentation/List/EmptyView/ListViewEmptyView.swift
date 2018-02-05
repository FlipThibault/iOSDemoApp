import Foundation
import UIKit

class ListViewEmptyView: UIView {
    
    var message: String
    
    convenience init(with message: String) {
        self.init(frame: CGRect())
        self.message = message
        initialize()
    }
    
    override init(frame: CGRect) {
        self.message = ""
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Constants.ErrorMessages.notImplementedInitWithCoder)
    }
    
    private func initialize() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        self.addSubview(emptyMessage)
        
        NSLayoutConstraint.activate([
            emptyMessage.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            emptyMessage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
    }
    
    lazy var emptyMessage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = message
        return label
    }()
    
}
