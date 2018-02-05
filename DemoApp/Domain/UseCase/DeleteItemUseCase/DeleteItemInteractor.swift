import Foundation

class DeleteItemInteractor: NSObject {
    
    var dataSource: ListItemDataSource
    
    init(with dataSource: ListItemDataSource) {
        self.dataSource = dataSource
    }
    
}

extension DeleteItemInteractor: DeleteItemUseCase {
    
    func deleteItem(item: AppListItemModel, from list: AppListModel, with completion:  @escaping (AppListItemModel, NSError?) -> Void) {
        
        if let index = list.items.index(of: item) {
            list.items.remove(at: index)
            
            completion(item, nil)
            
            dataSource.delete(by: item.identifier) { (error) in
                if error != nil {
                    completion(item, error)
                }
            }
        } else {
            completion(item, NSError(with: Constants.ErrorMessages.itemNotFoundInCollection))
        }
        
    }
    
}
