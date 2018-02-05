import Foundation

class AppListItemModel {
    
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

extension AppListItemModel: Equatable {
    static func == (lhs: AppListItemModel, rhs: AppListItemModel) -> Bool {
        return
            lhs.identifier == rhs.identifier
    }
}
