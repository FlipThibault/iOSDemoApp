import Foundation

protocol ListViewInput: NSObjectProtocol {
    
    func populateViewWithData(listViewModel: ListViewModel)
    func setEditMode(isEditing: Bool)
    
}

protocol ListViewOutput: NSObjectProtocol {
    
    func isLoaded()
    
    func addItemRequested()
    func toggleEditMode()
    
}
