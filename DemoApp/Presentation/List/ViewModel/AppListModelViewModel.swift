import Foundation

class AppListModelViewModel {

    var list: AppListModel
    var items: [ListItemViewModel]
    
    init(with listModel: AppListModel, and items: [ListItemViewModel]) {
        self.list = listModel
        self.items = items
    }
    
}

extension AppListModelViewModel: ListViewModel {
    
    func isEditing() -> Bool {
        return false
    }
    
    func getDisplayName() -> String {
        return self.list.name
    }
    
    func getDisplayItems() -> [ListItemViewModel] {
        return self.items
    }
}
