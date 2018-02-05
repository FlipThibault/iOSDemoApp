import Foundation

protocol DetailViewModuleDelegate {
    func notifyItemUpdated(item: AppListItemModel)
    func notifyItemUpdatedError(item: AppListItemModel, error: NSError?)
}

class DetailModuleFactory {
    
    static func buildModule(with delegate: DetailViewModuleDelegate, with item: AppListItemModel, and list: AppListModel) -> DetailViewController {
        
        let view = DetailView()
        
        let presenter = DetailPresenter(with: item, and: list)
        let vc = DetailViewController(with: view)
        
        let dataSource = MemoryListItemDataSource()
        let updateItemUseCase = UpdateItemInteractor(with: dataSource)
        
        presenter.view = vc
        presenter.updateItemUseCase = updateItemUseCase
        presenter.moduleDelegate = delegate
        vc.presenter = presenter
        
        return vc
        
    }
    
}


