import Foundation

@objc class AppListItemModelViewModel: NSObject {
    
    var listItemModel: AppListItemModel
    
    init(with listItemModel: AppListItemModel) {
        self.listItemModel = listItemModel
    }
    
}

extension AppListItemModelViewModel: ListItemViewModel {
    
    func getDisplayText() -> String {
        return listItemModel.descriptionText
    }
    
}
