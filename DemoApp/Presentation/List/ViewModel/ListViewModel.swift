import Foundation

@objc protocol ListViewModel: NSObjectProtocol {
    
    func isEditing() -> Bool
    func getDisplayName() -> String
    func getDisplayItems() -> [ListItemViewModel]
    
}
