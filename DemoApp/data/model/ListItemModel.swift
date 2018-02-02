import Foundation

class ListItemModel {
    
    var id : String
    var description : String
    var dateCreated : Date
    var orderByDate: Date
    
    init() {
        self.id = UUID.init().uuidString
        self.description = ""
        self.dateCreated = Date()
        self.orderByDate = Date()
    }
    
}
