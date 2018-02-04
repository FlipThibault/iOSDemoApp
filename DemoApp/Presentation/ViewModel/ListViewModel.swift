import Foundation

class ListViewModel {
    
    var identifier: String?
    var displayName: String?
    var items: [ListItemViewModel]
    
    init(with identifier: String, and displayName: String, and items: [ListItemViewModel]) {
        self.identifier = identifier
        self.displayName = displayName
        self.items = items
    }
    
}
