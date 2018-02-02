import Foundation

class ListModel {
    
    var id : String
    var name : String
    var dateCreated : Date
    var orderByDate: Date
    var items: [ListItemModel]
    
    init(with name: String) {
        self.id = UUID.init().uuidString
        self.name = name
        self.dateCreated = Date()
        self.orderByDate = Date()
        self.items = []
    }
    
}
