import Foundation

class AppListItemModel {
    
    var identifier: String
    var description: String
    var dateCreated: Date
    var orderByDate: Date
    var list: AppListModel
    
    init(with list: AppListModel) {
        self.identifier = UUID.init().uuidString
        self.description = ""
        self.dateCreated = Date()
        self.orderByDate = Date()
        self.list = list
    }
    
}

