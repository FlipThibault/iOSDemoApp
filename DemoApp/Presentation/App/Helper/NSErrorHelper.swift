import Foundation

extension NSError {
    
    convenience init(with message: String) {
        self.init(domain: message, code: 0, userInfo: nil)
    }
    
}
