import Foundation

class ListViewModelMapper {
    
    static func mapAppListModelToListViewModel(with appListModel: AppListModel) -> ListViewModel {
        
        let listItemsViewModels = appListModel.items.map { mapAppListItemModelToListViewItemModel(with: $0) }
        let listViewModel = ListViewModel(with: appListModel.identifier, and: appListModel.name, and: listItemsViewModels)
        
        return listViewModel
    }
    
    private static func mapAppListItemModelToListViewItemModel(with appListItemModel: AppListItemModel) -> ListItemViewModel {
        return ListItemViewModel(with: appListItemModel.identifier, and: appListItemModel.description)
    }
    
}
