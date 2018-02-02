import Foundation
import UIKit

class ListRouter {
    
    weak var vc : UIViewController?
    
    init(with viewController: UIViewController) {
        self.vc = viewController
    }
    
}

extension ListRouter : ListRouterInput {
    
    func goToDetail() {
        
        let detailVC = DetailModuleFactory.buildModule()
        
        vc?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
