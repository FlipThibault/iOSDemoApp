import Foundation
import UIKit

class ListModuleFactory {
    
    static func buildModule() -> ListViewController {
        
        let listView = ListView(frame: UIScreen.main.bounds, style: .plain)
        let presenter = ListPresenter()
        let delegateDataSource = ListViewDelegateDataSource(with: presenter, and: presenter)
        
        let vc = ListViewController(with: listView, and: delegateDataSource)
        
        let listDataSource = MemoryListDataSource()
        let listItemDataSource = MemoryListItemDataSource()

        let deleteItemUseCase = DeleteItemInteractor(with: listItemDataSource)
        let saveItemUseCase = SaveItemInteractor(with: listItemDataSource)
        let fetchListUseCase = FetchListInteractor(with: listDataSource)
        
        let router = ListRouter(with: vc)

        presenter.router = router
        presenter.deleteItemUseCase = deleteItemUseCase
        presenter.saveItemUseCase = saveItemUseCase
        presenter.fetchListUseCase = fetchListUseCase
        
        vc.presenter = presenter
        
        return vc
    }
    
}


