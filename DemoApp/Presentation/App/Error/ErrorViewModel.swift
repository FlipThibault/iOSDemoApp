import Foundation

@objc protocol ErrorViewModel: NSObjectProtocol {
    
    func getErrorTitle() -> String
    func getErrorMessage() -> String
    
}
