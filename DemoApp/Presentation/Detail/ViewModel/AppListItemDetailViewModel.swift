import Foundation

class AppListItemDetailViewModel {

    var listItem: AppListItemModel
    
    init(with listItem: AppListItemModel) {
        self.listItem = listItem
    }
    
}

extension AppListItemDetailViewModel: DetailViewModel {
    
    func getText() -> String {
        return self.listItem.descriptionText
    }
    
}

