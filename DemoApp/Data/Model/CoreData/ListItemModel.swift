import Foundation
import CoreData

class ListItemModel: NSManagedObject {
    
    @NSManaged fileprivate(set) var identifier: String
    @NSManaged fileprivate(set) var text: String
    @NSManaged fileprivate(set) var dateCreated: Date
    @NSManaged fileprivate(set) var orderByDate: Date
    @NSManaged fileprivate(set) var list: ListModel

}
