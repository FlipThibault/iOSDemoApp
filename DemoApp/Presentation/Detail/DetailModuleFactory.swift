import Foundation

class DetailModuleFactory {
    
    static func buildModule(with item: AppListItemModel, and list: AppListModel) -> DetailViewController {
        
        let view = DetailView()
        
        let presenter = DetailPresenter(with: item, and: list)
        let vc = DetailViewController(with: view)
        
        presenter.view = vc
        vc.presenter = presenter
        
        return vc
        
    }
    
}


