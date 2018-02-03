import Foundation
import CoreData

class ListModel: NSManagedObject {
    
    @NSManaged fileprivate(set) var identifier: String
    @NSManaged fileprivate(set) var name: String
    @NSManaged fileprivate(set) var dateCreated: Date
    @NSManaged fileprivate(set) var orderByDate: Date
    @NSManaged fileprivate(set) var items: [ListItemModel]
    
}
