import Foundation

class ListViewModelMapper {
    
    static func mapAppListModelToListViewModel(with appListModel: AppListModel) -> ListViewModel {
        
        let listItemsViewModels = appListModel.items.map { mapAppListItemModelToListViewItemModel(with: $0) }
        let listViewModel = AppListModelViewModel(with: appListModel, and: listItemsViewModels)
        
        return listViewModel
    }
    
    private static func mapAppListItemModelToListViewItemModel(with appListItemModel: AppListItemModel) -> ListItemViewModel {
        return AppListItemModelViewModel(with: appListItemModel)
    }
    
}
