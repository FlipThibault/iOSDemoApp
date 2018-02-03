import Foundation

protocol KeyValueDataSource {
    
    func getPersistedBoolValue(for key:String, _ completion: (_ value: Bool) -> Void)
    func setPersistedBoolValue(value:Bool, for key:String, _ completion: (_ success: Bool) -> Void)

}
