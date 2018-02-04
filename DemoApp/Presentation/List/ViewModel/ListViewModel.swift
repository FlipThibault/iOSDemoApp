import Foundation

protocol ListViewModel {
    
    func isEditing() -> Bool
    func getDisplayName() -> String
    func getDisplayItems() -> [ListItemViewModel]
    
}
