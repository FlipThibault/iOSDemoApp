import Foundation
import UIKit

class ListRouter {
    
    weak var vc : UIViewController?
    
    init(with viewController: UIViewController) {
        self.vc = viewController
    }
    
}

extension ListRouter : ListRouterInput {
    
    func goToDetail(for id: String) {
        
        let detailVC = DetailModuleFactory.buildModule(with: id)
        
        vc?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
