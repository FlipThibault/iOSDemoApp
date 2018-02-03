import Foundation

class FetchListInteractor: NSObject {
    
    var dataSource: ListDataSource
    
    init(with dataSource: ListDataSource) {
        self.dataSource = dataSource
    }
    
}

extension FetchListInteractor: FetchListUseCase {
    
    func fetchList(by id: String, with completion: (AppListModel) -> Void) {
        
        dataSource.get(by: id) { (list) in
            completion(list)
        }
        
    }
    
}
