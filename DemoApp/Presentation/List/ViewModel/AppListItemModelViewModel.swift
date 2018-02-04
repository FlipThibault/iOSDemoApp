import Foundation

class AppListItemModelViewModel {
    
    var listItemModel: AppListItemModel
    
    init(with listItemModel: AppListItemModel) {
        self.listItemModel = listItemModel
    }
    
}

extension AppListItemModelViewModel: ListItemViewModel {
    
    func getDisplayText() -> String {
        return listItemModel.description
    }
    
}
