import Foundation
import UIKit

class AddItemViewController: UIAlertController {
    
    var presenter: AddItemViewOutput?
    
    func configure() {
        self.addTextField { (textField: UITextField) in
        }
        
        self.addAction(saveAction)
        self.addAction(cancelAction)
    }
    
    lazy var saveAction: UIAlertAction = {
        return UIAlertAction(title: NSLocalizedString("alert.action.save", comment: ""),
                             style: UIAlertActionStyle.default,
                             handler: { (action) in
            if let alertTextField = self.textFields?.first {
                self.presenter?.didClickAddAction(with: alertTextField.text ?? "")
            }
        })
    }()
    
    lazy var cancelAction: UIAlertAction = {
        return UIAlertAction(title: NSLocalizedString("alert.action.cancel", comment: ""),
                             style: UIAlertActionStyle.cancel,
                             handler: { (action) in
        })
    }()
}
