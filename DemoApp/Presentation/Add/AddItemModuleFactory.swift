import Foundation
import UIKit

class AddItemModuleFactory {
    
    static func buildModule(with delegate: AddItemViewOutput) -> UIViewController {
        
        let vc = UIAlertController(title: NSLocalizedString("add.alert.title", comment: ""),
                                   message: NSLocalizedString("add.alert.message", comment: ""),
                                   preferredStyle: .alert)

        let saveAction = UIAlertAction(title: NSLocalizedString("alert.action.save", comment: ""),
                                       style: UIAlertActionStyle.default) { (action: UIAlertAction) in
                                        if let alertTextField = vc.textFields?.first {
                                            delegate.didClickAddAction(with: alertTextField.text ?? "")
                                        }
                                    }

        let cancelAction = UIAlertAction(title: NSLocalizedString("alert.action.cancel", comment: ""),
                                         style: UIAlertActionStyle.cancel) { (action: UIAlertAction) in
                                            delegate.didClickCancelAction()
                                        }

        
    
        vc.addTextField { (textField: UITextField) in
        }
        
        vc.addAction(saveAction)
        vc.addAction(cancelAction)
        
        return vc
        
    }
    
}
