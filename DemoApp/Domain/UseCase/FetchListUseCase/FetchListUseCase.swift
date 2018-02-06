import Foundation

@objc protocol FetchListUseCase: NSObjectProtocol {
    
    func fetchList(by id: String, with completion: @escaping (AppListModel, NSError?) -> Void)
    
}
