import Foundation

class DeleteItemInteractor: NSObject {
    
    var dataSource: ListItemDataSource
    
    init(with dataSource: ListItemDataSource) {
        self.dataSource = dataSource
    }
    
}

extension DeleteItemInteractor: DeleteItemUseCase {
    
    func deleteItem(item: AppListItemModel, from list: AppListModel, with completion: (Bool) -> Void) {
        
        dataSource.delete(by: item.identifier) { (success) in
            completion(success)
        }
    }
    
}
