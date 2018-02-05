import Foundation

protocol ListRouterInput {
 
    func goToDetail(with delegate: DetailViewModuleDelegate, and item: AppListItemModel, and list: AppListModel)
    func goToAddView(with delegate: AddItemViewModuleDelegate, and list: AppListModel)
    
}

protocol ListRouterOutput {
    
}
