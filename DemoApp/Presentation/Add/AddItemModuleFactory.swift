import Foundation
import UIKit

protocol AddItemViewModuleDelegate {
    func notifyItemAdded(item: AppListItemModel)
    func notifyItemAddedError(item: AppListItemModel, error: NSError?)
}

class AddItemModuleFactory {
    
    static func buildModule(with delegate: AddItemViewModuleDelegate, and list: AppListModel) -> UIViewController {
        
        let vc = AddItemViewController(title: NSLocalizedString("add.alert.title", comment: ""),
                                   message: NSLocalizedString("add.alert.message", comment: ""),
                                   preferredStyle: .alert)
        
        vc.configure()
        
        let presenter = AddItemPresenter(with: list)
        let listItemDataSource = MemoryListItemDataSource()
        let saveItemUseCase = SaveItemInteractor(with: listItemDataSource)
        presenter.moduleDelegate = delegate
        presenter.saveItemUseCase = saveItemUseCase
        
        vc.presenter = presenter
        
        return vc
        
    }
    
}
