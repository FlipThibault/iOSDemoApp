import Foundation

@objc protocol DataStoreConfigurator: NSObjectProtocol {
    func initDataStore(_ completion: @escaping () -> Void)
}
