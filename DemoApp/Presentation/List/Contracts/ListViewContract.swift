import Foundation

protocol ListViewInput: NSObjectProtocol {
    
    func populateView(listViewModel: ListViewModel)
    
}

protocol ListViewOutput: NSObjectProtocol {
    
    func isLoaded()
    
}
