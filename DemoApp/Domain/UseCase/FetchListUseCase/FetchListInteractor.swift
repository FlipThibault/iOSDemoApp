import Foundation

class FetchListInteractor: NSObject {
    
    var dataSource: ListDataSource
    
    init(with dataSource: ListDataSource) {
        self.dataSource = dataSource
    }
    
}

extension FetchListInteractor: FetchListUseCase {
    
    func fetchList(by id: String, with completion: @escaping (AppListModel, NSError?) -> Void) {
        
        dataSource.get(by: id) { (list, error) in
            completion(list, nil)
        }
        
    }
    
}
