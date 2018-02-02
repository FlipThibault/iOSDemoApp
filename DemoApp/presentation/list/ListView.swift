import Foundation
import UIKit

@objc protocol ListViewDelegate {
    
}

class ListView : UITableView {
    
    weak var listViewDelegate : ListViewDelegate?

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
