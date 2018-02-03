import Foundation

class AppListModel {
    
    var identifier: String
    var name: String
    var dateCreated: Date
    var orderByDate: Date
    var items: [AppListItemModel]
    
    init(with name: String) {
        self.identifier = UUID.init().uuidString
        self.name = name
        self.dateCreated = Date()
        self.orderByDate = Date()
        self.items = []
    }
    
}

