import Foundation

class EmptyItemDescriptionError: NSObject {
    
}

extension EmptyItemDescriptionError: ErrorViewModel {
    
    func getErrorTitle() -> String {
        return NSLocalizedString("error.emtpyitem.title", comment: "")
    }
    
    func getErrorMessage() -> String {
        return NSLocalizedString("error.emtpyitem.message", comment: "")
    }
}
