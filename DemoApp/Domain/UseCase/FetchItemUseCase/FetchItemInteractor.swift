import Foundation

class FetchItemInteractor: NSObject {
    
    var dataSource: ListItemDataSource
    
    init(with dataSource: ListItemDataSource) {
        self.dataSource = dataSource
    }
    
}

extension FetchItemInteractor: FetchItemUseCase {

    func fetchItem(by identifier: String, from list: AppListModel, with completion: (AppListItemModel) -> Void) {

        dataSource.get(by: identifier) { (item) in
            completion(item)
        }

    }

}
