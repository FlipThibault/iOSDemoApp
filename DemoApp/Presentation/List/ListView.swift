import Foundation
import UIKit

class ListView : UITableView {
    
    override init(frame: CGRect,  style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        self.separatorStyle = .none
    }

}
