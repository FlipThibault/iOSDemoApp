import Foundation
import UIKit

class ListRouter: NSObject {
    
    weak var vc : UIViewController?
    
    init(with viewController: UIViewController) {
        self.vc = viewController
    }
    
}

extension ListRouter: ListRouterInput {
    
    func goToDetail(with delegate: DetailViewModuleDelegate, and item: AppListItemModel, and list: AppListModel) {
        let detailVC = DetailModuleFactory.buildModule(with: delegate, with: item, and: list)
        vc?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func goToAddView(with delegate: AddItemViewModuleDelegate, and list: AppListModel) {
        let addVc = AddItemModuleFactory.buildModule(with: delegate, and: list)
        vc?.present(addVc, animated: true, completion: nil)
    }
    
}
