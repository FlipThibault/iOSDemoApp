import Foundation
import UIKit

class ListRouter {
    
    weak var vc : UIViewController?
    
    init(with viewController: UIViewController) {
        self.vc = viewController
    }
    
}

extension ListRouter : ListRouterInput {
    
    func goToDetail(with item: AppListItemModel, and list: AppListModel) {
        
        let detailVC = DetailModuleFactory.buildModule(with: item, and: list)
        
        vc?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func goToAddView(with delegate: AddItemViewOutput) {
        
        let addVc = AddItemModuleFactory.buildModule(with: delegate)
        
        vc?.present(addVc, animated: true, completion: nil)
        
    }
    
}
