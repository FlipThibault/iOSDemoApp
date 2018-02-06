import Foundation

@objc class AppListItemModel: NSObject {
    
    var identifier: String
    var descriptionText: String
    var dateCreated: Date
    var orderByDate: Date
    
    override init() {
        self.identifier = UUID.init().uuidString
        self.descriptionText = ""
        self.dateCreated = Date()
        self.orderByDate = Date()
    }

    static func == (lhs: AppListItemModel, rhs: AppListItemModel) -> Bool {
        return
            lhs.identifier == rhs.identifier
    }
}
