import Foundation

class ListItemViewModel {
    
    var identifier: String
    var displayText: String
    
    init(with identifier: String, and displayText: String) {
        self.identifier = identifier
        self.displayText = displayText
    }
    
}
