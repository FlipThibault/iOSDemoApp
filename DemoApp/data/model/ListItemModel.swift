import Foundation

class ListItemModel {
    var identifier: String
    var description: String
    var dateCreated: Date
    var orderByDate: Date
    
    init() {
        self.identifier = UUID.init().uuidString
        self.description = ""
        self.dateCreated = Date()
        self.orderByDate = Date()
    }
}
