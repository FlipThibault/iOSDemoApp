import Foundation

protocol ListViewInput: NSObjectProtocol {
    
    func populateViewWithData()
    func setEditMode(isEditing: Bool)
    func showError(listViewErrorViewModel: ErrorViewModel)
    func showEmptyView()
    func hideEmptyView()

    func notifyItemUpdated(at indexPath: IndexPath)
    func notifyItemAdded(at indexPath: IndexPath)
    func notifyItemRemoved(at indexPath: IndexPath)

}

protocol ListViewOutput: NSObjectProtocol {
    
    func isLoaded()
    
    func addItemRequested()
    func toggleEditMode()
    
}
