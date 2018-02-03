import UIKit

class RootViewController: UIViewController {
    
    var presenter : RootViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
    }

}

extension RootViewController: RootViewInput {
    
}
