import Foundation

protocol ListRouterInput {
 
    func goToDetail(with item: AppListItemModel, and list: AppListModel)
    func goToAddView(with delegate: AddItemViewOutput)
    
}

protocol ListRouterOutput {
    
}
